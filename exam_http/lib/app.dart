import 'package:device_preview/device_preview.dart';
import 'package:exam_http/api/fake_post_api.dart';
import 'package:exam_http/view/homepage.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      debugShowCheckedModeBanner: false,
      home: HomePage(fakePostApi: FakePostApi()),
    );
  }
}
