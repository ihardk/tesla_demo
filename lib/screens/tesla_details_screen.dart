import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tesla_demo/constants/my_colors.dart';

import 'dart:ui' as ui;

import 'package:tesla_demo/widgets/my_new_progress_slider.dart';

class TeslaDetailsScreen extends StatelessWidget {
  const TeslaDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            children: const [Gap(120), MyGlowSlider()],
          ),
        ),
      ),
    );
  }
}

class MyGlowSlider extends StatefulWidget {
  const MyGlowSlider({
    super.key,
  });

  @override
  State<MyGlowSlider> createState() => _MyGlowSliderState();
}

class _MyGlowSliderState extends State<MyGlowSlider> {
  var value = 0.5;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "${(value * 100).toStringAsFixed(1)}%",
          style: const TextStyle(
            fontSize: 50,
            color: Colors.white,
          ),
        ),
        CustomPaint(
          size: Size(
            300,
            (300 * 0.17).toDouble(),
          ), //You can Replace [WIDTH] with your desired width for Custom Paint and height will be calculated automatically
          painter: BatteryPaint(value: value),
        ),
        const Gap(80),
        CustomSlider(
          trackHeight: 10,
          max: 1,
          onChanged: (value) {
            setState(() {
              this.value = value;
            });
          },
          inActiveTrackColor: kcBGGrey,
          activeTrackColor: Colors.cyan,
          linearGradient:
              const LinearGradient(colors: [Colors.cyan, Colors.blue]),
          min: 0,
        )
      ],
    );
  }
}

class BatteryPaint extends CustomPainter {
  final double value;

  BatteryPaint({this.value = 1});

  Path topPath = Path();
  Path filledPath = Path();

  var valueFilledWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    // Layer 1
    valueFilledWidth = size.width *
        (value > 1
            ? 1
            : value < 0
                ? 0
                : value);
    _batteryShape(size, canvas);
  }

  void _batteryShape(Size size, Canvas canvas) {
    valueFilledWidth = size.width * value;
    Paint topPaint = _batteryPaint(size, valueFilledWidth);
    if (value > 0.04) {
      filledPath =
          _drawBatteryPath(height: size.height, width: valueFilledWidth);
    }
    topPath = _drawBatteryPath(height: size.height, width: size.width);
    _drawBatteryBorder(size, canvas);
    if (value > 0.04) _bottomRect(size, canvas);
    canvas.drawPath(filledPath, topPaint);
  }

  void _drawBatteryBorder(Size size, Canvas canvas) {
    Paint topBorderPaint = Paint()
      ..color = Colors.grey.shade800.withOpacity(0.5)
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.003;

    canvas.drawPath(topPath, topBorderPaint);
  }

  Path _drawBatteryPath({required double height, required double width}) {
    Path path = Path();
    path.moveTo(0, height + 10);
    path.lineTo(width, height + 10);
    path.quadraticBezierTo(
      width,
      height * 0.8500000,
      width,
      height * 0.8000000,
    );
    path.cubicTo(
      width * 0.9950000,
      height * 0.6400000,
      width * 0.9787500,
      height * 0.1700000,
      width * 0.9500000,
      0,
    );
    path.lineTo(12, 0);

    path.lineTo(0, height * 0.8575000);
    path.lineTo(0, height);
    path.close();

    return path;
  }

  Paint _batteryPaint(Size size, double width) {
    Paint topPaint = Paint()
      ..color = const Color.fromARGB(255, 35, 220, 255)
      ..style = PaintingStyle.fill
      ..strokeWidth = width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    topPaint.shader = ui.Gradient.linear(
      Offset(width * 0.50, size.height * 0.50),
      Offset(width * 0.50, size.height),
      value < 0.3
          ? [Colors.orange, Colors.red]
          : [const Color(0xFF9EECD9), const Color(0xff2FB8FF)],
      [0.4, 1.0],
    );
    return topPaint;
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }

  void _bottomRect(Size size, Canvas canvas) {
    Paint bottomPaint = Paint()..strokeJoin = StrokeJoin.miter;

    bottomPaint.shader = ui.Gradient.linear(
      Offset(size.width * 0.50, size.height * 0.50),
      Offset(size.width * 0.50, size.height),
      [const Color(0xFF9EECD9), const Color(0xff2FB8FF)],
      [0.4, 1.0],
    );

    Paint glowPaint = Paint()..style = PaintingStyle.fill;

    glowPaint.shader = ui.Gradient.linear(
      Offset(size.width * 0.50, size.height * 0.50),
      Offset(size.width * 0.50, size.height),
      [
        value > 0.3 ? const Color(0x559EECD9) : const Color(0x53F3B320),
        const Color(0x53F3B320)
      ],
      [0.3, 1.0],
    );
    glowPaint.maskFilter = const MaskFilter.blur(BlurStyle.inner, 4);

    final rect =
        Rect.fromLTWH(0, size.height * 1, valueFilledWidth, size.height * 0.2);

    final path = Path();
    path.addPolygon(
      [
        const Offset(0, -50),
        Offset(valueFilledWidth, -50),
        Offset(valueFilledWidth - 8, 20),
        const Offset(10, 20),
      ],
      true,
    );

    canvas.drawPath(path, glowPaint);
    canvas.drawRect(rect, bottomPaint);
  }
}
