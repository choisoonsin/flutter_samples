import 'package:exam_bloc_cart/bloc/cart_bloc.dart';
import 'package:exam_bloc_cart/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  BlocOverrides.runZoned(() {
    return runApp(const MyApp());
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => CartBloc(), child: const Home()),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  void _onClickAddButton({required String itemName}) =>
      {context.read<CartBloc>().add(CartAdd(Cart(itemName)))};

  List<String> items = [
    'Snack1',
    'Snack2',
    'Snack3',
    'Snack4',
    'Snack5',
    'Snack6'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [
          Icon(Icons.shopping_cart_outlined),
          // BlocBuilder<CartBloc, CartState>(
          //   bloc: CartBloc(),
          //   builder: (context, state) {
          //     return Text(context.read<CartBloc>().carts.length.toString());
          //   },
          // )
          BlocBuilder<CartBloc, CartState>(
            builder: ((context, state) {
              return Text(state.carts.length.toString());
            }),
          )
        ],
      ),
      body: ListView.builder(
        itemCount: items.length,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 5),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(items[index]),
                  ElevatedButton(
                      onPressed: () =>
                          _onClickAddButton(itemName: items[index]),
                      child: Text('ADD'))
                ]),
          );
        },
      ),
    );
  }
}
