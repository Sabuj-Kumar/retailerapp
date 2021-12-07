import 'package:flutter/material.dart';

class MainPagePaint extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint();
    Path path = Path();
    final height = size.height;
    final width = size.width;
    path.lineTo(0, height * 0.3);
    path.quadraticBezierTo(width * 0.3, height * 0.6, width, height * 0.7);
    path.lineTo(width, 0);

    paint.color = Colors.deepPurple;
    canvas.drawPath(path, paint);
    path.close();
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
}
