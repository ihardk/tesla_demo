// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:tesla_demo/screens/home/tab/tesla_details_tab.dart';

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
        margin: const EdgeInsets.only(bottom: 30),
        child: FloatingActionButton(
          onPressed: () {},
          child: Image.asset(plus),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      body: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            child: IndexedStack(
              index: homeTabIndex.value,
              children: const [
                HomeTab(),
                TeslaDetailsTab(),
                TeslaDetailsTab(),
                TeslaDetailsTab(),
              ],
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight * 0.1,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                CustomPaint(
                  size: Size(
                    SizeConfig.screenWidth,
                    SizeConfig.screenHeight * 0.1,
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
                Container(
                  width: SizeConfig.screenWidth * 0.2,
                  decoration: const BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x44ffffff),
                        blurRadius: 30,
                        spreadRadius: 18,
                        offset: Offset(140, 25),
                      ),
                    ],
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

    Paint paintFill0 = Paint()
      ..color = const Color.fromARGB(255, 36, 35, 35)
      ..style = PaintingStyle.fill
      ..strokeWidth = size.width * 0.00
      ..strokeCap = StrokeCap.butt
      ..strokeJoin = StrokeJoin.miter;

    Path path_0 = Path();
    path_0.moveTo(size.width * 0.0024833, size.height * 0.4835667);
    path_0.quadraticBezierTo(size.width * 0.0365250, size.height * 0.3363333,
        size.width * 0.0836083, size.height * 0.3280000);
    path_0.cubicTo(
        size.width * 0.1552750,
        size.height * 0.2996667,
        size.width * 0.2246750,
        size.height * 0.2787667,
        size.width * 0.4046750,
        size.height * 0.3437667);
    path_0.cubicTo(
        size.width * 0.4509667,
        size.height * 0.4296000,
        size.width * 0.4106167,
        size.height * 0.6206000,
        size.width * 0.5041583,
        size.height * 0.6564333);
    path_0.cubicTo(
        size.width * 0.5977000,
        size.height * 0.6164333,
        size.width * 0.5573167,
        size.height * 0.4189333,
        size.width * 0.5889833,
        size.height * 0.3339333);
    path_0.cubicTo(
        size.width * 0.6989833,
        size.height * 0.2747667,
        size.width * 0.8296667,
        size.height * 0.3077667,
        size.width * 0.9177583,
        size.height * 0.3391667);
    path_0.quadraticBezierTo(size.width * 0.9753250, size.height * 0.3403667,
        size.width * 1.0033250, size.height * 0.5240000);
    path_0.lineTo(size.width * 1.0011083, size.height * 1.0021333);
    path_0.lineTo(size.width * 0.0003833, size.height * 0.9992333);
    path_0.lineTo(size.width * 0.0024833, size.height * 0.4835667);
    path_0.close();

    canvas.drawPath(path_0, paintFill0);

    // Layer 1
  }

  @override
  bool shouldRepaint(ProfileCardPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
