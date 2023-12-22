import 'package:flutter/material.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';

import '../constants/size_config.dart';
import 'lock_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List list = [
    car,
    charge,
    "",
    explore,
    user,
  ];
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        toolbarHeight: SizeConfig.screenHeight * 0.15,
        title: Container(
          padding: const EdgeInsets.only(
            left: 20,
          ),
          alignment: Alignment.centerLeft,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Tesla",
                style: TextStyle(
                  color: white,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Image.asset(
                battery,
                width: SizeConfig.blockSizeHorizontal * 17,
              ),
            ],
          ),
        ),
        actions: [
          Container(
            padding: const EdgeInsets.only(
              right: 20,
            ),
            child: const RoundedIconButton(icon: user),
          ),
        ],
      ),
      extendBodyBehindAppBar: true,
      body: Container(
        width: SizeConfig.screenWidth * 2,
        decoration: const BoxDecoration(
          gradient: homeBGLinear,
        ),
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Positioned(
              top: SizeConfig.screenHeight * 0.25,
              height: SizeConfig.screenHeight * 0.25,
              width: SizeConfig.screenWidth,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x11FFFFFF),
                      blurRadius: 100,
                      // spreadRadius: -100,
                      offset: Offset(0, -20),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(
                    top: SizeConfig.blockSizeHorizontal * 38,
                  ),
                  child: Image.asset(homecar),
                ),
              ],
            ),
            Positioned(
              top: SizeConfig.screenHeight * 0.5,
              // right: SizeConfig.blockSizeHorizontal * 8,
              child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  height: SizeConfig.screenHeight * 0.07,
                  width: SizeConfig.screenWidth * 0.85,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    boxShadow: const [
                      BoxShadow(
                        color: Color(0xFF27282A),
                        blurRadius: 10,
                        spreadRadius: 5,
                        offset: Offset(-3, -3),
                      ),
                      BoxShadow(
                        color: Color(0x70000000),
                        blurRadius: 10,
                        spreadRadius: 8,
                        offset: Offset(3, 3),
                      ),
                    ],
                    color: const Color(0xFF131313),
                  ),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: Image.asset(menulock),
                      ),
                      InkWell(
                        child: Image.asset(climate),
                      ),
                      InkWell(
                        child: Image.asset(charge),
                      ),
                      InkWell(
                        child: Image.asset(open),
                      )
                    ],
                  )),
            ),
            Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth * 0.279,
                      child: CustomPaint(
                        size: Size(SizeConfig.screenWidth,
                            SizeConfig.screenHeight * 0.09),
                        painter: ProfileCardPainter(
                            color: Colors.teal, avatarRadius: 30), //3
                      ),
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: List.generate(
                        list.length,
                        (index) => index == 2
                            ? const SizedBox(width: 60)
                            : InkWell(
                                child: Container(
                                  width: SizeConfig.screenWidth * 0.16,
                                  height: SizeConfig.screenHeight * 0.08,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      if (selectedIndex == index)
                                        const BoxShadow(
                                          color: Color(0x202FB8FF),
                                          blurRadius: 10,
                                          spreadRadius: -5,
                                          offset: Offset(-3, -3),
                                        ),
                                      if (selectedIndex == index)
                                        const BoxShadow(
                                          color: Color(0x209EECD9),
                                          blurRadius: 10,
                                          spreadRadius: -5,
                                          offset: Offset(3, 3),
                                        ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    selectedIndex == index
                                        ? "${list[index].substring(0, list[index].lastIndexOf('.'))}${index + 1}.png"
                                        : list[index],
                                  ),
                                ),
                                onTap: () => changeIndex(index),
                              ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }

  changeIndex(int i) {
    setState(() {
      selectedIndex = i;
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
    Path path_0 = Path();
    path_0.moveTo(0, 35.2235);
    path_0.cubicTo(0, 31.8714, 1.29483, 28.6489, 3.61415, 26.2287);
    path_0.lineTo(16.3492, 12.94);
    path_0.cubicTo(24.2708, 4.67391, 35.2237, 0, 46.6727, 0);

    path_0.lineTo(106.328, 0);
    path_0.cubicTo(114.903, 0, 123.273, 2.62492, 130.313, 7.52198);
    path_0.lineTo(151.302, 22.1232);
    path_0.cubicTo(166.749, 32.8689, 187.251, 32.8689, 202.698, 22.1232);
    path_0.lineTo(223.687, 7.52198);
    path_0.cubicTo(230.727, 2.62491, 239.097, 0, 247.672, 0);

    path_0.lineTo(size.width * 3.2, 0);
    path_0.cubicTo(size.width * 3.3, 0, size.width * 3.35, 4.67391,
        size.width * 3.45, 12.94);
    path_0.lineTo(size.width * 3.56, 26.2287);
    path_0.cubicTo(size.width * 3.58, 28.6489, size.width * 3.6, 31.8714,
        size.width * 3.6, 35.2235);
    path_0.lineTo(size.width * 3.6, 78);
    path_0.lineTo(0, 78);
    path_0.lineTo(0, 35.2235);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(0.44);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(ProfileCardPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
