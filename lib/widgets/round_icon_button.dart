import 'package:flutter/material.dart';

import '../constants/size_config.dart';

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
