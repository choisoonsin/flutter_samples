import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter_samples/screens/store/store_detail.dart';

class Store extends StatelessWidget {
  // TODO: change it to model
  final String imageUrl;
  final String name;
  final double ratio;
  final int commentCounts;
  final double distance;
  final bool isDeliveryFree;
  final int deliveryAnount;

  const Store(
      {Key? key,
      required this.imageUrl,
      required this.name,
      required this.ratio,
      required this.commentCounts,
      required this.distance,
      required this.isDeliveryFree,
      required this.deliveryAnount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Route시 page 애니메이션, MaterialPageRoute, CupertinoPageRoute
        Navigator.push(context, CupertinoPageRoute(builder: (context) {
          return StoreDetailPage(
            name: name,
            ratio: ratio,
            commentCounts: commentCounts,
          );
        }));
      },
      child: Container(
        padding: const EdgeInsets.only(right: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              width: 125,
              height: 125,
              fit: BoxFit.cover,
              placeholder: (context, url) => const CircularProgressIndicator(),
              imageUrl: imageUrl,
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              name,
              style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                  fontSize: 15),
            ),
            const SizedBox(
              height: 2,
            ),
            Row(
              children: [
                const Icon(
                  Icons.star_rounded,
                  color: Color.fromARGB(255, 255, 230, 0),
                  size: 15,
                ),
                const SizedBox(
                  width: 2,
                ),
                Text(ratio.toString()),
                Text('(' + commentCounts.toString() + ')'),
                const SizedBox(
                  width: 5,
                ),
                Text(distance.toString() + 'km')
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            (isDeliveryFree)
                ? Text('배달비 무료')
                : Text('배달비 ' + deliveryAnount.toString() + '원')
          ],
        ),
      ),
    );
  }
}
