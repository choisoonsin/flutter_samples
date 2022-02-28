import 'package:clone_carrotmarket/screens/home.dart';
import 'package:clone_carrotmarket/screens/landing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    bool _isSignedIn = false;

    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: Colors.orange[400],
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => LandingScreen(),
          '/home': (context) => HomeScreen()
        });
  }
}
