import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_bloc_cart/models/cart.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(const CartState()) {
    on<CartAdd>((event, emit) {
      emit(state.copyWith(carts: List.of(state.carts)..addAll([event.cart])));
    });

    on<CartDelete>((event, emit) {
      var _carts = List.of(state.carts);
      var _idx = _carts.indexWhere((e) => e.name == event.cart.name);
      if (_idx != -1) _carts.removeAt(_idx);

      emit(state.copyWith(carts: _carts));
    });
  }
}
