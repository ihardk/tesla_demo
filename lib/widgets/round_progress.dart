import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:tesla_demo/constants/my_colors.dart';

import '../constants/size_config.dart';

double radius = 135;
double strokeWidth = 30;

class RoundedProgress extends StatefulWidget {
  final bool btnActive;
  final int? count;
  const RoundedProgress({
    super.key,
    this.count = 0,
    this.btnActive = false,
  });

  @override
  State<RoundedProgress> createState() => _RoundedProgressState();
}

class _RoundedProgressState extends State<RoundedProgress> {
  int volume = 10;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _outsideShadow(),
        _middleCircle2(),
        Visibility(visible: widget.btnActive, child: _middleCircle()),
        _topCircle(),
      ],
    );
  }

  Container _outsideShadow() {
    return Container(
      height: SizeConfig.screenHeight * 0.2,
      width: SizeConfig.screenWidth * 0.42,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        boxShadow: const [
          BoxShadow(
            color: Colors.white30,
            blurRadius: 40,
            spreadRadius: -10,
            offset: Offset(-15, -8),
          )
        ],
      ),
    );
  }

  Container _topCircle() {
    return Container(
      height: SizeConfig.screenHeight * 0.15,
      width: SizeConfig.screenWidth * 0.32,
      alignment: Alignment.center,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          border: Border.all(color: const Color(0x7032363B), width: 2),
          gradient: const LinearGradient(
            colors: [
              Color(0xFF101113),
              Color(0xFF2B2F33),
            ],
            stops: [0.1, 0.85],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          )),
      child: Text(
        '${widget.btnActive ? (widget.count ?? "-") : ''}',
        style: TextStyle(
          fontSize: SizeConfig.blockSizeHorizontal * 10,
          fontWeight: FontWeight.w600,
          color: const Color(0xFFEEEEEE),
        ),
      ),
    );
  }

  Container _middleCircle2() {
    return Container(
      height: SizeConfig.screenHeight * 0.22,
      width: SizeConfig.screenWidth * 0.46,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        gradient: const LinearGradient(
          colors: [
            Color(0xFF2B2F33),
            Color(0xFF101113),
          ],
          stops: [0.1, 0.9],
          begin: Alignment.topLeft,
          end: Alignment.bottomCenter,
        ),
      ),
    );
  }

  Widget _middleCircle() {
    return ProgressArc(
      count: (widget.count ?? 0).toDouble(),
      min: 0,
      max: 21,
    );
  }
}

class ProgressArc extends StatefulWidget {
  final double count;

  final double min;
  final double max;
  const ProgressArc({
    super.key,
    required this.min,
    required this.max,
    required this.count,
  });

  @override
  State<ProgressArc> createState() => _ProgressArcState();
}

class _ProgressArcState extends State<ProgressArc> {
  Offset currentDragOffset = Offset.zero;

  double currentAngle = 0.05;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size / 2;
    Size canvasSize = Size(screenSize.width * 1.2, screenSize.width * 1.2);

    return CustomPaint(
      size: canvasSize,
      painter: ArcPaint(
        value: widget.count,
        minValue: widget.min,
        maxValue: widget.max,
      ),
    );
  }
}

class ArcPaint extends CustomPainter {
  final double value;
  final double minValue;
  final double maxValue;

  ArcPaint({
    required this.value,
    required this.minValue,
    required this.maxValue,
  });
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius - 50);

    final paint = Paint()
      ..shader = const SweepGradient(
        colors: [
          kcPrimaryDark,
          kcPrimary,
          kcPrimary,
          kcPrimaryDark,
        ],
        transform: GradientRotation(1.55),
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth - 10
      ..strokeCap = StrokeCap.round;

    const double angleStart = 2.2;
    const double angleEnd = 7.1;
    final double sweepAngle = math.max(
            0.0, math.min(1.0, (value - minValue) / (maxValue - minValue))) *
        (angleEnd - angleStart);

    canvas.drawArc(rect, angleStart, sweepAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
