import 'package:flutter/material.dart';

class AboutUs extends StatelessWidget {
  const AboutUs({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 509, right: 276),
      child: Column(
        children: <Widget> [
          Divider(
            color: Colors.black,
            height: 20,
            thickness: 2,
          ),
          SizedBox(height: 40),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[      
              Container(
                width: 207,
                child: Text("TPEO", style: TextStyle(fontSize: 48))
              ),
              SizedBox(width: 24),
              Expanded(
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 430)
                  ],
                ),
              ),
            ]
          ),
        ]
      ),
    );
  }
}