import 'package:flutter/material.dart';
import 'package:ws_safe/screens/auth/login_screen.dart';
import 'package:ws_safe/screens/emergency_contacts/emergency_contact_screen.dart';
import 'package:ws_safe/screens/home/home_page.dart';
import 'package:ws_safe/screens/profile/profile_screen.dart';
import 'package:ws_safe/screens/safe_areas/safe_areas_screen.dart';
import 'package:ws_safe/screens/sos/sos_screen.dart';
// import 'app.dart';

void main() {
  runApp(
    MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const LoginScreen(), // Set login as initial route
        '/home': (context) => const HomePage(), // Your main home page

        // '/register': (context) => const register(), // For future registration screen
        // ... other routes
        '/sos': (context) => const SOSPage(), // SOS screen
        '/safe_areas': (context) => SafeAreasPage(), // Safe areas screen
        '/emergency_contacts':
            (context) =>
                const EmergencyContactsPage(), // Emergency contacts screen
        '/profile': (context) => const ProfilePage(), // Profile screen
        // Add other screens as needed
      },
    ),
  );
}
