import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'blocs/menu_bloc/menu_bloc.dart';
import 'blocs/menu_bloc/menu_event.dart';
import 'blocs/menu_bloc/menu_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Warteg Menu',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => MenuBloc()..add(LoadMenu()),
        child: WartegMenu(),
      ),
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
      body: BlocBuilder<MenuBloc, MenuState>(
        builder: (context, state) {
          if (state is MenuInitial) {
            return Center(child: CircularProgressIndicator());
          } else if (state is MenuLoaded) {
            return Column(
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
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.foodMenu.map((menuItem) {
                      return MenuItemWidget(
                        image: menuItem.image,
                        name: menuItem.name,
                      );
                    }).toList(),
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
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: state.drinkMenu.map((menuItem) {
                      return MenuItemWidget(
                        image: menuItem.image,
                        name: menuItem.name,
                      );
                    }).toList(),
                  ),
                ),
              ],
            );
          } else {
            return Center(child: Text('Failed to load menu'));
          }
        },
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
