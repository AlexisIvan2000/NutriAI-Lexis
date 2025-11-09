import 'package:flutter/material.dart';
import 'package:front_end/data/category_data.dart';
import 'package:front_end/screens/category_detail.dart';

class RecipesCat extends StatelessWidget {
  const RecipesCat({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true, 
      physics: const NeverScrollableScrollPhysics(), 
      padding: const EdgeInsets.symmetric(horizontal: 16),
      itemCount: categories.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 14,
        mainAxisSpacing: 14,
        childAspectRatio: 1.15, 
      ),
      itemBuilder: (ctx, index) {
        final category = categories[index];

       return GestureDetector(
  onTap: () {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => CategoryDetailScreen(category: category),
      ),
    );
  },
  child: Stack(
    children: [
     
      ClipRRect(
        borderRadius: BorderRadius.circular(18),
        child: Image.network(
          category.imageUrl,
          width: double.infinity,
          height: double.infinity,
          fit: BoxFit.cover,
        ),
      ),

      Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.35),
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),            
          ),
          child: Center(
            child: Text(
              category.name,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ),
          ),
        ),
      ),
    ],
  ),
);

      },
    );
  }
}
