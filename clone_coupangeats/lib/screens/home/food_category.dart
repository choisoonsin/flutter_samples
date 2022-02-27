import 'package:flutter/material.dart';

class FoodCategory extends StatelessWidget {
  const FoodCategory({Key? key}) : super(key: key);

  final String asset_base_url = 'images/category/';
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      padding: EdgeInsets.only(top: 15),
      child: ListView(scrollDirection: Axis.horizontal, children: [
        _CategoryItem(
          assetUrl: asset_base_url + 'packing.png',
          categoryLabel: '포장',
          isNew: true,
        ),
        _CategoryItem(
            assetUrl: asset_base_url + 'newshop.png',
            categoryLabel: '신규 맛집',
            isNew: true),
        _CategoryItem(
            assetUrl: asset_base_url + '1person.png',
            categoryLabel: '1인분',
            isNew: false),
        _CategoryItem(
            assetUrl: asset_base_url + 'koreafood.png',
            categoryLabel: '한식',
            isNew: false),
        _CategoryItem(
            assetUrl: asset_base_url + 'chicken.png',
            categoryLabel: '치킨',
            isNew: false),
        _CategoryItem(
            assetUrl: asset_base_url + '1person.png',
            categoryLabel: '분식',
            isNew: false),
      ]),
    );
  }
}

class _CategoryItem extends StatelessWidget {
  final String assetUrl;
  final String categoryLabel;
  final bool isNew;

  const _CategoryItem(
      {Key? key,
      required this.isNew,
      required this.assetUrl,
      required this.categoryLabel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: AssetImage(assetUrl))),
              ),
              if (isNew)
                Positioned(
                    right: 1,
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: const BoxDecoration(
                          shape: BoxShape.circle, color: Colors.red),
                      child: const Center(
                          child: Text('NEW',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 9,
                              ))),
                    ))
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            categoryLabel,
            style: const TextStyle(color: Colors.black),
          )
        ],
      ),
    );
  }
}
