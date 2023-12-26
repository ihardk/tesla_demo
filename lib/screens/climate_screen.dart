import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';

import '../constants/size_config.dart';

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
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: const [
            Gap(200),
            RoundedProgress(icon: setting),
            Gap(50),
            SliderUnit(title: "Ac", icon: setting),
            SliderUnit(title: "Fan", icon: setting),
            SliderUnit(title: "Heat", icon: setting),
            SliderUnit(title: "Auto", icon: setting),
          ],
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
  // final double _value = 0.0;
  // final bool _isDragging = false;
  // final bool _isSlideCompleted = false;

  // late AnimationController _controller;
  // late Animation<double> _animation;
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

class RoundedProgress extends StatelessWidget {
  final String icon;
  const RoundedProgress({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
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
        ),
        Container(
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
        ),
        Container(
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
        ),
      ],
    );
  }
}

class RoundedIconButton extends StatelessWidget {
  final String icon;
  const RoundedIconButton({
    super.key,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          height: SizeConfig.screenHeight * 0.06,
          width: SizeConfig.screenWidth * 0.13,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            // color: black,
            gradient: const LinearGradient(
              colors: [
                Color(0xFF000000),
                Color(0x22FFFFFF),
              ],
              stops: [0.5, 1],
              begin: Alignment.topCenter,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        Container(
          height: SizeConfig.screenHeight * 0.065,
          width: SizeConfig.screenWidth * 0.14,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            boxShadow: const [
              BoxShadow(
                color: Colors.white30,
                blurRadius: 20,
                spreadRadius: -5,
                offset: Offset(-4, -4),
              )
            ],
          ),
        ),
        Container(
          height: SizeConfig.screenHeight * 0.055,
          width: SizeConfig.screenWidth * 0.12,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            gradient: const LinearGradient(
              colors: [
                Color(0xFF545659),
                Color(0xFF232629),
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Image.asset(icon),
        ),
      ],
    );
  }
}
