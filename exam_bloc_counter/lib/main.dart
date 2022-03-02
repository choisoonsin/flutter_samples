import 'package:bloc/bloc.dart';
import 'package:exam_bloc_counter/app.dart';
import 'package:flutter/widgets.dart';

import 'counter_observer.dart';

void main() {
  BlocOverrides.runZoned(() => runApp(const CounterApp()),
      blocObserver: CounterObserver());
}
