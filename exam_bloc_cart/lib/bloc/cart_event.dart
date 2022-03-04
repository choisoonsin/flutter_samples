part of 'cart_bloc.dart';

@immutable
abstract class CartEvent {
  final Cart cart;

  CartEvent(this.cart);
}

class CartAdd extends CartEvent {
  CartAdd(Cart cart) : super(cart);
}

class CartDelete extends CartEvent {
  CartDelete(Cart cart) : super(cart);
}
