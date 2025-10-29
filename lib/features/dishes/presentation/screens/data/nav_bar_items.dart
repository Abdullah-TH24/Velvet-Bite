import 'package:flutter/material.dart';
import 'package:velvet_bite/features/dishes/data/models/nav_bar_model.dart';

List<NavBarModel> navBarItems = [
  NavBarModel(icon: const Icon(Icons.home_outlined), tooltip: 'Home'),
  NavBarModel(icon: const Icon(Icons.email_outlined), tooltip: 'Email'),
  NavBarModel(icon: const Icon(Icons.person_2_outlined), tooltip: 'Profile'),
  NavBarModel(icon: const Icon(Icons.settings_outlined), tooltip: 'Settings'),
  NavBarModel(
    icon: const Icon(Icons.shopping_basket_outlined),
    tooltip: 'Cart',
  ),
];
