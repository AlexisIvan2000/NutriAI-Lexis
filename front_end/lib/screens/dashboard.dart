import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:front_end/models/user.dart';
import 'package:front_end/widgets/image_animation.dart';
import 'package:front_end/widgets/recipes_cat.dart';
import 'package:front_end/widgets/navigation_bar.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  AppUser? currentUser;

  @override
  void initState() {
    super.initState();
    _loadUser();
  }

  Future<void> _loadUser() async {
    final authUser = FirebaseAuth.instance.currentUser;
    if (authUser == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('users')
        .doc(authUser.uid)
        .get();

    if (doc.exists) {
      setState(() {
        currentUser = AppUser.fromMap(authUser.uid, doc.data()!);
      });
    }
  }

  final List<String> _images = [
    'assets/images/img1.png',
    'assets/images/img2.png',
    'assets/images/img3.png',
    'assets/images/img4.png',
    'assets/images/img5.png',
    'assets/images/meal_3.png',
  ];

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    for (final img in _images) {
      precacheImage(AssetImage(img), context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Row(
            children: [
              Image.asset('assets/images/logo.png', width: 34, height: 34),
              const SizedBox(width: 10),
              Text(
                currentUser == null
                    ? 'Loading...'
                    : 'Welcome, ${currentUser!.firstName}',
                style:
                    Theme.of(context).textTheme.bodyLarge?.copyWith(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Theme.of(context).colorScheme.onSurface,
                    ) ??
                    const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      color: Colors.black,
                    ),
              ),
              const Spacer(),
              IconButton(onPressed: () {}, icon: const Icon(Icons.person)),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.all(15),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.75,
                    child: Text(
                      'Find meals that match your goals, your diet, and what you have at home.',
                      style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for recipes, meals, ingredients...',
                    prefixIcon: Icon(Icons.search),
                    contentPadding: EdgeInsets.symmetric(
                      vertical: 0,
                      horizontal: 12,
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
                ImageAnimation(imageList: _images),
                const SizedBox(height: 15),
                Row(
                  children: [
                    Text(
                      'Recipes categories',
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        fontSize: 18,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const RecipesCat(),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
        bottomNavigationBar: Navigation(),
      ),
    );
  }
}
