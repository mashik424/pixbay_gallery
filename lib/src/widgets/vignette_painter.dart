import 'package:flutter/material.dart';

class VignettePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Gradient gradient = RadialGradient(
      colors: [
        Colors.black.withOpacity(0.6),
        Colors.black.withOpacity(0.3),
        Colors.transparent,
      ],
      center: Alignment.bottomLeft,
      radius: 0.8,
      stops: const [0.0, 0.5, 1.0],
    );

    final rect = Offset.zero & size;
    final paint = Paint()..shader = gradient.createShader(rect);

    canvas.drawRect(rect, paint);
  }

  @override
  bool shouldRepaint(VignettePainter oldDelegate) => false;
}
