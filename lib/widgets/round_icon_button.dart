import 'package:flutter/material.dart';
import 'package:tesla_demo/constants/my_colors.dart';

import '../constants/size_config.dart';

class RoundedIconButton extends StatefulWidget {
  final String icon;
  final Function()? onTap;
  final bool? btnActive;
  final void Function()? onPressedRelese;
  const RoundedIconButton({
    super.key,
    required this.icon,
    this.onTap,
    this.onPressedRelese,
    this.btnActive,
  });

  @override
  State<RoundedIconButton> createState() => _RoundedIconButtonState();
}

class _RoundedIconButtonState extends State<RoundedIconButton> {
  bool isPressed = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      onTapDown: (details) => [setState(() => isPressed = true)],
      onTapCancel: () {
        setState(() => isPressed = false);
        if (widget.onPressedRelese != null) widget.onPressedRelese!();
      },
      onTapUp: (details) {
        setState(() => isPressed = false);
        if (widget.onPressedRelese != null) widget.onPressedRelese!();
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: SizeConfig.screenHeight * 0.06,
            width: SizeConfig.screenWidth * 0.13,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              // color: black,
              gradient: (widget.btnActive ?? false)
                  ? const LinearGradient(
                      colors: [
                        kcPrimaryDark,
                        kcPrimary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: isPressed
                          ? [
                              // const Color(0x22FFFFFF),
                              const Color(0xFF000000),
                            ]
                          : [
                              const Color(0xFF000000),
                              const Color(0x22FFFFFF),
                            ],
                      stops: isPressed ? [0.5] : const [0.5, 1],
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
              boxShadow: [
                BoxShadow(
                  color: kcWhite10,
                  offset: isPressed ? const Offset(0, 0) : const Offset(-4, -4),
                  blurRadius: isPressed ? 4 : 20,
                  spreadRadius: isPressed ? 4 : -1,
                )
              ],
            ),
          ),
          Container(
            height: SizeConfig.screenHeight * 0.055,
            width: SizeConfig.screenWidth * 0.12,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              gradient: (widget.btnActive ?? false)
                  ? const LinearGradient(
                      colors: [
                        kcPrimaryDark,
                        kcPrimary,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : LinearGradient(
                      colors: isPressed
                          ? [
                              const Color(0xFF232629),
                              const Color(0xFF232629),
                              // const Color(0xFF545659),
                            ]
                          : [
                              const Color(0xFF545659),
                              const Color(0xFF232629),
                            ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
            ),
            child: Image.asset(widget.icon),
          ),
        ],
      ),
    );
  }
}
