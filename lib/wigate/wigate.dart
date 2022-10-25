import 'package:flutter/material.dart';
class CustomClipPath extends CustomClipper<Path> {
  var radius=5.0;
  @override
  Path getClip(Size size) {
    double w=size.width;
    double h=size.height;
    Path path = Path();

    path.lineTo(0, h-60);
    path.quadraticBezierTo(w*0.5, h,w,h-60);
    path.lineTo(w, 0);
    path.close();
    return path;
  }
  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}