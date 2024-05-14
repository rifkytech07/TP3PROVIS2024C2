import 'package:flutter/material.dart';

class MenuModel with ChangeNotifier {
  final List<MenuItem> foodMenu = [
    MenuItem(image: 'assets/food.jpeg', name: 'Nasi Goreng'),
    MenuItem(image: 'assets/food.jpeg', name: 'Ayam Goreng'),
    // Add more food items as needed
  ];

  final List<MenuItem> drinkMenu = [
    MenuItem(image: 'assets/drink.png', name: 'Es Teh'),
    MenuItem(image: 'assets/drink.png', name: 'Es Jeruk'),
    // Add more drink items as needed
  ];
}

class MenuItem {
  final String image;
  final String name;

  MenuItem({required this.image, required this.name});
}
