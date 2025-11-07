import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'NutriAI Lexis',
          style:
              Theme.of(context).textTheme.bodyLarge?.copyWith(
                fontSize: 18,
                color: Theme.of(context).colorScheme.onSurface,
              ) ??
              const TextStyle(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: const Center(child: Text('Welcome to the Dashboard!')),
    );
  }
}
