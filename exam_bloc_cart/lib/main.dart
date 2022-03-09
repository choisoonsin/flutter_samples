import 'package:flutter/foundation.dart' show TargetPlatform;

import 'package:exam_bloc_cart/bloc/cart_bloc.dart';
import 'package:exam_bloc_cart/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimpleBlocObserver extends BlocObserver {
  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print('onCreate -- bloc: ${bloc.runtimeType}');
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print('onEvent -- bloc: ${bloc.runtimeType}, event: $event');
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print('onChange -- bloc: ${bloc.runtimeType}, change: $change');
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print('onTransition -- bloc: ${bloc.runtimeType}, transition: $transition');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print('onError -- bloc: ${bloc.runtimeType}, error: $error');
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onClose(BlocBase bloc) {
    super.onClose(bloc);
    print('onClose -- bloc: ${bloc.runtimeType}');
  }
}

void main() {
  BlocOverrides.runZoned(() {
    return runApp(const MyApp());
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print(Theme.of(context).platform);

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
  void _onClickDeleteButton({required String itemName}) =>
      {context.read<CartBloc>().add(CartDelete(Cart(itemName)))};

  List<String> items = [
    'Snack1',
    'Snack2',
    'Snack3',
    'Snack4',
    'Snack5',
    'Snack6',
    'Snack7',
    'Snack8',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cart'),
        actions: [_CartIcon()],
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
                  Expanded(child: Text(items[index])),
                  ElevatedButton(
                      onPressed: () =>
                          _onClickAddButton(itemName: items[index]),
                      child: Text('ADD')),
                  SizedBox(
                    width: 3,
                  ),
                  ElevatedButton(
                      onPressed: () =>
                          _onClickDeleteButton(itemName: items[index]),
                      child: Text('DELETE')),
                ]),
          );
        },
      ),
    );
  }
}

Widget _CartIcon() {
  return Container(
    padding: EdgeInsets.only(right: 10),
    width: 50,
    child: Stack(
      children: [
        Center(
            child: Icon(
          Icons.shopping_cart_outlined,
          size: 30,
        )),
        Positioned(
            right: 1,
            top: 5,
            child: Container(
              width: 20,
              height: 20,
              decoration:
                  BoxDecoration(shape: BoxShape.circle, color: Colors.red),
              child: BlocBuilder<CartBloc, CartState>(
                builder: (context, state) {
                  if (state is CartState) {
                    return Center(child: Text(state.carts.length.toString()));
                  } else {
                    return Container();
                  }
                },
              ),
            ))
      ],
    ),
  );
}
