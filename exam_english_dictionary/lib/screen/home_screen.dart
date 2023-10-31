import 'package:exam_english_dictionary/widget/search_bar.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Widget> widgets = [
    // Content1
    Container(
      height: 200,
      color: Colors.green,
      child: Center(child: Text('단어 목록')),
    ),
    // Content2
    Container(
      height: 200,
      color: Colors.blue,
      child: Center(child: Text('퀴즈')),
    ),
    // Content3
    Container(
      height: 80,
      color: Colors.red,
      child: Center(child: Text('광고')),
    ),
    Container(
      height: 300,
      color: const Color.fromARGB(255, 127, 54, 244),
      child: Center(child: Text('AI 추천')),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(physics: const BouncingScrollPhysics(), slivers: [
      SearchWordBar(isExpanded: true),
      SliverList(
          delegate: SliverChildBuilderDelegate((context, index) {
        return widgets[index];
      }, childCount: widgets.length))
    ]);
  }
}
