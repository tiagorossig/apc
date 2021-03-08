import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constants.dart';

class Speakers extends StatelessWidget {
  const Speakers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Container(
      color: Color(0xFF292F3D),
      padding: EdgeInsets.symmetric(horizontal: width * .144, vertical: width * .025),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: width < Constants.mobile ? 80 : 30),
          Divider(
            color: Color(0xFFE0E0E0),
            height: 20,
            thickness: 2,
          ),
          SizedBox(height: width * .01),
          Text(
            "Speakers", 
            style: TextStyle(fontFamily: "Avenir", fontSize: 48, fontWeight: FontWeight.w800, color: Constants.lightGray)
          ),
          SizedBox(height: width * .01),
          ResponsiveGridRow(
            children: <ResponsiveGridCol>[
              speaker(context, width), 
              speaker(context, width),
              speaker(context, width),
              speaker(context, width), 
              speaker(context, width),
              speaker(context, width),
              speaker(context, width)
            ]
          ),
        ],
      )
    );
  }

  Widget speaker(BuildContext context, double width) {
    final TextStyle speakerName = TextStyle(fontFamily: "Avenir", fontSize: 24, fontWeight: FontWeight.w800, color: Constants.lightGray);
    final TextStyle speakerDescription = TextStyle(fontFamily: "Avenir", fontSize: 18, fontWeight: FontWeight.w400, color: Constants.lightGray, height: 1.89);
    final TextStyle speakerDescription2 = TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w300, color: Constants.lightGray, height: 1.71);
    final int mobile = Constants.mobile;

    return ResponsiveGridCol(
      lg: 4,
      md: 6,
      xs: 12,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: width * .018),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            width < mobile ? SizedBox(height: 10) : SizedBox(height: width * .025),
            Align(
              alignment: Alignment.center, 
                child: FittedBox(
                child: Image.asset("assets/images/speaker.png", width: 270, height: 270),
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(height: 20),
            Align(
              alignment: Alignment.center, 
              child: Text("Fermentum Etiam", style: speakerName)
            ),
            Align(
              alignment: Alignment.center,
              child: Text("Tristique Pharetra", style: speakerDescription)
            ),
            width < mobile ? SizedBox() : SizedBox(height: 8),
            width < mobile ? SizedBox() : Text("Fermentum et egestas dui nulla fermentum pulvinar est. Egestas eu malesuada est molestie platea volutpat ullamcorper pharetra. At vel hendrerit amet, sit neque. Eu, dui vitae tristique pharetra libero maecenas sit lacus.", style: speakerDescription2),
            width < mobile ? SizedBox(height: 10) : SizedBox(height: width * .025)
          ]
        ),
      ),
    );
  }
}