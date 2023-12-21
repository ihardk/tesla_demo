import 'package:flutter/material.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';

import '../constants/size_config.dart';
import 'lock_screen.dart';

class UnLockScreen extends StatelessWidget {
  const UnLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth * 2,
        decoration: const BoxDecoration(
          gradient: unlockBGLinear,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Positioned(
              height: SizeConfig.screenHeight * 0.35,
              width: SizeConfig.screenWidth * 0.6,
              child: Container(
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(100),
                  // gradient: const LinearGradient(
                  //   colors: [
                  //     Color(0xFF2FB8FF),
                  //     Color(0xFF9EECD9),
                  //   ],
                  //   stops: [0, 0.8],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomRight,
                  // ),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x282FB8FF),
                      blurRadius: 100,
                      // spreadRadius: -100,
                      offset: Offset(0, -20),
                    ),
                    BoxShadow(
                      color: Color(0x119EECD9),
                      blurRadius: 100,
                      // spreadRadius: -50,
                      offset: Offset(0, 20),
                    ),
                  ],
                ),
              ),
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                  ),
                  child: Image.asset(unlockimage),
                ),
              ],
            ),
            Positioned(
              bottom: SizeConfig.blockSizeHorizontal * 20,
              // right: SizeConfig.blockSizeHorizontal * 8,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                alignment: Alignment.centerLeft,
                height: SizeConfig.screenHeight * 0.08,
                width: SizeConfig.screenWidth * 0.4,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x33000000),
                      spreadRadius: 0,
                      offset: Offset(0, 0),
                    ),
                    BoxShadow(
                      color: Color(0x1117171C),
                      spreadRadius: -3,
                      offset: Offset(0, 0),
                    ),
                    BoxShadow(
                      color: Colors.white10,
                      blurRadius: 11,
                      spreadRadius: -11,
                      offset: Offset(3, 3),
                    ),
                    BoxShadow(
                      color: Color(0x1117171C),
                      blurRadius: 10,
                      spreadRadius: 4.0,
                      offset: Offset(0, 0),
                    ),
                  ],
                  // color: black,
                  // gradient: const LinearGradient(
                  //   colors: [
                  //     Color(0x1117171C),
                  //     Color(0x1118191B),
                  //   ],
                  //   stops: [0.5, 1],
                  //   begin: Alignment.topCenter,
                  //   end: Alignment.bottomRight,
                  // ),
                ),
                child: Row(
                  children: const [
                    SizedBox(width: 10),
                    Text("Lock"),
                    Spacer(),
                    RoundedIconButton(icon: unlock1),
                  ],
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.blockSizeHorizontal * 15,
              right: SizeConfig.blockSizeHorizontal * 8,
              child: const RoundedIconButton(icon: setting),
              // child: Stack(
              //   alignment: Alignment.center,
              //   children: [
              //     Container(
              //       height: SizeConfig.screenHeight * 0.07,
              //       width: SizeConfig.screenWidth * 0.15,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(100),
              //         // color: black,
              //         gradient: const LinearGradient(
              //           colors: [
              //             Color(0xFF000000),
              //             Color(0x22FFFFFF),
              //           ],
              //           stops: [0.5, 1],
              //           begin: Alignment.topCenter,
              //           end: Alignment.bottomRight,
              //         ),
              //       ),
              //     ),
              //     Container(
              //       height: SizeConfig.screenHeight * 0.08,
              //       width: SizeConfig.screenWidth * 0.17,
              //       decoration: BoxDecoration(
              //           borderRadius: BorderRadius.circular(100),
              //           boxShadow: const [
              //             BoxShadow(
              //               color: Colors.white30,
              //               blurRadius: 40,
              //               offset: Offset(-4, -4),
              //             )
              //           ]),
              //     ),
              //     Container(
              //       height: SizeConfig.screenHeight * 0.065,
              //       width: SizeConfig.screenWidth * 0.14,
              //       decoration: BoxDecoration(
              //         borderRadius: BorderRadius.circular(100),
              //         gradient: const LinearGradient(
              //           colors: [
              //             Color(0xFF545659),
              //             Color(0xFF232629),
              //           ],
              //           begin: Alignment.topLeft,
              //           end: Alignment.bottomRight,
              //         ),
              //       ),
              //       child: Image.asset(setting),
              //     ),
              //   ],
              // ),
            ),
          ],
        ),
      ),
    );
  }
}
