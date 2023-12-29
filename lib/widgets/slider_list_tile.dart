import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tesla_demo/widgets/round_icon_button.dart';

import '../constants/size_config.dart';

class SliderListTile extends StatefulWidget {
  final String title;
  final String icon;
  final Function()? onActiveBtn;
  final bool? btnActive;
  const SliderListTile({
    super.key,
    required this.title,
    required this.icon,
    this.onActiveBtn,
    this.btnActive,
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
              const Expanded(child: MyGlowSlider()),
            ],
          ),
        ),
      ],
    );
  }
}

class MyGlowSlider extends StatefulWidget {
  const MyGlowSlider({
    super.key,
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
        Slider(
          value: value,
          onChanged: (value) => setState(() {
            this.value = value;
          }),
        )
      ],
    );
  }
}
