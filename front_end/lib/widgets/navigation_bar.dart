import 'package:flutter/material.dart';
import 'package:front_end/main.dart';
import 'package:front_end/screens/dashboard.dart';
import 'package:front_end/screens/favorites.dart';
import 'package:front_end/screens/meals.dart';


class Navigation extends StatelessWidget {
  const Navigation({super.key});

  @override
  Widget build(BuildContext context) {
   return BottomNavigationBar(
    type: BottomNavigationBarType.fixed,
    backgroundColor: colorScheme.surface,
    onTap: (index) {
      if (index == 0) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const DashboardScreen(),
          ),
        );
      }
      if (index == 1) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const FavoritesScreen(),
          ),
        );
      }
      if (index == 2) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => const MealsScreen(),
          ),
        );
      }
    },
    items: [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Home',   
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.favorite),
        label: 'Favorites',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.food_bank),
        label: 'Meals',
      ),
    ],
   );
  }
}
