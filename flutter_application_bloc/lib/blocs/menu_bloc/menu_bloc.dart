import 'package:bloc/bloc.dart';
import 'menu_event.dart';
import 'menu_state.dart';

class MenuBloc extends Bloc<MenuEvent, MenuState> {
  MenuBloc() : super(MenuInitial()) {
    on<LoadMenu>((event, emit) {
      final foodMenu = [
        MenuItem(image: 'https://picsum.photos/id/63/200/300', name: 'Nasi Goreng'),
        MenuItem(image: 'https://picsum.photos/id/63/200/300', name: 'Ayam Goreng'),
        // Add more food items as needed
      ];

      final drinkMenu = [
        MenuItem(image: 'https://picsum.photos/id/63/200/300', name: 'Es Teh'),
        MenuItem(image: 'https://picsum.photos/id/63/200/300', name: 'Es Jeruk'),
        // Add more drink items as needed
      ];

      emit(MenuLoaded(foodMenu: foodMenu, drinkMenu: drinkMenu));
    });
  }
}
