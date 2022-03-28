import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/cart_bloc.dart';

class CartListPage extends StatelessWidget {
  static Route route(CartBloc cartBloc) {
    return MaterialPageRoute<void>(
      builder: (_) => BlocProvider.value(
        value: cartBloc,
        child: CartListPage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: BlocBuilder<CartBloc, CartState>(
        bloc: context.read<CartBloc>(),
        builder: (context, state) {
          if (state is CartState) {
            return ListView.builder(
                itemCount: state.carts.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(state.carts[index].name),
                  );
                });
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
