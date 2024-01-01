import 'package:flutter/material.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';
import 'package:tesla_demo/screens/unlock_screen.dart';

import '../constants/my_colors.dart';
import '../constants/size_config.dart';
import '../widgets/round_icon_button.dart';

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
                Image.asset(lockimage),
              ],
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
                    const Text("Unlock"),
                    const Spacer(),
                    RoundedIconButton(
                      icon: lock1,
                      onTap: () {
                        Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (_) => const UnLockScreen(),
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
              child: const RoundedIconButton(icon: setting),
            ),
          ],
        ),
      ),
    );
  }
}
