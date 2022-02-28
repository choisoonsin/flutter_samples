import 'package:flutter/material.dart';

class _SliverPersistentHeader extends SliverPersistentHeaderDelegate {
  _SliverPersistentHeader({required this.text, required this.scrollController});
  final String text;
  final ScrollController scrollController;
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    // print(shrinkOffset);
    // print(overlapsContent);
    // print(_controller);
    print(scrollController.offset);

    // TODO: implement build
    return Container(
        color: Colors.lightBlue,
        child: Center(
            child: Text(
          text,
          style: TextStyle(color: Color.fromARGB(255, 255, 193, 7)),
        )));
  }

  @override
  // TODO: implement maxExtent
  double get maxExtent => 50;

  @override
  // TODO: implement minExtent
  double get minExtent => 50;

  @override
  bool shouldRebuild(_SliverPersistentHeader oldDelegate) {
    return false;
  }
}

class Simple1 extends StatelessWidget {
  const Simple1({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    ScrollController _controller = new ScrollController();

    return SafeArea(
        child: Center(
      child: Container(
        color: Colors.red[200],
        child: CustomScrollView(
          controller: _controller,
          physics: BouncingScrollPhysics(),
          slivers: [
            SliverPadding(
              padding: EdgeInsets.all(2),
              sliver: SliverPersistentHeader(
                pinned: true,
                delegate: _SliverPersistentHeader(
                    text: '10일간의 날씨 예보', scrollController: _controller),
              ),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.orange, height: 150.0),
                Container(color: Colors.yellow, height: 150.0),
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.orange, height: 150.0),
                Container(color: Colors.yellow, height: 150.0),
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
              ],
            ),
            SliverPersistentHeader(
              pinned: true,
              delegate: _SliverPersistentHeader(
                  text: '20일간의 날씨 예보', scrollController: _controller),
            ),
            SliverGrid.count(
              crossAxisCount: 2,
              children: [
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.orange, height: 150.0),
                Container(color: Colors.yellow, height: 150.0),
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
                Container(color: Colors.red, height: 150.0),
                Container(color: Colors.purple, height: 150.0),
                Container(color: Colors.green, height: 150.0),
                Container(color: Colors.orange, height: 150.0),
                Container(color: Colors.yellow, height: 150.0),
                Container(color: Colors.pink, height: 150.0),
                Container(color: Colors.cyan, height: 150.0),
                Container(color: Colors.indigo, height: 150.0),
                Container(color: Colors.blue, height: 150.0),
              ],
            ),
          ],
        ),
      ),
    ));
  }
}
