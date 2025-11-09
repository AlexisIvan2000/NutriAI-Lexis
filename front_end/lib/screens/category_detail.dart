import 'package:flutter/material.dart';
import 'package:front_end/models/category.dart';


class CategoryDetailScreen extends StatelessWidget {
  const CategoryDetailScreen({super.key, required this.category});

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.name),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Find  recipes in ${category.name}...',
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(26),
                  ),
                ), 
              ), 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(onPressed: () {}, icon: const Icon(Icons.filter_list)),
                  IconButton(onPressed: () {}, icon: const Icon(Icons.refresh)),
                ],
             ),
            ],
          ),
        ),
      ),
    );
  }
}