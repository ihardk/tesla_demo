import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';
import 'package:tesla_demo/screens/home/home_screen.dart';
import 'package:tesla_demo/screens/lock_screen.dart';

import '../constants/my_colors.dart';
import '../constants/size_config.dart';
import '../widgets/round_icon_button.dart';

class UnLockScreen extends StatelessWidget {
  const UnLockScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig.init(context);
    return Scaffold(
      body: Container(
        width: SizeConfig.screenWidth * 2,
        height: SizeConfig.screenHeight,
        decoration: const BoxDecoration(
          gradient: unlockBGLinear,
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              height: SizeConfig.screenHeight * 0.35,
              width: SizeConfig.screenWidth * 0.6,
              decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Color(0x282FB8FF),
                    blurRadius: 100,
                    offset: Offset(0, -20),
                  ),
                  BoxShadow(
                    color: Color(0x119EECD9),
                    blurRadius: 100,
                    offset: Offset(0, 20),
                  ),
                ],
              ),
            ),
            Text(
              "Tesla Model S",
              style: Theme.of(context).textTheme.displayMedium,
            ).animate().moveY(
                  duration: const Duration(milliseconds: 900),
                  begin: 0,
                  end: -160,
                ),
            Image.asset(
              unlockimage,
            ).animate().scaleXY(
                  duration: const Duration(milliseconds: 1200),
                  begin: 0.5,
                  end: 1,
                ),
            Positioned(
              bottom: SizeConfig.blockSizeHorizontal * 20,
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
                      color: kcWhite10,
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
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 10),
                    const Text("Lock"),
                    const Spacer(),
                    RoundedIconButton(
                      icon: unlock1,
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => const LockScreen(),
                          ),
                          (route) => false,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: SizeConfig.blockSizeHorizontal * 15,
              right: SizeConfig.blockSizeHorizontal * 8,
              child: RoundedIconButton(
                icon: setting,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (_) => const HomeScreen(),
                    ),
                    (route) => false,
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
