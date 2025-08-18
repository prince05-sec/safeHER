import 'package:geolocator/geolocator.dart';
import 'dart:async';

class LocationService {
  static final LocationService _instance = LocationService._internal();
  factory LocationService() => _instance;
  LocationService._internal();

  Stream<Position>? _locationStream;
  StreamSubscription<Position>? _locationSubscription;

  Future<Position> getUserLocation() async {
    try {
      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        throw LocationServiceException(
          'Location services are disabled. Please enable them to continue.',
        );
      }

      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          throw LocationServiceException(
            'Location permissions are denied. Please grant location access to continue.',
          );
        }
      }

      if (permission == LocationPermission.deniedForever) {
        throw LocationServiceException(
          'Location permissions are permanently denied. Please enable them in app settings to continue.',
        );
      }

      // Get current position with timeout
      return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
        timeLimit: const Duration(seconds: 10),
      ).timeout(
        const Duration(seconds: 10),
        onTimeout: () {
          throw LocationServiceException(
            'Location request timed out. Please try again.',
          );
        },
      );
    } catch (e) {
      if (e is LocationServiceException) rethrow;
      throw LocationServiceException('Failed to get location: ${e.toString()}');
    }
  }

  Stream<Position> getLocationStream() {
    _locationStream ??= Geolocator.getPositionStream(
      locationSettings: const LocationSettings(
        accuracy: LocationAccuracy.high,
        distanceFilter: 10, // meters
        timeLimit: Duration(seconds: 30),
      ),
    );
    return _locationStream!;
  }

  void startLocationUpdates(void Function(Position) onLocationUpdate) {
    _locationSubscription?.cancel();
    _locationSubscription = getLocationStream().listen(
      onLocationUpdate,
      onError: (error) {
        throw LocationServiceException('Error in location stream: $error');
      },
    );
  }

  void stopLocationUpdates() {
    _locationSubscription?.cancel();
    _locationSubscription = null;
  }

  Future<bool> isLocationServiceEnabled() async {
    return await Geolocator.isLocationServiceEnabled();
  }

  Future<LocationPermission> checkLocationPermission() async {
    return await Geolocator.checkPermission();
  }
}

class LocationServiceException implements Exception {
  final String message;
  LocationServiceException(this.message);

  @override
  String toString() => message;
}
