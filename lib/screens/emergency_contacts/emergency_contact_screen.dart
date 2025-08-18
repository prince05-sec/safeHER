import 'package:flutter/material.dart';
import '../../widgets/contact_card.dart';

class EmergencyContactsPage extends StatelessWidget {
  const EmergencyContactsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Emergency Contacts',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: ListView(
        padding: const EdgeInsets.all(10),
        children: const [
          ContactCard(name: 'Alice', phone: '123-456-7890', label: 'Trusted'),
          ContactCard(name: 'Bob', phone: '987-654-3210', label: 'Emergency'),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.pink,
        child: const Icon(Icons.add),
        onPressed: () {},
      ),
    );
  }
}
