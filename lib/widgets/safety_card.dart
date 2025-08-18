import 'package:flutter/material.dart';

class SafetyCard extends StatelessWidget {
  final IconData icon;
  final String title;

  const SafetyCard({super.key, required this.icon, required this.title});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.pink.shade100,
      child: InkWell(
        onTap: () {},
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 40, color: Colors.pink),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
