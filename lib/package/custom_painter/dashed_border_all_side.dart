import 'package:flutter/material.dart';

class DashedBorderAllSidePainter extends CustomPainter {
  final double radius;

  DashedBorderAllSidePainter({required this.radius});

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.grey
      ..strokeWidth = 1
      ..style = PaintingStyle.stroke;

    const dashWidth = 5;
    const dashSpace = 5;
    double startX = 0;

    // Draw top border
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, radius),
        Offset(startX + dashWidth, radius),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Draw bottom border
    startX = 0;
    while (startX < size.width) {
      canvas.drawLine(
        Offset(startX, size.height - radius),
        Offset(startX + dashWidth, size.height - radius),
        paint,
      );
      startX += dashWidth + dashSpace;
    }

    // Draw left border
    double startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(radius, startY),
        Offset(radius, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }

    // Draw right border
    startY = 0;
    while (startY < size.height) {
      canvas.drawLine(
        Offset(size.width - radius, startY),
        Offset(size.width - radius, startY + dashWidth),
        paint,
      );
      startY += dashWidth + dashSpace;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}


