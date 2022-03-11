// Youtube URL: 
// This is the code presented in the URL above.
// The reading order is easier if you follow the numbers in the file.

import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'app_color.dart';

/// Circles representing the progress of a number.
/// （数字の進度を表す円）

class CircleProgress extends CustomPainter {
  final strokeCircle = 20.0;
  double currentProgress;
  int maxValue;
  CircleProgress(
    this.currentProgress,
    this.maxValue,
  );

  // Color setting（色の設定）
  final gradient = LinearGradient(
    colors: <Color>[
      Colors.lightBlueAccent.withOpacity(1.0),
      Colors.deepPurpleAccent.withOpacity(1.0),
      Colors.deepOrangeAccent.withOpacity(1.0),
    ],
    stops: const [
      0.0,
      0.8,
      1.0,
    ],
  );

  @override
  void paint(Canvas canvas, Size size) {
    // Circle setting（円の設定）
    Paint circle = Paint()
      ..strokeWidth = strokeCircle
      ..color = HexColor('404040')
      ..style = PaintingStyle.stroke;

    Offset center = Offset(size.width / 2, size.height / 2);
    double radius = 150;
    canvas.drawCircle(center, radius, circle);

    // Animation setting（アニメーションの設定）
    final rect = Rect.fromLTRB(0, 0, 300, 300);
    Paint animationArc = Paint()
      ..strokeWidth = strokeCircle
      ..shader = gradient.createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    double angle = 2 * pi * (currentProgress / maxValue.toDouble());
    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, animationArc);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return true;
  }
}
