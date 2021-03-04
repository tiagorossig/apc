import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

import '../constants.dart';

class Speakers extends StatelessWidget {
  const Speakers({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    
    return Container(
      color: Color(0xFF292F3D),
      padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .144, vertical: 75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
         SizedBox(height: MediaQuery.of(context).size.width * .01),
          Divider(
            color: Color(0xFFE0E0E0),
            height: 20,
            thickness: 2,
          ),
          SizedBox(height: MediaQuery.of(context).size.width * .01),
          Text(
            "Speakers", 
            style: TextStyle(fontFamily: "Avenir", fontSize: 48, fontWeight: FontWeight.w800, color: Constants.lightGray)
          ),
          SizedBox(height: MediaQuery.of(context).size.width * .01),
          ResponsiveGridRow(
            children: <ResponsiveGridCol>[
              speaker(context), 
              speaker(context),
              speaker(context),
              speaker(context), 
              speaker(context),
              speaker(context),
              speaker(context)
            ]
          ),
        ],
      )
    );
  }

  Widget speaker(context) {
    final TextStyle speakerName = TextStyle(fontFamily: "Avenir", fontSize: 24, fontWeight: FontWeight.w800, color: Constants.lightGray);
    final TextStyle speakerDescription = TextStyle(fontFamily: "Avenir", fontSize: 18, fontWeight: FontWeight.w400, color: Constants.lightGray);
    final TextStyle speakerDescription2 = TextStyle(fontFamily: "Avenir", fontSize: 14, fontWeight: FontWeight.w400, color: Constants.lightGray);
    double width = MediaQuery.of(context).size.width;

    return ResponsiveGridCol(
      lg: 4,
      md: 6,
      sm: 12,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * .018),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget> [
            width < 768 ? SizedBox(height: 10) : SizedBox(height: MediaQuery.of(context).size.width * .025),
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
            SizedBox(height: 5),
            Align(
              alignment: Alignment.center,
              child: Text("Tristique Pharetra", style: speakerDescription)
            ),
            width < 768 ? SizedBox() : SizedBox(height: 8),
            width < 768 ? SizedBox() : Text("Fermentum et egestas dui nulla fermentum pulvinar est. Egestas eu malesuada est molestie platea volutpat ullamcorper pharetra. At vel hendrerit amet, sit neque. Eu, dui vitae tristique pharetra libero maecenas sit lacus.", style: speakerDescription2),
            width < 768 ? SizedBox(height: 10) : SizedBox(height: MediaQuery.of(context).size.width * .025)
          ]
        ),
      ),
    );
  }
}