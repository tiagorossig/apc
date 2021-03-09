import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:apc_flutter/impl/triangle.dart';
import 'package:apc_flutter/constants.dart';

class Faq extends StatelessWidget {
  const Faq({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xFF292F3D),
      padding: responsivePadding(width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: width < Constants.mobile ? 54 : 30),
          Divider(
            color: Constants.lightGray,
            height: 20,
            thickness: 2,
          ),
          SizedBox(height: width < Constants.mobile ? 35 : MediaQuery.of(context).size.width * .02),
          ResponsiveGridRow(
            children: <ResponsiveGridCol>[
              responsiveGridCol(header(width), 2, 3, 12),
              responsiveGridCol(content(width), 10, 9, 12)
            ]
          )
        ],
      )
    );
  }

  EdgeInsets responsivePadding(double width) {
    if (width < Constants.mobile) {
      return EdgeInsets.only(right: 24, left: 24, bottom: 80);
    } else {
      return EdgeInsets.only(left: width * .144, right: width *.272, top: width * .04, bottom: width * .08);
    }
  }

  Widget responsiveGridCol(Widget widget, int md, int sm, int xs) {
    return ResponsiveGridCol(
      md: md,
      xs: xs,
      child: widget
    );
  }

  Widget header(double width) {
    return Padding(
      padding: EdgeInsets.only(right: width > Constants.mobile ? 15 : 0),
      child: AutoSizeText(
        "FAQs", 
        style: TextStyle(fontFamily: "Avenir", fontSize: 48, fontWeight: FontWeight.w800, color: Constants.lightGray),
        maxLines: 1,
      )
    );
  }

  Widget content(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        SizedBox(height: width < Constants.mobile ? 35 : 0),
        textGroup(width, "What is a product conference?", "A product conference is an event focused on exploring the future of product, design, and engineering."),
        SizedBox(height: 45),
        textGroup(width, "What’s the goal of the Austin Product Conference?", "Our goal with APC is two-fold:\n1. Host meaningful conversations between industry thought-leaders and curious students about the future of product, design, and engineering\n2. Show the world that Austin, TX is a product hub of excellence"),
        SizedBox(height: 45),
        textGroup(width, "Who can attend?", "All college students are welcome!")
        // textGroup(width),
      ]
    );
  }

  Widget textGroup(double width, String text1, String text2) {
    return 
      Column(
        children: <Widget>[
          responsiveTextTriangle(
            Text(
              text1,
              style: TextStyle(fontFamily: "Avenir", fontSize: 24, fontWeight: FontWeight.w800, height: 1.58, color: Constants.lightGray)
            ), 
            width, true
          ),
          SizedBox(height: 13),
          responsiveTextTriangle(
            Text(
              text2,
              style: TextStyle(fontFamily: "Avenir", fontSize: 18, fontWeight: FontWeight.w400, height: 1.89, color: Constants.lightGray)
            ),
            width, false
          )
        ],
    );
  }

  // responsiveText... with a Triangle() in front if triangle = true
  Widget responsiveTextTriangle(Widget textWidget, double width, bool triangle) {
    return Container(
      width: width < Constants.mobile ? width * .85 : width * .45,
      child: Row(
        children: <Widget>[
          Triangle(color: triangle ? Constants.red : Colors.transparent),
          SizedBox(width: 6),
          Flexible(child: textWidget),
        ]
      )
    );
  }
}