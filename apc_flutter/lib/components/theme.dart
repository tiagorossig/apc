import 'package:flutter/material.dart';

class ThemeApc extends StatelessWidget {
  const ThemeApc({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(width: MediaQuery.of(context).size.width * .38), // offset 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            responsiveText(
              Text(
                "The Resurgence of the Roaring 20s", 
                style: TextStyle(
                  fontFamily: "Avenir", 
                  fontSize: 48, 
                  fontWeight: FontWeight.w800,
                  height: 1.04
                )
              ),
              context
            ),
            responsiveText(
              Text(
                "Get ready for an explosion of innovation", 
                style: TextStyle(
                  fontFamily: "Avenir", 
                  fontSize: 24, 
                  fontWeight: FontWeight.w800, 
                  height: 1.58
                )
              ),
              context
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .02), 
            responsiveText(
              RichText(
                text: TextSpan(
                  children: <TextSpan> [
                    TextSpan(
                      text: "The post-COVID era will feature a surge of innovation analagous with the Roaring 20s. Join us at the ",
                      style: textSpanStyle(FontWeight.w400)
                    ),
                    TextSpan(
                      text: "Austin Product Conference",
                      style: textSpanStyle(FontWeight.w800)
                    ),
                    TextSpan(
                      text: " as we hear from industry trailblazers about the future of eCommerce, biotech, gaming, cloud, virtual reality, marketplaces, and social networks!",
                      style: textSpanStyle(FontWeight.w400)
                    ),
                  ]
                )
              ), 
              context
            ),
            SizedBox(height: MediaQuery.of(context).size.height * .08), 
            Container(
              width: MediaQuery.of(context).size.width * .47,
              height: MediaQuery.of(context).size.width * .25,
              color: Color(0xFFC4C4C4)
            )
          ],
        ),
        Container(width: MediaQuery.of(context).size.width * .14), // offset 
      ],
    );
  }

  // text that wraps around to the next line without using the AutoSizeText package
  Widget responsiveText(Widget textWidget, BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * .47,
      child: Row(
        children: <Widget>[
          Flexible(
            child: textWidget
          )
        ]
      )
    );
  }

  TextStyle textSpanStyle(FontWeight fw) {
    return TextStyle(
      fontFamily: "Avenir", 
      fontSize: 16, 
      fontWeight: fw, 
      height: 1.75
    );
  }
}