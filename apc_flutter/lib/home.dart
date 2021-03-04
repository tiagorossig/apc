import 'package:apc_flutter/components/about_us.dart';
import 'package:apc_flutter/components/faq.dart';
import 'package:apc_flutter/components/speakers.dart';
import 'package:apc_flutter/components/sponsors.dart';
import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';

import 'components/theme.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  ItemScrollController _scrollController = ItemScrollController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTextStyle(
        style: TextStyle(
          inherit: true,
          color: Colors.black, 
          fontSize: 24
        ),
        child: content()
      ),
    );
  }

  Widget navBarDesktop() {
    final TextStyle appBarStyle = Theme.of(context).textTheme.subtitle1;
    return Row(
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

  Widget headerImage() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .015),
      child: FittedBox(
        child: Image.asset("assets/images/new_header.png", width: 1823, height: 872),
        fit: BoxFit.fill,
      ),
    );
  }

  Widget content() { 
    // list used by ScrollablePositionedList
    List _contentList = [
      SizedBox(height: 10), // 0
      navBarDesktop(), // 1
      SizedBox(height: MediaQuery.of(context).size.width * .03), // 2
      headerImage(), // 3
      SizedBox(height: MediaQuery.of(context).size.width * .065), // 4
      Divider(
        color: Color(0xFF0433BF),
        thickness: 2,
        indent: MediaQuery.of(context).size.width * .38,
        endIndent: MediaQuery.of(context).size.width * .15
      ), // 1
      SizedBox(height: MediaQuery.of(context).size.width * .012), // 6
      ThemeApc(), // 7
      SizedBox(height: MediaQuery.of(context).size.width * .08), // 8
      Speakers(), // 9
      SizedBox(height: MediaQuery.of(context).size.width * .06), // 10
      Sponsors(), // 11
      SizedBox(height: MediaQuery.of(context).size.width * .04), // 12
      Faq(), // 13
      SizedBox(height: MediaQuery.of(context).size.width * .04), // 14
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