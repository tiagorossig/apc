import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';
import 'package:auto_size_text/auto_size_text.dart';

import 'package:apc_flutter/impl/triangle.dart';
import 'package:apc_flutter/constants.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      padding: responsivePadding(width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: width < Constants.mobile ? 54 : 30),
          Divider(
            color: Constants.headGray,
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
      return EdgeInsets.only(right: 24, left: 24, bottom: 70);
    } else {
      return EdgeInsets.only(left: width * .265, right: width *.144, bottom: width * .025);
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
        "TPEO", 
        style: TextStyle(fontFamily: "Avenir", fontSize: 48, fontWeight: FontWeight.w800, color: Constants.headGray),
        maxLines: 1
      )
    );
  }

  Widget content(double width) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        SizedBox(height: width < Constants.mobile ? 35 : 0),
        textGroup(width, 32, "Texas Product Engineering Organization", "Hey! We're TPEO, a group of students at UT Austin who are building, designing, and launching software products to solve real-world problems in our community"),
        SizedBox(height: 45),
        textGroup(width, 24, "What we do:", "1. Teach full-stack engineering, UI/UX design, and product management in semester-long courses\n2. Provide hands-on experience through impactful projects and work at local startups\n3. Foster a community of innovators and builders who are going to change the world"),
        // textGroup(width),
      ]
    );
  }

  Widget textGroup(double width, double fontSize, String text1, String text2) {
    return 
      Column(
        children: <Widget>[
          responsiveTextTriangle(
            Text(
              text1,
              style: TextStyle(fontFamily: "Avenir", fontSize: fontSize, fontWeight: FontWeight.w800, height: 1.58, color: Constants.headGray)
            ), 
            width, true
          ),
          SizedBox(height: 13),
          responsiveTextTriangle(
            Text(
              text2,
              style: TextStyle(fontFamily: "Avenir", fontSize: 18, fontWeight: FontWeight.w400, height: 1.89, color: Constants.headGray)
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