import 'package:flutter/material.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';

import '../constants/size_config.dart';

class LockScreen extends StatelessWidget {
  const LockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth * 2,
        decoration: const BoxDecoration(
          gradient: lockBGLinear,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(unlock),
                // Container(
                //   height: SizeConfig.screenHeight * 0.07,
                //   width: SizeConfig.screenWidth * 0.3,
                //   decoration: BoxDecoration(
                //     borderRadius: BorderRadius.circular(100),
                //     // color: black,
                //     gradient: const LinearGradient(
                //       colors: [
                //         Color(0xFF000000),
                //         Color(0x22FFFFFF),
                //       ],
                //       stops: [0.5, 1],
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomRight,
                //     ),
                //   ),
                // ),
              ],
            ),
            Positioned(
              top: SizeConfig.blockSizeHorizontal * 15,
              right: SizeConfig.blockSizeHorizontal * 8,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: SizeConfig.screenHeight * 0.07,
                    width: SizeConfig.screenWidth * 0.15,
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
                      gradient: const LinearGradient(
                        colors: [
                          Color(0xFF545659),
                          Color(0xFF232629),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Image.asset(setting),
                  ),
                  Container(
                    height: SizeConfig.screenHeight * 0.09,
                    width: SizeConfig.screenWidth * 0.19,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.white30,
                            blurRadius: 40,
                            offset: Offset(-4, -4),
                          )
                        ]),
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
