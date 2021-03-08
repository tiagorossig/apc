import 'package:apc_flutter/components/about_us.dart';
import 'package:apc_flutter/components/faq.dart';
import 'package:apc_flutter/components/speakers.dart';
import 'package:apc_flutter/components/sponsors.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'components/theme.dart';

class Home extends StatelessWidget {
  Home({Key key}) : super(key: key);

  final ItemScrollController _scrollController = ItemScrollController();
  
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

  Widget navBarDesktop(double width, appBarStyle) {
    return width < 768 ? SizedBox() : Row(
      children: <Widget>[
        Spacer(flex: 4),
        Text("APC", style: TextStyle(fontFamily: "Futura", fontSize: 45, color: Color(0xFF333333))),
        Spacer(flex: 4),
        TextButton(
          onPressed: () => _scrollController.scrollTo(index: 7, duration: Duration(milliseconds: 750), curve: Curves.easeInOutCubic),
          child: Text("Theme", style: appBarStyle)
        ), 
        Spacer(),
        TextButton(
          onPressed: () => _scrollController.scrollTo(index: 9, duration: Duration(milliseconds: 750), curve: Curves.easeInOutCubic),
          child: Text("Speakers", style: appBarStyle)
        ), 
        Spacer(),
        TextButton(
          onPressed: () => _scrollController.scrollTo(index: 11, duration: Duration(milliseconds: 750),curve: Curves.easeInOutCubic), 
          child: Text("Sponsors", style: appBarStyle)
        ), 
        Spacer(),
        TextButton(
          onPressed: () => _scrollController.scrollTo(index: 13, duration: Duration(milliseconds: 750), curve: Curves.easeInOutCubic), 
          child: Text("FAQ", style: appBarStyle)
        ), 
        Spacer(),
        TextButton(
          onPressed: null, 
          child: Text("Register", style: appBarStyle)
        ), 
        Spacer(flex: 4)
      ],
    );
  }

  Widget headerImage(double width) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: width * .015),
      child: FittedBox(
        child: Image.asset("assets/images/new_header.png", width: 1823, height: 872),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget content(double width, TextStyle appBarStyle) { 
    // list used by ScrollablePositionedList
    List _contentList = [
      SizedBox(height: 10), // 0
      navBarDesktop(width, appBarStyle), // 1
      SizedBox(height: width * .03), // 2
      headerImage(width), // 3
      SizedBox(height: width * .065), // 4
      Divider(
        color: Color(0xFF0433BF),
        thickness: 2,
        indent: width * .38,
        endIndent: width * .15
      ), // 1
      SizedBox(height: width * .012), // 6
      ThemeApc(), // 7
      SizedBox(height: width * .08), // 8
      Speakers(), // 9
      SizedBox(height: width * .06), // 10
      Sponsors(), // 11
      SizedBox(height: width * .04), // 12
      Faq(), // 13
      SizedBox(height: width * .04), // 14
      AboutUs() // 15
    ];

    return ScrollablePositionedList.builder(
      itemScrollController: _scrollController,
      itemCount: _contentList.length,
      itemBuilder: (context, index) {
        return _contentList[index];
      },
    );
  }
}