import 'package:flutter/material.dart';

import 'package:responsive_grid/responsive_grid.dart';

import 'package:apc_flutter/constants.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: responsivePadding(width),
      child: Column(
        children: <Widget> [
          SizedBox(height: width < Constants.mobile ? 80 : 30),
          Divider(
            color: Color(0xFF0433BF),
            height: 20,
            thickness: 2,
          ),
          SizedBox(height: width * .01),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Featuring", 
              style: TextStyle(fontFamily: "Avenir", fontSize: 48, fontWeight: FontWeight.w800, color: Constants.headGray),
            ),
          ),
          SizedBox(height: width * .02),
          ResponsiveGridRow(
            children: <ResponsiveGridCol>[
              sponsor("Jonathan Wong", width), 
              sponsor("Jonathan Wong", width),
              sponsor("Jonathan Wong", width),
              sponsor("Jonathan Wong", width), 
              sponsor("Jonathan Wong", width),
              sponsor("Jonathan Wong", width),
              sponsor("Jonathan Wong", width)
            ],
          ),
        ]
      )
    );
  }

  EdgeInsets responsivePadding(double width) {
    if (width < Constants.mobile) {
      return EdgeInsets.only(left: 24, right: 24, bottom: 30);
    } else {
      return EdgeInsets.only(left: width * .265, right: width * .144);
    }
  }

  Widget sponsor(String sponsorName, double width) {
    final int mobile = Constants.mobile;
    return ResponsiveGridCol(
      lg: 3,
      md: 4,
      xs: 6,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: width * .01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget> [
            FittedBox(
              child: Image.asset("images/sponsor.png", width: 272, height: 244),
              fit: BoxFit.fill,
            ),
            SizedBox(height: 20),
            width < mobile ? SizedBox() : 
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                sponsorName, 
                style: TextStyle(fontFamily: "Avenir", fontSize: 18, fontWeight: FontWeight.w400)
              )
            ),
            width < mobile ? SizedBox(height: 10) : SizedBox(height: width * .025)
          ]
        ),
      ),
    );
  }
}