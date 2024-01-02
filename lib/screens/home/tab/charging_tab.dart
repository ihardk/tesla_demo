import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'dart:ui' as ui;
import '../../../constants/images.dart';
import '../../../constants/my_colors.dart';
import '../../../constants/size_config.dart';
import '../../../constants/theme.dart';
import '../../../widgets/custom_slider.dart';
import '../../../widgets/round_icon_button.dart';

class TeslaDetailsTab extends StatefulWidget {
  const TeslaDetailsTab({super.key});

  @override
  State<TeslaDetailsTab> createState() => _TeslaDetailsTabState();
}

class _TeslaDetailsTabState extends State<TeslaDetailsTab> {
  bool containerExpanded = false;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: SizeConfig.screenHeight * 0.12,
        automaticallyImplyLeading: false,
        title: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.only(
                right: 20,
              ),
              child: RoundedIconButton(
                icon: leftarrow,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
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
        width: SizeConfig.screenWidth,
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
          children: [
            Gap(SizeConfig.blockSizeVertical * 17),
            Image.asset(chargingcar),
            Gap(SizeConfig.blockSizeVertical * 2),
            const MyGlowSlider(),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.all(SizeConfig.safeBlockHorizontal * 5),
              height: containerExpanded
                  ? SizeConfig.screenHeight * 0.35
                  : SizeConfig.screenHeight * 0.11,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: const Color(0xFF202122),
                // color: Colors.red,
                boxShadow: const [
                  BoxShadow(
                    color: Color(0x20000000),
                    blurRadius: 1,
                    spreadRadius: -1,
                    offset: Offset(0, 1),
                  ),
                  BoxShadow(
                    color: Color(0x10FFFFFF),
                    blurRadius: 1,
                    spreadRadius: -5,
                    offset: Offset(-5, 5),
                  ),
                ],
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Nearby Superchargers",
                            style: TextStyle(
                              fontSize: SizeConfig.safeBlockHorizontal * 5,
                            ),
                          ),
                        ),
                        RoundedIconButton(
                          icon: containerExpanded ? uparrow : downarrow,
                          onTap: () {
                            setState(() {
                              containerExpanded = !containerExpanded;
                            });
                          },
                        )
                      ],
                    ),
                    const Gap(10),
                    ...List.generate(
                      10,
                      (index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              vertical: SizeConfig.safeBlockVertical * 2),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Tesla Superchargers - \nMontreal, QC",
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal * 4,
                                      ),
                                    ),
                                    const Gap(5),
                                    Text(
                                      "2/4 available",
                                      style: TextStyle(
                                        fontSize:
                                            SizeConfig.safeBlockHorizontal *
                                                3.5,
                                        color: const Color(0x60EBEBF5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                children: [
                                  Image.asset(
                                    marker,
                                    height: SizeConfig.screenHeight * 0.04,
                                    width: SizeConfig.screenWidth * 0.1,
                                  ),
                                  const Gap(5),
                                  Text(
                                    "1.7 km",
                                    style: TextStyle(
                                      fontSize:
                                          SizeConfig.safeBlockHorizontal * 3,
                                      color: const Color(0x60EBEBF5),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
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
        const Gap(2),
        CustomPaint(
          size: Size(
            SizeConfig.screenWidth * 0.75,
            (SizeConfig.safeBlockVertical * 25 * 0.17).toDouble(),
          ),
          painter: BatteryPaint(value: value),
        ),
        const Gap(30),
        const Text("Set Charging Limit"),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              CustomSlider(
                trackHeight: 10,
                max: 1,
                btnActive: true,
                onChanged: (value) {
                  setState(() {
                    this.value = value;
                  });
                },
                inActiveTrackColor: kcBGGrey,
                activeTrackColor: Colors.cyan,
                linearGradient: const LinearGradient(colors: [
                  Colors.cyan,
                  Colors.blue,
                ]),
                min: 0,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text("0%"),
                    Text(""),
                    Text(""),
                    Text("75%"),
                    Text("100%")
                  ],
                ),
              ),
            ],
          ),
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
    if (value > 0.06) {
      filledPath =
          _drawBatteryPath(height: size.height, width: valueFilledWidth);
    }
    topPath = _drawBatteryPath(height: size.height, width: size.width);
    _drawBatteryBorder(size, canvas);
    // if (value > 0.06) _bottomRect(size, canvas);
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
      ..color = const Color.fromARGB(255, 71, 169, 189)
      // ..maskFilter = const MaskFilter.blur(BlurStyle.inner, 10)
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
              kcPrimaryDark,
              kcPrimary,
            ],
      // : [const Color(0xFF9EECD9), const Color(0xff2FB8FF)],
      [-1, 2],
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
        kcPrimary,
        kcPrimaryDark,
      ],
      [0.4, 1.0],
    );

    Paint glowPaint = Paint()
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 20);

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
