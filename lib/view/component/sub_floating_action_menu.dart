import 'package:flutter/material.dart';

class SubFloatingActionMenu extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path
      ..moveTo(size.width * .2, size.height * .2)
      ..quadraticBezierTo(
        size.width * .5,
        0,
        size.width * .8,
        size.height * .2,
      )
      ..quadraticBezierTo(
        size.width,
        size.height * .45,
        size.width * .8,
        size.height * .75,
      )
      ..lineTo(size.width * .7, size.height * .86)
      ..quadraticBezierTo(
        size.width * .5,
        size.height,
        size.width * .3,
        size.height * .86,
      )
      ..lineTo(size.width * .2, size.height * .75)
      ..quadraticBezierTo(
        0,
        size.height * .45,
        size.width * .2,
        size.height * .2,
      );

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) => true;
}
