import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.pink,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            color: Colors.pink.shade100,
            child: Column(
              children: [
                const CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile.png'),
                ),
                const SizedBox(height: 10),
                const Text(
                  'John Doe',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Text(
                  'johndoe@example.com',
                  style: TextStyle(fontSize: 16, color: Colors.grey[700]),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                ListTile(
                  leading: const Icon(Icons.settings, color: Colors.pink),
                  title: const Text('Account Settings'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.notifications, color: Colors.pink),
                  title: const Text('Notifications'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.privacy_tip, color: Colors.pink),
                  title: const Text('Privacy'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.security, color: Colors.pink),
                  title: const Text('Security'),
                  onTap: () {},
                ),
                ListTile(
                  leading: const Icon(Icons.help, color: Colors.pink),
                  title: const Text('Help & Support'),
                  onTap: () {},
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
