import 'dart:ffi';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pizza_food/screen/models/pizza_model.dart';

import '../../component/tools/enum/pizza_type.dart';
import '../../component/widgets/add_pizza_button.dart';
import '../../component/widgets/remove_pizza_button.dart';
import '../bloc/pizza_bloc.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('The Pizza Bloc'),
        centerTitle: true,
        backgroundColor: Colors.orange[100],
      ),
      body: Center(
        child: BlocBuilder<PizzaBloc, PizzaState>(
          builder: (context, state) {
            if (state is PizzaInitial) {
              return const CircularProgressIndicator(color: Colors.orange);
            }
            if (state is PizzaLoaded) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${state.pizzas.length}',
                    style: const TextStyle(
                        fontSize: 60, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height / 1.5,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                        alignment: Alignment.center,
                        clipBehavior: Clip.none,
                        children: [
                          for (int index = 0;
                              index < state.pizzas.length;
                              index++)
                            Positioned(
                              left: Random().nextInt(250).toDouble(),
                              top: Random().nextInt(400).toDouble(),
                              child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child:
                                      Image.asset(state.pizzas[index].image)),
                            )
                        ]),
                  )
                ],
              );
            } else {
              return const Text('Something when wrong!');
            }
          },
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          AddPizzaButton(
              type: PizzaType.two,
              onTap: () {
                context.read<PizzaBloc>().add(AddPizza(pizza: Pizza.pizzas[0]));
              }),
          const SizedBox(
            height: 12,
          ),
          const SizedBox(
            height: 12,
          ),
          RemovePizzaButton(
              type: PizzaType.two,
              onTap: () {
                context
                    .read<PizzaBloc>()
                    .add(RemovePizza(pizza: Pizza.pizzas[0]));
              }),
          const SizedBox(
            height: 12,
          ),
          AddPizzaButton(
              type: PizzaType.two,
              onTap: () {
                context.read<PizzaBloc>().add(AddPizza(pizza: Pizza.pizzas[1]));
              }),
          const SizedBox(
            height: 12,
          ),
          RemovePizzaButton(
              type: PizzaType.two,
              onTap: () {
                context
                    .read<PizzaBloc>()
                    .add(RemovePizza(pizza: Pizza.pizzas[1]));
              })
        ],
      ),
    );
  }
}
