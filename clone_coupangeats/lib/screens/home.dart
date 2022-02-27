import 'package:flutter/material.dart';
import 'package:flutter_samples/screens/store/stores.dart';
import 'package:flutter_samples/screens/home/food_category.dart';
import 'package:flutter_samples/screens/home/top_slide_adv.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return ListView(children: const [
      TopSlideADV(),
      FoodCategory(),
      Divider(
        thickness: 0.2,
        color: Colors.black45,
      ),
      Stores(
        titleName: '자주 주문한 맛집',
        hasLink: false,
        foodCategory: '',
      ),
      Divider(
        thickness: 5,
        color: Colors.black12,
      ),
      Stores(
        titleName: '인기 프랜차이즈',
        hasLink: true,
        foodCategory: '',
      ),
    ]);
  }
}
