import 'package:flutter/material.dart';

class TCustomCurveEdges extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    
    // Start from the bottom-left corner
    path.lineTo(0.0, size.height);

    // First curve (left side, curving upwards)
    final firstControlPoint = Offset(0, size.height -20 );
    final firstEndPoint = Offset(30 , size.height-20);
    path.quadraticBezierTo(
        firstControlPoint.dx, firstControlPoint.dy, 
        firstEndPoint.dx, firstEndPoint.dy);

    // Middle curve (center, straight)
    final middleControlPoint = Offset(size.width -30, size.height-20 );
    final middleEndPoint = Offset(size.width-30 , size.height-20);
    path.quadraticBezierTo(
        middleControlPoint.dx, middleControlPoint.dy, 
        middleEndPoint.dx, middleEndPoint.dy);

    // Third curve (right side, opposite to the first)
    final thirdControlPoint = Offset(size.width , size.height-20 );
    final thirdEndPoint = Offset(size.width, size.height);
    path.quadraticBezierTo(
        thirdControlPoint.dx, thirdControlPoint.dy, 
        thirdEndPoint.dx, thirdEndPoint.dy);

    // Complete the path by drawing to the top-right corner
    path.lineTo(size.width, 0);

    // Close the path by drawing to the top-left corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
