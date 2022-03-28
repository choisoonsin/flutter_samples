import 'package:device_preview/device_preview.dart';
import 'package:exam_bloc_cart/simple_bloc_observer.dart';
import 'package:exam_bloc_cart/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'home.dart';

void main() {
  BlocOverrides.runZoned(() {
    return runApp(DevicePreview(builder: (context) => MyApp()));
  }, blocObserver: SimpleBlocObserver());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 실행 플랫폼 구분
    print(Theme.of(context).platform);

    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: BlocProvider(create: (context) => CartBloc(), child: const Home()),
    );
  }
}
