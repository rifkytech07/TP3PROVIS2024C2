import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class MenuItem {
  final String image;
  final String name;

  MenuItem({required this.image, required this.name});
}

abstract class MenuState extends Equatable {
  const MenuState();

  @override
  List<Object> get props => [];
}

class MenuInitial extends MenuState {}

class MenuLoaded extends MenuState {
  final List<MenuItem> foodMenu;
  final List<MenuItem> drinkMenu;

  MenuLoaded({required this.foodMenu, required this.drinkMenu});

  @override
  List<Object> get props => [foodMenu, drinkMenu];
}
