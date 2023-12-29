import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tesla_demo/constants/my_colors.dart';
import 'package:tesla_demo/widgets/round_icon_button.dart';

import '../constants/size_config.dart';
import 'custom_slider.dart';

class SliderListTile extends StatefulWidget {
  final String title;
  final String icon;
  final Function()? onActiveBtn;
  final bool? btnActive;
  final Function(double) onSliderAction;
  const SliderListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onActiveBtn,
    this.btnActive,
    required this.onSliderAction,
  });

  @override
  State<SliderListTile> createState() => _SliderListTileState();
}

class _SliderListTileState extends State<SliderListTile> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
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
              RoundedIconButton(
                icon: widget.icon,
                onTap: widget.onActiveBtn,
                btnActive: widget.btnActive,
              ),
              Expanded(
                child: MyGlowSlider(
                  btnActive: widget.btnActive,
                  onSliderAction: widget.onSliderAction,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class MyGlowSlider extends StatefulWidget {
  final bool? btnActive;
  final Function(double) onSliderAction;
  const MyGlowSlider({
    super.key,
    this.btnActive,
    required this.onSliderAction,
  });

  @override
  State<MyGlowSlider> createState() => _MyGlowSliderState();
}

class _MyGlowSliderState extends State<MyGlowSlider> {
  var value = 0.5;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomSlider(
          trackHeight: SizeConfig.screenHeight * 0.008,
          max: 21,
          onChanged: widget.onSliderAction,
          btnActive: widget.btnActive,
          inActiveTrackColor: const Color(0xFF1C1D20),
          activeTrackColor: kcPrimary,
          linearGradient: const LinearGradient(
            colors: [
              kcPrimary,
              kcPrimaryDark,
            ],
          ),
          min: 0,
        ),
      ],
    );
  }
}
