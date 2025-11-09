import 'package:flutter/material.dart';
import 'package:front_end/widgets/navigation_bar.dart';

class MealsScreen extends StatelessWidget {
  const MealsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Meals'),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: const Center(
            child: Text('Your meals will appear here.'),
          ),
        ),
      ),
      bottomNavigationBar: const NavigationBr(),
    );
  }
  
}