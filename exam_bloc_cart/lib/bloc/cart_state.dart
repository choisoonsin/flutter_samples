part of 'cart_bloc.dart';

class CartState extends Equatable {
  const CartState({this.carts = const <Cart>[]}) : super();

  final List<Cart> carts;

  CartState copyWith({List<Cart>? carts}) {
    return CartState(carts: carts ?? this.carts);
  }

  @override
  List<Object> get props => [carts];
}
