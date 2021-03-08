import 'package:flutter/material.dart';

import 'package:apc_flutter/impl/triangle_painter.dart';

class Triangle extends StatelessWidget {
  const Triangle({Key key, this.color}) : super(key: key);

  final Color color;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 17,
      width: 17,
        child: CustomPaint(
        painter: TrianglePainter(
          strokeColor: color,
          strokeWidth: 10,
          paintingStyle: PaintingStyle.fill,
        ),
      ),
    );
  }
}