// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:tesla_demo/screens/home/tab/charging_tab.dart';

import '../../constants/images.dart';
import '../../constants/my_colors.dart';
import '../../constants/size_config.dart';
import 'tab/home_tab.dart';

final homeTabIndex = ValueNotifier(0);

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final list = [
    car,
    charge,
    "",
    explore,
    user,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kcBG,
      floatingActionButton: Container(
        margin: const EdgeInsets.only(bottom: 40),
        child: FloatingActionButton(
          onPressed: () {},
          child: Image.asset(plus),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
            child: IndexedStack(
              index: homeTabIndex.value,
              children: [
                const HomeTab(),
                const TeslaDetailsTab(),
                Container(),
                Container(),
                Container(),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            width: SizeConfig.screenWidth,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomPaint(
                  size: Size(
                    SizeConfig.screenWidth,
                    SizeConfig.screenHeight * 0.07,
                  ),
                  painter: ProfileCardPainter(
                    color: kcPrimary,
                    avatarRadius: 30,
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: List.generate(
                    list.length,
                    (index) => index == 2
                        ? const SizedBox(width: 60)
                        : GestureDetector(
                            child: Container(
                              width: SizeConfig.screenWidth * 0.16,
                              height: SizeConfig.screenHeight * 0.08,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                boxShadow: [
                                  if (homeTabIndex.value == index)
                                    const BoxShadow(
                                      color: Color(0x202FB8FF),
                                      blurRadius: 10,
                                      spreadRadius: -5,
                                      offset: Offset(-3, -3),
                                    ),
                                  if (homeTabIndex.value == index)
                                    const BoxShadow(
                                      color: Color(0x209EECD9),
                                      blurRadius: 10,
                                      spreadRadius: -5,
                                      offset: Offset(3, 3),
                                    ),
                                ],
                              ),
                              child: Image.asset(
                                homeTabIndex.value == index
                                    ? "${list[index].substring(0, list[index].lastIndexOf('.'))}${index + 1}.png"
                                    : list[index],
                              ),
                            ),
                            onTap: () => changeIndex(index),
                          ),
                  ),
                ),
                Positioned(
                  bottom: 10,
                  child: Container(
                    width: SizeConfig.screenWidth * 0.1,
                    height: SizeConfig.screenWidth * 0.05,
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Color(0x44ffffff),
                          blurRadius: 30,
                          spreadRadius: 30,
                          offset: Offset(0, 25),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(
      Duration.zero,
      () => setState(() {}),
    );
  }

  changeIndex(int i) {
    setState(() {
      homeTabIndex.value = i;
    });
  }
}

class ProfileCardPainter extends CustomPainter {
  ProfileCardPainter({required this.color, required this.avatarRadius});

  final Color color;
  final double avatarRadius;

  @override
  void paint(Canvas canvas, Size size) {
    final shapeBounds =
        Rect.fromLTWH(0, 0, size.width, size.height - avatarRadius);
    _drawBackground(canvas, shapeBounds, size);
  }

  void _drawBackground(Canvas canvas, Rect shapeBounds, Size size) {
    // Layer 1

    // Layer 1

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 33, 34, 34)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * -0.0011111, size.height * 0.5000000);
    path_0.cubicTo(
        size.width * 0.0180556,
        size.height * 0.2975000,
        size.width * 0.0733333,
        size.height * 0.0975000,
        size.width * 0.1133333,
        size.height * -0.0100000);
    path_0.cubicTo(
        size.width * 0.1822222,
        size.height * -0.0062500,
        size.width * 0.3200000,
        size.height * 0.0012500,
        size.width * 0.3888889,
        size.height * 0.0050000);
    path_0.cubicTo(
        size.width * 0.4283333,
        size.height * 0.1525000,
        size.width * 0.4116667,
        size.height * 0.2725000,
        size.width * 0.4988889,
        size.height * 0.2700000);
    path_0.cubicTo(
        size.width * 0.5991667,
        size.height * 0.2850000,
        size.width * 0.5619444,
        size.height * 0.1437500,
        size.width * 0.6111111,
        0);
    path_0.cubicTo(size.width * 0.6636111, 0, size.width * 0.8208333, 0,
        size.width * 0.8911111, 0);
    path_0.cubicTo(
        size.width * 0.9488889,
        size.height * 0.1425000,
        size.width * 0.9955556,
        size.height * 0.3575000,
        size.width * 1.0022222,
        size.height * 0.5100000);
    path_0.quadraticBezierTo(size.width * 1.0025000, size.height * 0.6362500,
        size.width * 1.0033333, size.height * 1.0150000);
    path_0.lineTo(size.width * -0.0011111, size.height * 1.0100000);
    path_0.quadraticBezierTo(size.width * -0.0011111, size.height * 0.8825000,
        size.width * -0.0011111, size.height * 0.5000000);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1

    // Layer 1
  }

  @override
  bool shouldRepaint(ProfileCardPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
