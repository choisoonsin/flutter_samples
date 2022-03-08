part of 'cart_bloc.dart';

abstract class CartState extends Equatable {}

class ListPresented extends CartState {
  ListPresented(this.carts) : super();

  final List<Cart> carts;

  ListPresented copyWith({List<Cart>? carts}) {
    return ListPresented(carts ?? this.carts);
  }

  @override
  List<Object> get props => [carts];
}

class CartAdded extends CartState {
  CartAdded(this.carts) : super();

  final List<Cart> carts;

  @override
  List<Object> get props => [carts];
}

class CartDeleted extends CartState {
  CartDeleted(this.carts) : super();

  final List<Cart> carts;

  @override
  List<Object> get props => [carts];
}
