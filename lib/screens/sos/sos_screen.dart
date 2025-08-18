import 'package:flutter/material.dart';
import '../../widgets/safety_card.dart';

class SOSPage extends StatelessWidget {
  const SOSPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Safety Dashboard',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.pink,
      ),
      body: Column(
        children: [
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: const EdgeInsets.all(10),
              children: const [
                SafetyCard(icon: Icons.sos, title: 'SOS'),
                SafetyCard(icon: Icons.tips_and_updates, title: 'Safety Tips'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
