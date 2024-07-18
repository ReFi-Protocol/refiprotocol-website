import 'dart:math';

import 'package:flutter/material.dart';

class DottedCircle extends StatelessWidget {
  final Color color;
  final double radius;
  final double strokeWidth;
  final double gap;

  const DottedCircle({super.key, 
    this.color = Colors.black,
    this.radius = 50,
    this.strokeWidth = 2,
    this.gap = 5,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(radius * 2, radius * 2),
      painter: DottedCirclePainter(
          color: color, radius: radius, strokeWidth: strokeWidth, gap: gap),
    );
  }
}

class DottedCirclePainter extends CustomPainter {
  final Color color;
  final double radius;
  final double strokeWidth;
  final double gap;

  DottedCirclePainter({
    this.color = Colors.black,
    this.radius = 50,
    this.strokeWidth = 2,
    this.gap = 5,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeWidth = strokeWidth
      ..style = PaintingStyle.stroke;

    final double circumference = 2 * radius * 3.14;
    final int totalDots = (circumference / gap).round();

    for (int i = 0; i < totalDots; i++) {
      double angle = (i * 360 / totalDots) * 3.14 / 180;
      double x1 = radius + radius * cos(angle);
      double y1 = radius + radius * sin(angle);
      double x2 = radius + (radius - strokeWidth) * cos(angle);
      double y2 = radius + (radius - strokeWidth) * sin(angle);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}
