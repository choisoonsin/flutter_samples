import 'package:exam_english_dictionary/screen/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchWordBar extends StatefulWidget {
  final bool isExpanded;

  SearchWordBar({
    required this.isExpanded,
  });

  @override
  State<SearchWordBar> createState() => _SearchWordBarState();
}

class _SearchWordBarState extends State<SearchWordBar> {
  final TextEditingController _wordController = TextEditingController();
  final FocusNode _wordFocusNode = FocusNode();

  final double kExpandedHeight = 180;
  final double kCollapsedHeight = 60;

  @override
  void initState() {
    super.initState();
    _wordFocusNode.addListener(focusNodeChangeEvent);
  }

  focusNodeChangeEvent() {
    if (_wordFocusNode.hasFocus) {
      Get.to(SearchScreen());
    }
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        expandedHeight: widget.isExpanded ? kExpandedHeight : kCollapsedHeight,
        collapsedHeight: kCollapsedHeight,
        pinned: true,
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(20.0), // 원하는 패딩의 높이를 지정
          child: Container(
            padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
            child: TextField(
                controller: _wordController,
                focusNode: _wordFocusNode,
                decoration: InputDecoration(
                  hintText: "검색어 입력",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  prefixIcon: Icon(Icons.search),
                )),
          ),
        ));
  }
}
