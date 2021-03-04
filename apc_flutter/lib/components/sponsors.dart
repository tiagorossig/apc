import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constants.dart';

class Sponsors extends StatelessWidget {
  const Sponsors({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: responsivePadding(context),
      child: Column(
        children: <Widget> [
          Divider(
            color: Color(0xFF0433BF),
            height: 20,
            thickness: 2,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * .01),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Featuring", 
              style: TextStyle(fontFamily: "Avenir", fontSize: 48, fontWeight: FontWeight.w800),
            ),
          ),
          SizedBox(height: MediaQuery.of(context).size.width * .02),
          ResponsiveGridRow(
            children: <ResponsiveGridCol>[
              sponsor("Jonathan Wong", context), 
              sponsor("Jonathan Wong", context),
              sponsor("Jonathan Wong", context),
              sponsor("Jonathan Wong", context), 
              sponsor("Jonathan Wong", context),
              sponsor("Jonathan Wong", context),
              sponsor("Jonathan Wong", context)
            ],
          ),
        ]
      )
    );
  }

  EdgeInsets responsivePadding(context) {
    double width = MediaQuery.of(context).size.width;
    if (width < 768) {
      return EdgeInsets.symmetric(horizontal: 24);
    } else {
      return EdgeInsets.only(left: width * .265, right: width *.144);
    }
  }

  Widget sponsor(String sponsorName, BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ResponsiveGridCol(
      lg: 3,
      md: 4,
      sm: 6,
      child: Container(
        // color: Colors.red,
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .01),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            // width < 768 ? SizedBox(height: 10) : SizedBox(height: MediaQuery.of(context).size.width * .025),
            
            FittedBox(
              child: Image.asset("images/sponsor.png", width: 272, height: 244),
              fit: BoxFit.fill,
            ),
            
            SizedBox(height: 20),
            width < 768 ? SizedBox() : 
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                sponsorName, 
                style: TextStyle(fontFamily: "Avenir", fontSize: 18, fontWeight: FontWeight.w400)
              )
            ),
            width < 768 ? SizedBox(height: 10) : SizedBox(height: MediaQuery.of(context).size.width * .025)
          ]
        ),
      ),
    );
  }
}