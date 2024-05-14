import 'package:bloc/bloc.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<LoadMenu>((event, emit) {
      final foodMenu = [
        MenuItem(image: '../assets/food.jpeg', name: 'Nasi Goreng'),
        MenuItem(image: '../assets/food.jpeg', name: 'Ayam Goreng'),
        // Add more food items as needed
      ];

      final drinkMenu = [
        MenuItem(image: '../assets/drink.png', name: 'Es Teh'),
        MenuItem(image: '../assets/drink.png', name: 'Es Jeruk'),
        // Add more drink items as needed
      ];

      emit(MenuLoaded(foodMenu: foodMenu, drinkMenu: drinkMenu));
    });
  }
}
