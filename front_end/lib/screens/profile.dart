import 'package:flutter/material.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            const Text('Profile'),
            const Spacer(),
            IconButton(
              onPressed: () {
                // Navigate to settings screen or perform settings action
              },
              icon: const Icon(Icons.settings),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          
        ),
      ),
    );
  }
}
