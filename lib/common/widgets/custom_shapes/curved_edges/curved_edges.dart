

import 'package:flutter/material.dart';

class UCustomCircularEdges extends CustomClipper<Path>{

  @override
  Path getClip(Size size){
    var path = Path();
    path.lineTo(0, size.height);

    final firstcurve = Offset(0, size.height -  20);
    final lasrcurve = Offset(30, size.height - 20);
    path.quadraticBezierTo(firstcurve.dx, firstcurve.dy, lasrcurve.dx, lasrcurve.dy);

    final secondcurve = Offset(0, size.height -  20);
    final secondlasrcurve = Offset(size.width-30, size.height - 20);
    path.quadraticBezierTo(secondcurve.dx, secondcurve.dy, secondlasrcurve.dx, secondlasrcurve.dy);

    final thirdcurve = Offset(size.width, size.height -  20);
    final thirdlasrcurve = Offset(size.width, size.height);
    path.quadraticBezierTo(thirdcurve.dx, thirdcurve.dy, thirdlasrcurve.dx, thirdlasrcurve.dy);

    path.lineTo(size.width, 0);
    path.close();
    return path;
  }



  @override
  bool shouldReclip(CustomClipper<Path> oldClipper){
    return true;
  }
}