
import 'package:equatable/equatable.dart';

class Pizza extends Equatable {
  final String id;
  final String name;
  final String image;

  const Pizza({required this.id, required this.name, required this.image});

  @override
  List<Object?> get props => [id, name, image];

  static List<Pizza> pizzas = [
    Pizza(id: '0', name: 'Pizza', image: 'images/pizza.png'),
    Pizza(id: '1', name: 'Pizza1', image: 'images/pizza1.png')
  ];
}
