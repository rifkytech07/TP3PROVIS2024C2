import 'package:flutter/material.dart';

class MenuModel with ChangeNotifier {
  final List<MenuItem> foodMenu = [
    MenuItem(image: 'https://picsum.photos/id/63/200/300', name: 'Nasi Goreng'),
    MenuItem(image: 'https://picsum.photos/id/63/200/300', name: 'Ayam Goreng'),
    // Add more food items as needed
  ];

  final List<MenuItem> drinkMenu = [
    MenuItem(image: 'https://picsum.photos/id/63/200/300', name: 'Es Teh'),
    MenuItem(image: 'https://picsum.photos/id/63/200/300', name: 'Es Jeruk'),
    // Add more drink items as needed
  ];
}

class MenuItem {
  final String image;
  final String name;

  MenuItem({required this.image, required this.name});
}
