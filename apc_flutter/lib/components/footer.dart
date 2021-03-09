import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import 'package:responsive_grid/responsive_grid.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:apc_flutter/constants.dart';

class Footer extends StatelessWidget {
  const Footer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      color: Constants.lightGray,
      padding: responsivePadding(width),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 15),
          SizedBox(height: width < Constants.mobile ? 35 : MediaQuery.of(context).size.width * .02),
          ResponsiveGridRow(
            children: <ResponsiveGridCol>[
              responsiveGridCol(apcText(width)),
              responsiveGridCol(
                socialText(
                  "CONNECT WITH US", 
                  "LinkedIn",
                  "https://www.linkedin.com/company/tpeo/mycompany/",
                  "Facebook",
                  "https://www.facebook.com/txproduct/",
                  "Slack",
                  "https://join.slack.com/t/txproduct/shared_invite/zt-bx20f6q9-woJkyNn4UOdBnw8UObKejQ",
                  width
                )
              ),
              responsiveGridCol(
                socialText(
                  "CONTACT", 
                  "Email",
                  "mailto:team@txproduct.org",
                  "TPEO Website",
                  "https://txproduct.org/",
                  "Become a sponsor",
                  "https://txproduct.org/",
                  width
                )
              ),
            ]
          )
        ],
      )
    );
  }

  EdgeInsets responsivePadding(double width) {
    if (width < Constants.mobile) {
      return EdgeInsets.only(right: 24, left: 24, bottom: 40);
    } else {
      return EdgeInsets.only(left: width * .144, right: width *.2, top: width * .04, bottom: width * .04);
    }
  }

  Widget responsiveGridCol(Widget widget) {
    return ResponsiveGridCol(
      md: 4,
      xs: 12,
      child: widget
    );
  }

  Widget apcText(double width) {
    final TextStyle tpeoStyle = TextStyle(
      fontFamily: "Avenir", 
      fontSize: 14, fontWeight: FontWeight.w400, 
      height: 1.89
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget> [
        Text(
          "APC", 
          style: TextStyle(fontFamily: "Futura", fontSize: 30, color: Constants.headGray)
        ),
        SizedBox(height: width < Constants.mobile ? 10 : 20),
        Text(
          "Organized and held by TPEO", 
          style: tpeoStyle
        ),
        Text(
          "© 2021 TPEO, ALL RIGHTS RESERVED", 
          style: tpeoStyle
        ),
        SizedBox(height: 50)
      ]
    );
  }

  Widget socialText(String title, String text1, String url1, String text2, String url2, String text3, String url3, width) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: width > Constants.mobile ? 25 : 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            title, 
            style: TextStyle(fontFamily: "Avenir", fontSize: 18, fontWeight: FontWeight.w800)
          ),
          SizedBox(height: 10),
          textLink(text1, url1),
          SizedBox(height: 5),
          textLink(text2, url3),
          SizedBox(height: 5),
          textLink(text3, url3),
          SizedBox(height: 40)
        ],
      ),
    );
  }

  Widget textLink(String social, String url) {
    final TextStyle socialStyle = TextStyle(
      fontFamily: "Avenir", 
      fontSize: 16, fontWeight: FontWeight.w400, 
      height: 1.89, 
      decoration: TextDecoration.underline, 
      color: Constants.headGray
    );

    return MouseRegion(
      cursor: SystemMouseCursors.click,
          child: GestureDetector(
        onTap: () => launch(url),
        child: Text(social, style: socialStyle)
      ),
    );
  }
}