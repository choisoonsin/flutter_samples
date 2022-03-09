import 'package:exam_bloc_cart/bloc/cart_bloc.dart';
import 'package:test/test.dart';
import 'package:bloc_test/bloc_test.dart';

void main() {
  group('CartBloc', () {
    late CartBloc cartBloc;

    setUp(() {
      cartBloc = CartBloc();
    });

    test('initial state is empty', () {
      expect(cartBloc.state, []);
    });
  });
}
