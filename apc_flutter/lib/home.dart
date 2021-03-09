import 'package:flutter/material.dart';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'package:apc_flutter/impl/triangle.dart';
import 'package:apc_flutter/components/footer.dart';
import 'package:apc_flutter/components/about_us.dart';
import 'package:apc_flutter/components/faq.dart';
import 'package:apc_flutter/components/speakers.dart';
import 'package:apc_flutter/components/sponsors.dart';
import 'package:apc_flutter/components/theme.dart';
import 'package:apc_flutter/constants.dart';

class Home extends StatefulWidget {
  Home({Key key}) : super(key: key);

  @override 
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ItemScrollController _scrollController;

  @override 
  void initState() {
    _scrollController = ItemScrollController();
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    final TextStyle appBarStyle = Theme.of(context).textTheme.subtitle1;

    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(
          inherit: true,
          color: Colors.black, 
          fontSize: 24
        ),
        child: content(width, appBarStyle)
      ),
    );
  }

  Widget content(double width, TextStyle appBarStyle) { 
    // list used by ScrollablePositionedList
    List _contentList = [
      SizedBox(height: 10), // 0
      navBar(width, appBarStyle), // 1
      SizedBox(height: width < 768 ? 0 : width * .03), // 2
      width < Constants.mobile ? headerImageMobile(width) : headerImage(width), // 3
      SizedBox(height: width * .065), // 4
      ThemeApc(), // 5
      SizedBox(height: width * .08), // 6
      Speakers(), // 7
      SizedBox(height: width * .06), // 8
      Sponsors(), // 9
      SizedBox(height: width * .04), // 10
      Faq(), // 11
      SizedBox(height: width * .04), // 12
      AboutUs(), // 13,
      SizedBox(height: width * .04), // 12
      Footer()
    ];

    return ScrollablePositionedList.builder(
      itemScrollController: _scrollController,
      itemCount: _contentList.length,
      itemBuilder: (context, index) {
        return _contentList[index];
      },
    );
  }

  // ------------- //
  // -- DESKTOP -- //
  // ------------- //

  Widget navBar(double width, appBarStyle) {
    return width < 768 ? navBarMobile() : Row(
      children: <Widget>[
        Spacer(flex: 4),
        Text("APC", style: TextStyle(fontFamily: "Futura", fontSize: 45, color: Constants.headGray)),
        Spacer(flex: 4),
        TextButton(
          onPressed: () => _scrollController.scrollTo(index: 5, duration: Duration(milliseconds: 750), curve: Curves.easeOut, opacityAnimationWeights: [20, 20, 60]),
          child: Text("Theme", style: appBarStyle)
        ), 
        Spacer(),
        TextButton(
          onPressed: () => _scrollController.scrollTo(index: 7, duration: Duration(milliseconds: 750), curve: Curves.easeOut, opacityAnimationWeights: [20, 20, 60]),
          child: Text("Speakers", style: appBarStyle)
        ), 
        Spacer(),
        TextButton(
          onPressed: () => _scrollController.scrollTo(index: 9, duration: Duration(milliseconds: 750), curve: Curves.easeOut, opacityAnimationWeights: [20, 20, 60]), 
          child: Text("Sponsors", style: appBarStyle)
        ), 
        Spacer(),
        TextButton(
          onPressed: () => _scrollController.scrollTo(index: 11, duration: Duration(milliseconds: 750), curve: Curves.easeOut, opacityAnimationWeights: [20, 20, 60]), 
          child: Text("FAQ", style: appBarStyle)
        ), 
        Spacer(),
        TextButton(
          onPressed: (){}, 
          child: Text("Register", style: appBarStyle)
        ), 
        Spacer(flex: 4)
      ],
    );
  }

  Widget headerImage(double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .015),
      child: Container(
        height: width * .51,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/header.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              SizedBox(height: width * .05), 
              responsiveText(
                AutoSizeText(
                  "Take a glimpse into the future of Product, Design, and Engineering",
                  style: TextStyle(fontFamily: "Avenir", fontSize: 48, fontWeight: FontWeight.w800, height: 1.04, color: Colors.white),
                  maxLines: 3,
                ),
                width, false
              ),
              SizedBox(height: 40),
              Container(
                width: width * .34,
                child: Divider(
                  color: Colors.white,
                  height: 20,
                  thickness: 2, 
                  endIndent: width * .06,
                ),
              ),
              dateText(),
              SizedBox(height: 30),
              register(width)
            ],
          ),
        )
      ),
    );
  }

  Widget dateText() {
    final TextStyle dateStyle = TextStyle(fontFamily: "Avenir", fontSize: 24, height: 1.33, color: Colors.white);
    return Container(
      child: Row(
        children: <Widget>[
          Triangle(color: Constants.red),
          SizedBox(width: 6),
          Flexible(child: Text("4 / 24 / 2021", style: dateStyle)),
          SizedBox(width: 10),
          Triangle(color: Constants.red),
          SizedBox(width: 6),
          Flexible(child: Text("1 - 4 PM CST", style: dateStyle))
        ]
      )
    );
  }

  Widget register(double width) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: width * .2,
        height: width * .044,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(60.0)),
            primary: Colors.white,
            elevation: 5
          ),
          child: Row(
            children: <Widget>[
              Text(
                "     Register Now", 
                style: TextStyle(
                  fontFamily: "Avenir", 
                  fontSize: (width * .2) / 12,
                  color: Constants.apcBlue,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(64, 0, 0, 0),
                    ),
                  ]
                ),
              ),
              SizedBox(width: width * .01),
              Container(width: width * .025, child: Image.asset("images/arrow.png"))
            ]
          )
        ),
      ),
    );
  }

  Widget responsiveText(Widget textWidget, double width, bool mobile) {
    return Container(
      width: mobile ? width : width * .34,
      child: Row(
        children: <Widget>[
          Flexible(child: textWidget),
        ]
      )
    );
  }

  // ------------ //
  // -- MOBILE -- //
  // ------------ //

  // text that wraps around to the next line without using the AutoSizeText package
  Widget responsiveTextMobile(Widget textWidget, double width) {
    return Container(
      child: Row(
        children: <Widget>[
          Flexible(child: textWidget),
        ]
      )
    );
  }

  Widget navBarMobile() {
    return Row (
      children: <Widget>[
        Spacer(flex: 1),
        Text("APC", style: TextStyle(fontFamily: "Futura", fontSize: 45, color: Constants.headGray)),
        Spacer(flex: 15)
      ],
    );
  }

  Widget headerImageMobile(double width) {
    return Container(
      width: width,
      height: width * 1.78,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/header_mobile.png"),
          fit: BoxFit.fill,
        ),
      ),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .07),
        child: Column(
          children: <Widget>[
            SizedBox(height: 80), 
            responsiveText(
              Text(
                "Take a glimpse into the future of Product, Design, and Engineering",
                style: TextStyle(fontFamily: "Avenir", fontSize: 36, fontWeight: FontWeight.w800, height: 1.12, color: Colors.white)
              ),
              width, true
            ),
            SizedBox(height: 40),
            Divider(
              color: Colors.white,
              height: 20,
              thickness: 2,
            ),
            dateTextMobile(),
            SizedBox(height: 50),
            registerMobile()
          ],
        ),
      )
    );
  }

  Widget dateTextMobile() {
    final TextStyle dateStyle = TextStyle(fontFamily: "Avenir", fontSize: 24, height: 1.33, color: Colors.white);
    return Container(
      child: Row(
        children: <Widget>[
          Triangle(color: Constants.red),
          SizedBox(width: 6),
          Flexible(child: Text("4 / 24 / 2021", style: dateStyle)),
          SizedBox(width: 10),
          Triangle(color: Constants.red),
          SizedBox(width: 6),
          Flexible(child: Text("1 - 4 PM CST", style: dateStyle))
        ]
      )
    );
  }

  Widget registerMobile() {
    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        width: 260,
        height: 60.5,
        child: ElevatedButton(
          onPressed: (){},
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
            primary: Colors.white,
            elevation: 5
          ),
          child: Row(
            children: <Widget>[
              Text(
                "   Register Now", 
                style: TextStyle(
                  fontFamily: "Avenir", 
                  fontSize: 24, 
                  height: 1, 
                  color: Constants.apcBlue,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(1.0, 1.0),
                      blurRadius: 3.0,
                      color: Color.fromARGB(64, 0, 0, 0),
                    ),
                  ]
                )
              ),
              SizedBox(width: 15),
              Image.asset("images/arrow.png", scale: 6)
            ]
          )
        ),
      ),
    );
  }
}