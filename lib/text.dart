import 'dart:ui' as ui;

import 'package:flutter/material.dart';

class PostTextPainter extends CustomPainter {
  final Paint p = Paint();
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
      p.strokeWidth = 2;
      drawTextInternal(canvas, size);
    }
    if (drawBody) {
      // draw text body
      p.color = textColor;
      p.style = PaintingStyle.fill;
      drawTextInternal(canvas, size);
    }
  }

  static int call=0;
  void drawTextInternal(Canvas canvas, Size size) {
    call++;
    tp.text = TextSpan(
      text: "Test",
      style: TextStyle(
        fontSize: fontSize,
        // fontFamily: fontFamily,
        height: 1,
        overflow: (p.style==PaintingStyle.stroke) ? TextOverflow.clip : TextOverflow.ellipsis,
        foreground: p,
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
