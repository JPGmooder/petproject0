import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:petproject0/constants/colors.dart';
import 'package:petproject0/constants/strings.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SwitcherWidget extends StatefulWidget {
  SwitcherWidget(
      {Key? key,
      required this.itemsList,
      this.dotColor = Colors.grey,
      this.activeDotColor = Colors.yellow,
      this.dotHeigh = 8,
      required this.sizeBetween,
      this.dotWidth = 20})
      : super(key: key);
  Color dotColor;
  Color activeDotColor;
  double dotWidth;
  double dotHeigh;
  double sizeBetween;
  List<Widget> itemsList;
  int index = 0;

  @override
  State<SwitcherWidget> createState() => _SwitcherWidgetState();
}

class _SwitcherWidgetState extends State<SwitcherWidget> {
  late CarouselController _controller;

  @override
  void initState() {
    _controller = CarouselController();
    // TODO: implement initState
    super.initState();
  }

  

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider(
            carouselController: _controller,
            items: widget.itemsList,
            options: CarouselOptions(
                initialPage: widget.index,
                onPageChanged: (index, _) => setState(() {
                      widget.index = index;
                    }))),
        SizedBox(
          height: widget.sizeBetween,
        ),
        AnimatedSmoothIndicator(
          effect: ExpandingDotsEffect(
              spacing: 12,
              activeDotColor: widget.activeDotColor,
              dotHeight: widget.dotHeigh,
              dotWidth: widget.dotWidth,
              dotColor: widget.dotColor),
          activeIndex: widget.index,
          count: widget.itemsList.length,
          onDotClicked: (index) => setState(() {
            widget.index = index;
            _controller.animateToPage(index);
          }),
        )
      ],
    );
  }
}
