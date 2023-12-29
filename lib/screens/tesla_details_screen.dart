import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:ui' as ui;
import '../constants/images.dart';
import '../constants/my_colors.dart';
import '../constants/size_config.dart';
import '../constants/theme.dart';
import '../widgets/my_new_progress_slider.dart';
import '../widgets/round_icon_button.dart';

class TeslaDetailsScreen extends StatefulWidget {
  const TeslaDetailsScreen({super.key});

  @override
  State<TeslaDetailsScreen> createState() => _TeslaDetailsScreenState();
}

class _TeslaDetailsScreenState extends State<TeslaDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.screenHeight * 0.12,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: const RoundedIconButton(icon: leftarrow),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "CHARGING",
                  style: TextStyle(
                      color: white,
                      fontSize: SizeConfig.blockSizeHorizontal * 4.5),
                ),
              ),
            ),
          ],
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: const RoundedIconButton(icon: setting),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color(0xFF2A2D32),
              Color(0xFF1D1D1D),
            ],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: Column(
          children: const [Gap(120), MyGlowSlider()],
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
            fontSize: 30,
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
    path.lineTo(
      width,
      height * 0.8500000,
    );
    path.lineTo(
      width - 10,
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
      Offset(width * 0.50, size.height * 0.40),
      Offset(width * 0.50, size.height),

      value < 0.3
          ? [
              Colors.orange,
              Colors.red,
            ]
          : [
              const Color(0xFF2FB8FF),
              const Color(0xFF9EECD9),
            ],
      // : [const Color(0xFF9EECD9), const Color(0xff2FB8FF)],
      [-1, 0.8],
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
      [
        const Color(0xFF9EECD9),
        const Color(0xff2FB8FF),
      ],
      [0.4, 1.0],
    );

    Paint glowPaint = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 30);

    glowPaint.shader = ui.Gradient.linear(
      Offset(size.width * 0.50, size.height * 0.50),
      Offset(size.width * 0.50, size.height),
      [
        value > 0.3 ? const Color(0xFF9EECD9) : const Color(0x53F3B320),
        value > 0.3 ? const Color(0x119EECD9) : const Color(0x53F3B320)
      ],
      [0.3, 1.0],
    );
    // glowPaint.maskFilter = const MaskFilter.blur(BlurStyle.inner, 4);

    final rect =
        Rect.fromLTWH(0, size.height * 1, valueFilledWidth, size.height * 0.2);

    final path = Path();
    path.addPolygon(
      [
        const Offset(10, -10),
        Offset(valueFilledWidth, -10),
        Offset(valueFilledWidth - 10, 10),
        const Offset(10, 20),
      ],
      true,
    );

    canvas.drawRect(rect, bottomPaint);
    canvas.drawPath(path, glowPaint);
  }
}
