import 'package:flutter/material.dart';

import 'package:flutter_samples/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme:
          ThemeData(primaryColor: Colors.white, backgroundColor: Colors.black),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    Text('검색'),
    Text('즐겨찾기'),
    Text('주문내역'),
    Text('My 이츠'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Icon(
              Icons.location_on_outlined,
              size: 20,
              color: Colors.black,
            ),
            SizedBox(width: 10),
            Text(
              '집',
              style: TextStyle(color: Colors.black),
            ),
            Icon(Icons.keyboard_arrow_down_outlined,
                color: Color.fromARGB(255, 46, 34, 214), size: 30)
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(right: 10),
            child: const Icon(Icons.search, color: Colors.black, size: 28),
          )
        ],
      ),
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: '홈'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
              ),
              label: '검색'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.favorite_border_outlined,
              ),
              label: '즐겨찾기'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.inventory_outlined,
              ),
              label: '주문내역'),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person_outline,
              ),
              label: 'My 이츠')
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        showUnselectedLabels: true,
        unselectedItemColor: Colors.black54,
        onTap: _onItemTapped,
      ),
    );
  }
}
