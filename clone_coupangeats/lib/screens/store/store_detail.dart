import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class StoreDetailPage extends StatefulWidget {
  final String name;
  final double ratio;
  final int commentCounts;

  const StoreDetailPage(
      {Key? key,
      required this.name,
      required this.ratio,
      required this.commentCounts})
      : super(key: key);

  @override
  _StoreDetailPageState createState() => _StoreDetailPageState();
}

class _StoreDetailPageState extends State<StoreDetailPage> {
  double _pixelSize = 0;
  void _updateFontsize(pixel) {
    setState(() {
      _pixelSize = pixel;
    });
  }

  @override
  Widget build(BuildContext context) {
    return NotificationListener<ScrollNotification>(
      onNotification: (ScrollNotification scrollNotification) {
        if (scrollNotification is ScrollStartNotification) {
          debugPrint('Scrolling has started');
        } else if (scrollNotification is ScrollEndNotification) {
          debugPrint('Scrolling has ended');
        }
        // print(scrollNotification.metrics.atEdge); // 상, 하 끝에 도달했을때 true
        // print(scrollNotification.metrics.axis); // 어느 축으로 스크롤 되고 있는지 ?
        // print(scrollNotification.metrics.extentAfter);
        // print(scrollNotification.metrics.extentBefore);
        // print(scrollNotification.metrics.extentInside);
        // print(scrollNotification.metrics.maxScrollExtent);
        // print(scrollNotification.metrics.minScrollExtent);

        print(scrollNotification.metrics.pixels);
        if (scrollNotification.metrics.pixels > 50) {
          _updateFontsize(scrollNotification.metrics.pixels);
        }

        if (scrollNotification.metrics.pixels > 140) {
          _updateFontsize(scrollNotification.metrics.pixels);
        }
        // Return true to cancel the notification bubbling.
        return true;
      },
      child: CustomScrollView(
        slivers: [
          SliverAppBar(
            leading: Icon(
              Icons.arrow_back,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            backgroundColor: Colors.white,
            pinned: true,
            expandedHeight: 250.0,
            flexibleSpace: FlexibleSpaceBar(
                title: Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 40,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(2)),
                  child: Center(
                    child: Text(
                      widget.name,
                      style: TextStyle(
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
                background: Container(
                  child: CachedNetworkImage(
                    imageUrl:
                        'https://i.pinimg.com/564x/76/a4/06/76a406a9fba142a9219b432ffb3e33a8.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
                centerTitle: true),
          ),
          SliverGrid(
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200.0,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              childAspectRatio: 4.0,
            ),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: Colors.teal[100 * (index % 9)],
                  child: Text('Grid Item $index'),
                );
              },
              childCount: 40,
            ),
          ),
        ],
      ),
    );
  }
}
