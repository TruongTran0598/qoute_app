import 'package:flutter/material.dart';

class LoginScreenPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paintFirstLayout = Paint()
      ..color = Colors.white
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    var paintSecondLayout = Paint()
      ..color = const Color(0xFFa5d6f7)
      ..strokeWidth = 1
      ..style = PaintingStyle.fill;

    Path pathFistLayout = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height * 0.93)
      ..quadraticBezierTo(
          size.width * 0.5, size.height * 0.94, 0, size.height * 0.7)
      ..lineTo(0, size.height * 0.7)
      ..close();

    Path pathSecondLayout = Path()
      ..moveTo(0, 0)
      ..lineTo(size.width, 0)
      ..lineTo(size.width, size.height)
      ..lineTo(size.width * 0.65, size.height)
      ..quadraticBezierTo(
          size.width * 0.25, size.height * 0.95, 0, size.height * 0.7)
      ..close();

    canvas.drawPath(pathSecondLayout, paintSecondLayout);
    canvas.drawPath(pathFistLayout, paintFirstLayout);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}