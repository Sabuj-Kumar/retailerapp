import 'package:flutter/material.dart';

class ClipUpToDown extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.moveTo(0, size.height / 3.2);
    path.quadraticBezierTo(
        size.width / 2, size.height / 3.2, size.width, size.height / 1.7);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
