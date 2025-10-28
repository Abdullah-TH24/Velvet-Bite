import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/home/presentation/screens/data/nav_bar_items.dart';
import 'package:velvet_bite/features/home/presentation/screens/home.dart';

// ignore: must_be_immutable
class MainHome extends StatefulWidget {
  const MainHome({super.key});

  @override
  State<MainHome> createState() => _MainHomeState();
}

class _MainHomeState extends State<MainHome> {
  int currentIndex = 0;
  final List pages = [
    const Home(),
    const Home(),
    const Home(),
    const Home(),
    const Home(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: pages[currentIndex],
      bottomNavigationBar: ClipRRect(
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(8),
          topRight: Radius.circular(8),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
          child: Container(
            height: 85,
            decoration: BoxDecoration(
              color: Colors.transparent,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(100),
                  offset: const Offset(0, 0),
                ),
              ],
            ),
            child: Center(
              child: BottomNavigationBar(
                iconSize: 27.5,
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.transparent,
                elevation: 0,
                currentIndex: currentIndex,
                selectedItemColor: AppColors.secondaryText,
                unselectedItemColor: AppColors.primaryText,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                items: List.generate(
                  navBarItems.length,
                  (index) => BottomNavigationBarItem(
                    icon: IconButton(
                      onPressed: () => setState(() => currentIndex = index),
                      icon: navBarItems[index].icon,
                    ),
                    label: '',
                    tooltip: navBarItems[index].tooltip,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
