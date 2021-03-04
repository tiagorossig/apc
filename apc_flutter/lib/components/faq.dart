import 'package:flutter/material.dart';

class Faq extends StatelessWidget {
  const Faq({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFF292F3D),
      padding: EdgeInsets.symmetric(horizontal: 277, vertical: 75),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          SizedBox(height: 35),
          Divider(
            color: Color(0xFFE0E0E0),
            height: 20,
            thickness: 2,
          ),
          SizedBox(height: 45),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: 207,
                child: Text(
                  "FAQs", 
                  style: TextStyle(fontFamily: "Avenir", fontSize: 48, fontWeight: FontWeight.w900, color: Color(0xFFE0E0E0))
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget> [
                  Row(
                    children: <Widget>[
                      Text(
                        "Tempus et justo lectus adipiscing tortor auctor adipiscing?",
                        style: TextStyle(fontFamily: "Avenir", fontSize: 24, color: Color(0xFFE0E0E0))
                      )
                    ]
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 903,
                    child: Text(
                      "Sapien nisi sit tincidunt lacus sodales cras tortor id. Posuere varius tortor ut ut ornare sed tincidunt commodo. Parturient porttitor urna, nisi, aenean adipiscing eu gravida pulvinar quis. Ornare nunc senectus risus, in interdum quam eu donec. Praesent egestas nulla vulputate dolor ipsum, cras. Massa arcu, cursus est fringilla amet. Ac duis pellentesque varius magna ac. ",
                      style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Color(0xFFE0E0E0))
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Text(
                        "Tempus et justo lectus adipiscing tortor auctor adipiscing?",
                        style: TextStyle(fontFamily: "Avenir", fontSize: 24, color: Color(0xFFE0E0E0))
                      )
                    ]
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 903,
                    child: Text(
                      "Sapien nisi sit tincidunt lacus sodales cras tortor id. Posuere varius tortor ut ut ornare sed tincidunt commodo. Parturient porttitor urna, nisi, aenean adipiscing eu gravida pulvinar quis. Ornare nunc senectus risus, in interdum quam eu donec. Praesent egestas nulla vulputate dolor ipsum, cras. Massa arcu, cursus est fringilla amet. Ac duis pellentesque varius magna ac. ",
                      style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Color(0xFFE0E0E0))
                    ),
                  ),
                  SizedBox(height: 30),
                  Row(
                    children: <Widget>[
                      Text(
                        "Tempus et justo lectus adipiscing tortor auctor adipiscing?",
                        style: TextStyle(fontFamily: "Avenir", fontSize: 24, color: Color(0xFFE0E0E0))
                      )
                    ]
                  ),
                  SizedBox(height: 5),
                  Container(
                    width: 903,
                    child: Text(
                      "Sapien nisi sit tincidunt lacus sodales cras tortor id. Posuere varius tortor ut ut ornare sed tincidunt commodo. Parturient porttitor urna, nisi, aenean adipiscing eu gravida pulvinar quis. Ornare nunc senectus risus, in interdum quam eu donec. Praesent egestas nulla vulputate dolor ipsum, cras. Massa arcu, cursus est fringilla amet. Ac duis pellentesque varius magna ac. ",
                      style: TextStyle(fontFamily: "Avenir", fontSize: 18, color: Color(0xFFE0E0E0))
                    ),
                  ),
                ]
              ),
            ]
          ),
        ],
      )
    );
  }
}