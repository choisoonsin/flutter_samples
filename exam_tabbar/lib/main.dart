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
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
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
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: DefaultTabController(
            length: 3,
            child: Column(
              children: [
                Container(
                  color: Colors.black12,
                  height: 100,
                ),
                Container(
                  // color: Colors.black54,
                  child: TabBar(
                    unselectedLabelColor: Colors.redAccent,
                    indicatorSize: TabBarIndicatorSize.label,
                    indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.redAccent),
                    tabs: [
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("APPS"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("MOVIES"),
                          ),
                        ),
                      ),
                      Tab(
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border: Border.all(
                                  color: Colors.redAccent, width: 1)),
                          child: Align(
                            alignment: Alignment.center,
                            child: Text("GAMES"),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                  child: const TabBarView(
                    children: [
                      Center(
                        child: _SubTabPage1(),
                      ),
                      Center(
                        child: Text('123'),
                      ),
                      Center(
                        child: Text('123'),
                      ),
                    ],
                  ),
                ))
              ],
            )));
  }
}

class _SubTabPage1 extends StatefulWidget {
  const _SubTabPage1({Key? key}) : super(key: key);

  @override
  State<_SubTabPage1> createState() => _SubTabPage1State();
}

class _SubTabPage1State extends State<_SubTabPage1> {
  // scroll controller for the TabBar
  ScrollController _scrollController = new ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    _scrollController.addListener(() {
      print(_scrollController.offset);
      /**
       * BouncingScrollPhysics을 적용한 경우
       * 스크롤 범위 바깥으로 나가면 outOfRange = true
       */
      print(_scrollController.position.outOfRange);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      controller: _scrollController,
      children: [
        Container(
          child: DefaultTabController(
            length: 2,
            child: Column(
              children: [
                TabBar(
                  onTap: (tabIndex) => print(tabIndex),
                  padding: EdgeInsets.all(2),
                  // indicator: BoxDecoration(color: Colors.blueAccent),
                  labelColor: Colors.black,
                  indicatorColor: Colors.amberAccent,
                  indicatorWeight: 10,
                  tabs: [
                    Tab(
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Colors.black12),
                        child: Column(
                          children: [Icon(Icons.home), Text('HOME')],
                        ),
                      ),
                    ),
                    Tab(
                      text: 'sub 2',
                    )
                  ],
                ),
                Container(
                  height: 200,
                  color: Colors.blueAccent,
                  child: TabBarView(
                    children: [
                      Center(
                        child: Text('sub1 content'),
                      ),
                      Center(
                        child: Text('sub2 content'),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Container(
          height: 400,
          color: Colors.yellow,
        ),
      ],
    );
  }
}
