import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'menu_model.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MenuModel(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warteg Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: WartegMenu(),
    );
  }
}

class WartegMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu Warteg'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Text(
              'Menu Makanan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Consumer<MenuModel>(
              builder: (context, menuModel, child) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: menuModel.foodMenu.map((menuItem) {
                    return MenuItemWidget(
                      image: menuItem.image,
                      name: menuItem.name,
                    );
                  }).toList(),
                );
              },
            ),
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.grey[300],
            child: Text(
              'Menu Minuman',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: Consumer<MenuModel>(
              builder: (context, menuModel, child) {
                return ListView(
                  scrollDirection: Axis.horizontal,
                  children: menuModel.drinkMenu.map((menuItem) {
                    return MenuItemWidget(
                      image: menuItem.image,
                      name: menuItem.name,
                    );
                  }).toList(),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}

class MenuItemWidget extends StatelessWidget {
  final String image;
  final String name;

  const MenuItemWidget({
    Key? key,
    required this.image,
    required this.name,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      width: 150,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            image,
            height: 100,
            width: 100,
            fit: BoxFit.cover,
          ),
          SizedBox(height: 10),
          Text(
            name,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
