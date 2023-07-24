import 'package:flutter/material.dart';
import '../tools/enum/pizza_type.dart';

class RemovePizzaButton extends StatelessWidget {
  final PizzaType type;
  VoidCallback onTap;

  RemovePizzaButton({required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: const Icon(Icons.remove),
        backgroundColor: Colors.orange[type == PizzaType.one ? 800 : 500],
        onPressed: onTap);
  }
}
