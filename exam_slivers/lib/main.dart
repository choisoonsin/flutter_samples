import 'package:exam_slivers/screens/simple1.dart';
import 'package:exam_slivers/screens/simple2.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          body: Column(
            children: [
              Container(
                child: TabBar(
                  labelColor: Colors.black87,
                  indicatorColor: Colors.amber,
                  indicatorWeight: 5,
                  tabs: [
                    Tab(
                      text: 'Simple 1',
                    ),
                    Tab(
                      text: 'Simple 2',
                    ),
                    Tab(
                      text: 'Simple 3',
                    )
                  ],
                ),
              ),
              Expanded(
                  child: Container(
                child: TabBarView(
                  children: [
                    Simple1(),
                    Simple2(),
                    Center(child: Text('Simple 3')),
                  ],
                ),
              ))
            ],
          ),
        ));
  }
}
