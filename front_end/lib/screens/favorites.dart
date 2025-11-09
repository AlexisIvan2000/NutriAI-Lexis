import 'package:flutter/material.dart';
import 'package:front_end/widgets/navigation_bar.dart';

class FavoritesScreen extends StatelessWidget {
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favorites'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Center(
            child: Text('Your favorite recipes will appear here.'),
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBr(),
    );
  }
  
}