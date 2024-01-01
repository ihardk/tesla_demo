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
    return ValueListenableBuilder(
        valueListenable: homeTabIndex,
        builder: (context, _, __) {
          return Scaffold(
            // floatingActionButton: Container(
            //   // margin: const EdgeInsets.only(bottom: 30),
            //   child: FloatingActionButton(
            //     onPressed: () {},
            //     child: Image.asset(plus),
            //   ),
            // ),
            // floatingActionButtonLocation:
            //     FloatingActionButtonLocation.centerFloat,

            // floatingActionButton: FloatingActionButton(
            //   backgroundColor: primaryColor,
            //   onPressed: () {
            //     if ((Get.find<AuthController>().setUp?.adInterstitialId ?? "")
            //         .isNotEmpty) {
            //       Get.find<AdMobController>().showInterstitialAd();
            //     }
            //     Navigator.of(context).push(MaterialPageRoute(
            //         builder: (_) => const UploadNewsScreen()));
            //   },
            //   shape: ContinuousRectangleBorder(
            //       borderRadius: BorderRadius.circular(15)),
            //   child: const Icon(
            //     Icons.add_rounded,
            //     size: 28,
            //   ),
            // ),
            body: Column(
              children: [
                Expanded(
                  child: IndexedStack(
                    index: homeTabIndex.value,
                    children: const [
                      HomeTab(),
                      TeslaDetailsTab(),
                    ],
                  ),
                ),
                Stack(
                  alignment: Alignment.centerLeft,
                  children: [
                    SizedBox(
                      width: SizeConfig.screenWidth,
                      child: CustomPaint(
                        size: Size(SizeConfig.screenWidth,
                            SizeConfig.screenHeight * 0.09),
                        painter: ProfileCardPainter(
                          color: kcPrimary,
                          avatarRadius: 30,
                        ),
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
              ],
            ),
          );
        });
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
    Path path_0 = Path();
    path_0.moveTo(0, 35.2235);
    path_0.cubicTo(0, 31.8714, 1.29483, 28.6489, 3.61415, 26.2287);
    path_0.lineTo(16.3492, 12.94);
    path_0.cubicTo(24.2708, 4.67391, 35.2237, 0, 46.6727, 0);

    path_0.lineTo(110.328, 0);
    path_0.cubicTo(118.903, 0, 127.273, 2.62492, 134.313, 7.52198);
    path_0.lineTo(153.302, 22.1232);
    path_0.cubicTo(168.749, 32.8689, 189.251, 32.8689, 204.698, 22.1232);
    path_0.lineTo(223.687, 7.52198);
    path_0.cubicTo(230.727, 2.62491, 239.097, 0, 247.672, 0);

    path_0.lineTo(size.width * 0.76, 0);
    path_0.cubicTo(size.width * 0.915, 0, size.width * 0.92, 4.67391,
        size.width * 0.95, 12.94);
    path_0.lineTo(size.width * 0.99, 26.2287);
    path_0.cubicTo(size.width * 0.995, 28.6489, size.width * 1, 31.8714,
        size.width * 1, 35.2235);
    path_0.lineTo(size.width * 1, 78);
    path_0.lineTo(0, 78);
    path_0.lineTo(0, 35.2235);
    path_0.close();

    Paint paint0Fill = Paint()..style = PaintingStyle.fill;
    paint0Fill.color = Colors.black.withOpacity(0.90);
    canvas.drawPath(path_0, paint0Fill);
  }

  @override
  bool shouldRepaint(ProfileCardPainter oldDelegate) {
    return color != oldDelegate.color;
  }
}
