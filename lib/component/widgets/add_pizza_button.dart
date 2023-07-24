import 'package:flutter/material.dart';
import '../tools/enum/pizza_type.dart';

class AddPizzaButton extends StatelessWidget {
  final PizzaType type;
  VoidCallback onTap;

  AddPizzaButton({required this.type, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        child: Icon(type == PizzaType.one
            ? Icons.local_pizza
            : Icons.local_pizza_outlined),
        backgroundColor: Colors.orange[type == PizzaType.one ? 800 : 500],
        onPressed: onTap);
  }
}
