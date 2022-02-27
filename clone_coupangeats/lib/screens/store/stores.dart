import 'package:flutter/material.dart';
import 'package:flutter_samples/screens/store/store.dart';

class Stores extends StatelessWidget {
  final String titleName;
  final bool hasLink;
  final String foodCategory;
  const Stores({
    Key? key,
    required this.titleName,
    required this.hasLink,
    required this.foodCategory,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: 20, top: 10, right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                titleName,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              Expanded(child: Container()),
              if (hasLink) Icon(Icons.keyboard_arrow_right)
            ],
          ),
          Container(
            padding: const EdgeInsets.symmetric(vertical: 10),
            height: 230,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: const [
                Store(
                  imageUrl:
                      'https://i.pinimg.com/564x/af/48/a4/af48a49835379f49cbf274984e1c9bef.jpg',
                  name: '모두의밥상 의정부점',
                  ratio: 4.7,
                  commentCounts: 178,
                  distance: 0.5,
                  isDeliveryFree: false,
                  deliveryAnount: 3000,
                ),
                Store(
                  imageUrl:
                      'https://i.pinimg.com/564x/80/ed/f5/80edf58baed795921d094d645f74f7ee.jpg',
                  name: '모두의치킨 의정부점',
                  ratio: 4.7,
                  commentCounts: 55,
                  distance: 0.5,
                  isDeliveryFree: true,
                  deliveryAnount: 0,
                ),
                Store(
                  imageUrl:
                      'https://i.pinimg.com/564x/8f/58/27/8f58271d0d4306d431118b8ea343dc3d.jpg',
                  name: '모두의덮밥 의정부점',
                  ratio: 2.2,
                  commentCounts: 255,
                  distance: 2.5,
                  isDeliveryFree: false,
                  deliveryAnount: 2000,
                ),
                Store(
                  imageUrl:
                      'https://i.pinimg.com/564x/89/31/36/8931368c1ec410f73ee0615b531ae32e.jpg',
                  name: '모두의피자 의정부점',
                  ratio: 5.0,
                  commentCounts: 300,
                  distance: 3.1,
                  isDeliveryFree: true,
                  deliveryAnount: 0,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
