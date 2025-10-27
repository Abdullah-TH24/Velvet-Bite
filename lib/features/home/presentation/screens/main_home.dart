import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:velvet_bite/features/home/presentation/screens/home.dart';

class MainHome extends StatelessWidget {
  MainHome({super.key});

  final List pages = [
    const Home(),
    const Home(),
    const Home(),
    const Home(),
    const Home(),
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: GlassBottomNavBar(
        currentIndex: currentIndex,
        onTap: (value) {
          log(value.toString());
        },
      ),
    );
  }
}
