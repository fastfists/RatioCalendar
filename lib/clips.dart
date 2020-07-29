import 'package:flutter/material.dart';


class SemiCircleClipper extends CustomClipper<Path> {

  @override
  Path getClip(Size size) {
    Path path = Path();

    var height = 2*size.height/3;
    var startingHeight = size.height*.22;

    path.moveTo(0, 0);

    path.lineTo(0, startingHeight);
    // path.cubicTo(size.width/4, height, 3*size.width/4, height, size.width, 0);
    path.quadraticBezierTo(size.width/2, height*1.5, size.width, startingHeight);
    path.lineTo(0,startingHeight);

    return path;
  }
  
  @override
  bool shouldReclip(oldClipper) => false;
}

class SquareCircleClipper extends CustomClipper<Path> {
  
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.moveTo(0, 0);

    path.lineTo(size.width, 0);

    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height*0.6);

    path.lineTo(0, 0);

    return path;
  }
  
  @override
  bool shouldReclip(oldClipper) => false;

}
