import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:exam_bloc_cart/models/cart.dart';
import 'package:meta/meta.dart';

part 'cart_event.dart';
part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc() : super(ListPresented([])) {
    // UI 에 응답하는 부분으로 try catch로 에러 처리 해야 함.
    on<CartAdd>((event, emit) {
      carts.add(event.cart);
      emit(CartAdded(carts));
      emit(ListPresented(carts));
    });
  }

  List<Cart> carts = [];
}
