import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import '../../services/location_service.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class SafeAreasPage extends StatefulWidget {
  @override
  _SafeAreasPageState createState() => _SafeAreasPageState();
}

class _SafeAreasPageState extends State<SafeAreasPage> {
  LatLng? _userLocation;
  List<Marker> _placeMarkers = [];
  final LocationService _locationService = LocationService();

  @override
  void initState() {
    super.initState();
    _loadSafePlaces();
  }

  Future<void> _loadSafePlaces() async {
    try {
      final position = await _locationService.getUserLocation();
      final lat = position.latitude;
      final lon = position.longitude;

      setState(() {
        _userLocation = LatLng(lat, lon);
      });

      List<Map<String, dynamic>> places = await _fetchNearbyPlaces(lat, lon);

      setState(() {
        _placeMarkers =
            places.map((place) {
              return Marker(
                width: 40,
                height: 40,
                point: LatLng(place['lat'], place['lon']),
                child: Icon(
                  place['type'] == 'police'
                      ? Icons.local_police
                      : Icons.local_hospital,
                  color:
                      place['type'] == 'police'
                          ? Colors.blue
                          : Colors.redAccent,
                  size: 30,
                ),
              );
            }).toList();
      });
    } catch (e) {
      print("Error: $e");
    }
  }

  Future<List<Map<String, dynamic>>> _fetchNearbyPlaces(
    double lat,
    double lon,
  ) async {
    final url = Uri.parse(
      'https://overpass-api.de/api/interpreter?data=[out:json];(node["amenity"="police"](around:3000,$lat,$lon);node["amenity"="hospital"](around:3000,$lat,$lon););out body;',
    );

    final response = await http.get(url);
    if (response.statusCode != 200)
      throw Exception('Failed to fetch from Overpass API');

    final data = json.decode(response.body);
    return (data['elements'] as List).map((e) {
      return {
        'lat': e['lat'],
        'lon': e['lon'],
        'name': e['tags']?['name'] ?? 'Unknown',
        'type': e['tags']?['amenity'],
      };
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nearby Safe Places"),
        backgroundColor: Colors.pink,
      ),
      body:
          _userLocation == null
              ? const Center(child: CircularProgressIndicator())
              : FlutterMap(
                options: MapOptions(
                  initialCenter: _userLocation!,
                  initialZoom: 14.0,
                ),
                children: [
                  TileLayer(
                    urlTemplate:
                        'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                    userAgentPackageName: 'com.example.asprojects',
                  ),
                  MarkerLayer(
                    markers: [
                      Marker(
                        width: 40,
                        height: 40,
                        point: _userLocation!,
                        child: const Icon(
                          Icons.person_pin_circle,
                          color: Colors.green,
                          size: 40,
                        ),
                      ),
                      ..._placeMarkers,
                    ],
                  ),
                ],
              ),
    );
  }
}
