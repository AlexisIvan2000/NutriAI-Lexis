import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:front_end/screens/home.dart';
import 'package:front_end/widgets/profile/avatar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void logout() {
      FirebaseAuth.instance.signOut().then((_) {
        Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (context) => const HomeScreen()),
          (Route<dynamic> route) => false,
        );
      });
    }

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
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 20),             
              const Avatar(),              
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  logout();
                },
                style: ButtonStyle(
                  backgroundColor: WidgetStateProperty.all(
                    const Color.fromARGB(7, 27, 28, 27),
                  ),
                ),
                child: const Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Icon(Icons.logout, color: Color.fromARGB(255, 0, 0, 0)),
                    SizedBox(width: 8),
                    Text(
                      'Logout',
                      style: TextStyle(
                        color: Color.fromARGB(255, 0, 0, 0),
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
