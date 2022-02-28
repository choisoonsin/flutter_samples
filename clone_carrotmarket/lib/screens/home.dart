import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';

import 'package:clone_carrotmarket/models/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Item> _items = [];

  List<Item> makeData() {
    List<Item> _data = [];
    _data.add(new Item(
        imgUrl:
            'https://i.pinimg.com/236x/ba/21/5c/ba215cd1a7e4e516295501bfc08a5a6c.jpg',
        itemName: '페레가모',
        locationName: '호원동',
        refreshTime: '끌올 7분전',
        amount: 100000));

    _data.add(new Item(
        imgUrl:
            'https://i.pinimg.com/236x/ca/65/01/ca6501c699507f98c3aac96e6b84cdec.jpg',
        itemName: '유아용 탁자',
        locationName: '호원동',
        refreshTime: '끌올 2분전',
        amount: 100000));

    return _data;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _items = makeData();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(title: _LocationInfo()),
      body: ListView.builder(
        itemCount: _items.length,
        itemBuilder: (context, idx) {
          Item _item = _items[idx];
          return _ItemListTile(_item);
        },
      ),
    ));
  }
}

class _ItemListTile extends StatelessWidget {
  const _ItemListTile(this.item);

  final Item item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(2),
      height: 80,
      child: Row(
        children: [
          // Image
        ],
      ),
    );
  }
}

class _LocationInfo extends StatefulWidget {
  const _LocationInfo({Key? key}) : super(key: key);

  @override
  __LocationInfoState createState() => __LocationInfoState();
}

class __LocationInfoState extends State<_LocationInfo> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
