import 'package:flutter/material.dart';

class TopSlideADV extends StatelessWidget {
  const TopSlideADV({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 190,
      child: ListView(scrollDirection: Axis.horizontal, children: const [
        _AdvImage(asset_url: 'images/topadv/adv1.jpeg'),
        _AdvImage(asset_url: 'images/topadv/adv2.jpeg'),
      ]),
    );
  }
}

class _AdvImage extends StatelessWidget {
  const _AdvImage({Key? key, required this.asset_url}) : super(key: key);
  final String asset_url;

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
        width: MediaQuery.of(context).size.width,
        color: Colors.black12,
        child: Image(
          image: AssetImage(asset_url),
          fit: BoxFit.fill,
        ),
      ),
      Positioned(
          top: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black45, borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                '10 / 20',
                style: TextStyle(fontSize: 12, color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )),
      Positioned(
          bottom: 10,
          right: 10,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.black54, borderRadius: BorderRadius.circular(12)),
            child: const Padding(
              padding: EdgeInsets.all(5),
              child: Text(
                '이벤트 전체보기',
                style: TextStyle(color: Colors.white),
                textAlign: TextAlign.center,
              ),
            ),
          )),
    ]);
  }
}
