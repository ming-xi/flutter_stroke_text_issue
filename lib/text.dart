import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PostTextPainter extends CustomPainter {
  final Paint p = Paint();
  final Paint fillp = Paint();  // create a second paint object for fill
  final Color textColor = Colors.white;
  final double fontSize = 100;
  final TextPainter tp = TextPainter(
    textDirection: TextDirection.ltr,
  );
  final bool drawBody;
  final bool drawStroke;

  PostTextPainter({this.drawBody = true, this.drawStroke = false}) {
    p.strokeCap = StrokeCap.square;
    p.strokeWidth = 1;
  }

  @override
  bool? hitTest(ui.Offset position) {
    // return super.hitTest(position);
    return false;
  }

  @override
  void paint(Canvas canvas, Size size) {
    drawText(canvas, size);
  }

  void drawText(Canvas canvas, Size size) {
    if (drawStroke) {
      // draw text stroke
      p.color = Colors.black;
      p.style = PaintingStyle.stroke;
      p.strokeWidth = 3;
      drawTextInternal(canvas, size, p);
    }
    if (drawBody) {
      // draw text body
      fillp.color = textColor;
      fillp.style = PaintingStyle.fill;
      drawTextInternal(canvas, size, fillp);
    }
  }

  void drawTextInternal(Canvas canvas, Size size, Paint paintToUse) {
    tp.text = TextSpan(
      text: "Test",
      style: TextStyle(
        fontSize: fontSize,
        // fontFamily: fontFamily,
        height: 1,
        foreground: paintToUse,
      ),
    );
    tp.layout(
      // minWidth:0,
      minWidth: 200,
      maxWidth: 200,
    );
    tp.paint(canvas, Offset(-100, -100));
  }

  @override
  bool shouldRepaint(PostTextPainter oldDelegate) {
    return this != oldDelegate;
  }
}
