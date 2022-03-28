import 'package:exam_bloc_cart/view/view.dart';

import 'package:exam_bloc_cart/bloc/cart_bloc.dart';
import 'package:exam_bloc_cart/models/cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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

class _CartIcon extends StatelessWidget {
  const _CartIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    void onTap() {
      Navigator.of(context)
          .push<void>(CartListPage.route(context.read<CartBloc>()));
    }

    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
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
                        return Center(
                            child: Text(state.carts.length.toString()));
                      } else {
                        return Container();
                      }
                    },
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
