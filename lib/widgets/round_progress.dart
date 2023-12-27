import 'dart:math';

import 'package:flutter/material.dart';

import '../constants/size_config.dart';
import '../constants/theme.dart';
import '../utils/circular_arc_calculations.dart';

double radius = 135;
double strokeWidth = 30;

class RoundedProgress extends StatefulWidget {
  final String icon;
  const RoundedProgress({
    super.key,
    required this.icon,
  });

  @override
  State<RoundedProgress> createState() => _RoundedProgressState();
}

class _RoundedProgressState extends State<RoundedProgress> {
  int volume = 0;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        _outsideShadow(),
        _middleCircle2(),
        _middleCircle(),
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
      height: SizeConfig.screenHeight * 0.12,
      width: SizeConfig.screenWidth * 0.265,
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
      // child: Image.asset(icon),
    );
  }

  Container _middleCircle2() {
    return Container(
      height: SizeConfig.screenHeight * 0.18,
      width: SizeConfig.screenWidth * 0.38,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        // color: black,
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
      onAngleChanged: (value) {
        volume = ((value / (pi * 2)) * 100).toInt();
        setState(() {});
      },
    );
  }
}

class ProgressArc extends StatefulWidget {
  final ValueChanged<double> onAngleChanged;
  const ProgressArc({
    super.key,
    required this.onAngleChanged,
  });

  @override
  State<ProgressArc> createState() => _ProgressArcState();
}

class _ProgressArcState extends State<ProgressArc> {
  double startAngle = toRadian(90);

  double totalAngle = toRadian(360);

  Offset currentDragOffset = Offset.zero;

  double currentAngle = 0.05;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size / 2;
    Size canvasSize = Size(screenSize.width * 0.9, screenSize.width * 0.9);
    Offset center = canvasSize.center(Offset.zero);
    Offset knobPos = toPolar(
      center - Offset(strokeWidth * 0.8, strokeWidth * 1.5),
      currentAngle + startAngle,
      radius - 30,
    );

    return Stack(
      children: [
        CustomPaint(
          size: canvasSize,
          painter: ArcPaint(startAngle: startAngle, currentAngle: currentAngle),
        ),
        Positioned(
          left: knobPos.dx,
          top: knobPos.dy + 3,
          child: GestureDetector(
              onPanStart: (details) {
                RenderBox getBox = context.findRenderObject() as RenderBox;
                currentDragOffset =
                    getBox.globalToLocal(details.globalPosition);
              },
              onPanUpdate: (details) {
                var previousOffset = currentDragOffset;
                currentDragOffset += details.delta;
                var angle = currentAngle +
                    toAngle(currentDragOffset, center) -
                    toAngle(previousOffset, center);
                currentAngle = normalizeAngle(angle);
                widget.onAngleChanged(currentAngle);
                setState(() {});
              },
              child: Container(
                height: 18,
                width: 18,
                decoration: BoxDecoration(
                    color: white, borderRadius: BorderRadius.circular(100)),
              )),
        ),
      ],
    );
  }
}

class ArcPaint extends CustomPainter {
  final double startAngle;
  final double currentAngle;

  ArcPaint({required this.startAngle, required this.currentAngle});
  @override
  void paint(Canvas canvas, Size size) {
    Offset center = size.center(Offset.zero);

    Rect rect = Rect.fromCircle(center: center, radius: radius - 63);

    final paint = Paint()
      ..shader = const SweepGradient(
        colors: [
          Color(0xFF2FB8FF),
          Color(0x4083DFE2),
          Color(0x109EECD9),
        ],
        transform: GradientRotation(1.55),
      ).createShader(rect)
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth - 10
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, 5, paint);
    // paint.shader = const SweepGradient(
    //   colors: [
    //     kcSecondaryStart,
    //     kcSecondaryEnd,
    //   ],
    //   startAngle: 1,
    // ).createShader(rect);

    canvas.drawArc(rect, startAngle, currentAngle, false, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}