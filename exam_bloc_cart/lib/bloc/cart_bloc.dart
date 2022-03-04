import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_bloc_cart/models/cart.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(CartState()) {
    on<CartAdd>((event, emit) {
      state.carts.add(event.cart);
      print(state.carts);
      return emit(state.copyWith(carts: state.carts));
    });
    on<CartDelete>((event, emit) {});
  }

  List<Cart> carts = [];

  void addToCart(Cart cart) {
    carts.add(cart);
  }
}
