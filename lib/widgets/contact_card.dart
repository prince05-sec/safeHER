import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final String name;
  final String phone;
  final String label;

  const ContactCard({
    super.key,
    required this.name,
    required this.phone,
    required this.label,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: const Icon(Icons.person, color: Colors.pink),
        title: Text(name),
        subtitle: Text(phone),
        trailing: Chip(
          label: Text(label, style: const TextStyle(color: Colors.white)),
          backgroundColor: Colors.pink,
        ),
      ),
    );
  }
}
