import 'package:flutter/material.dart';


class MultiPageAnimation extends StatefulWidget {

  final List<PageAnimationItem> pages;
  MultiPageAnimation({Key key, this.pages}) : super(key: key);

  @override
  _MultiPageAnimation createState() => _MultiPageAnimation();
}

class _MultiPageAnimation extends State<MultiPageAnimation>
    with TickerProviderStateMixin {

  @override
  Widget build(BuildContext context) {
    return Stack(  
      children: [
        ...widget.pages.map(
          (page) => page.pagebuilder()
        )
      ],
    );
  }
}

class PageAnimationItem {
  final Function pagebuilder;
  final Curve curve;
  final Duration duration;

  PageAnimationItem({this.curve, this.duration, this.pagebuilder });
}
