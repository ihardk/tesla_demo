import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';

import '../constants/size_config.dart';
import '../widgets/round_icon_button.dart';
import '../widgets/round_progress.dart';

class ClimateScreen extends StatelessWidget {
  const ClimateScreen({super.key});

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
              child: const RoundedIconButton(icon: user),
            ),
            Expanded(
              child: Container(
                alignment: Alignment.center,
                child: Text(
                  "CLIMATE",
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
          children: [
            Column(
              // mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(150),
                const RoundedProgress(icon: setting),
                const Gap(60),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                    children: List.generate(
                      10,
                      (index) => const SliderUnit(title: "Heat", icon: setting),
                    ),
                  ),
                ))
                // SliderUnit(title: "Ac", icon: setting),
                // SliderUnit(title: "Fan", icon: setting),
                // SliderUnit(title: "Heat", icon: setting),
                // SliderUnit(title: "Auto", icon: setting),
              ],
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              height: SizeConfig.screenHeight * 0.15,
              child: Stack(
                children: [
                  const BlurryEffect(0.5, 7, Color(0x30000000)),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class BlurryEffect extends StatelessWidget {
  final double opacity;
  final double blurry;
  final Color shade;

  const BlurryEffect(this.opacity, this.blurry, this.shade, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurry, sigmaY: blurry),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: shade.withOpacity(opacity)),
        ),
      ),
    );
  }
}

class SliderUnit extends StatefulWidget {
  final String title;
  final String icon;
  const SliderUnit({
    super.key,
    required this.title,
    required this.icon,
  });

  @override
  State<SliderUnit> createState() => _SliderUnitState();
}

class _SliderUnitState extends State<SliderUnit> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          // height: SizeConfig.screenHeight * 0.345,
          // padding: const EdgeInsets.all(20),
          margin: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: SizeConfig.screenWidth * 0.1,
                  child: Text(
                    widget.title,
                    style: TextStyle(
                      color: const Color(0x80EBEBF5),
                      fontSize: SizeConfig.blockSizeHorizontal * 4.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
                const Gap(15),
                RoundedIconButton(icon: widget.icon),
                const Gap(25),
                Expanded(
                    child: Container(
                  height: SizeConfig.screenHeight * 0.002,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    // color: const Color(0xFF1C1D20),
                    // color: Colors.red,
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.white30,
                        blurRadius: 1.5,
                        spreadRadius: -0.5,
                        offset: Offset(0, 2),
                      ),
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                        spreadRadius: 0.2,
                        offset: Offset(0, 0),
                      )
                    ],
                  ),
                )),
              ]),
        ),
        Positioned(
          left: SizeConfig.blockSizeHorizontal * 40,
          child: Container(
            height: SizeConfig.screenHeight * 0.015,
            width: SizeConfig.screenWidth * 0.07,
            decoration: BoxDecoration(
              // color: Colors.red,
              boxShadow: const [
                // BoxShadow(
                //   color: Colors.white30,
                //   blurRadius: 1.5,
                //   spreadRadius: -0.5,
                //   offset: Offset(0, 2),
                // ),
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 5,
                  spreadRadius: 3,
                  offset: Offset(2, 2),
                )
              ],
              gradient: const LinearGradient(
                colors: [
                  Color(0xFF2E3236),
                  Color(0xFF141515),
                ],
                stops: [0, 1],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        )
      ],
    );
  }
}
