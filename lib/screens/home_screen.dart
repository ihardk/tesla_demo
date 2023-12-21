import 'package:flutter/material.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';

import '../constants/size_config.dart';
import 'lock_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
          ],
        ),
      ),
    );
  }
}
