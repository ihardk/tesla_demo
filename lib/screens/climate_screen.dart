import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';

import '../constants/size_config.dart';
import '../widgets/blurry_effect_widget.dart';
import '../widgets/round_icon_button.dart';
import '../widgets/round_progress.dart';
import '../widgets/slider_list_tile.dart';

class ClimateScreen extends StatefulWidget {
  const ClimateScreen({super.key});

  @override
  State<ClimateScreen> createState() => _ClimateScreenState();
}

class _ClimateScreenState extends State<ClimateScreen> {
  bool bottomModal = false;
  int? selectdItem;
  int? counter;
  final List menuList = [
    {"id": 0, "title": "Ac", "icon": ac},
    {"id": 1, "title": "Fan", "icon": fan},
    {"id": 2, "title": "Heat", "icon": heat},
    {"id": 3, "title": "Auto", "icon": auto},
    {"id": 4, "title": "Auto", "icon": auto},
    {"id": 5, "title": "Auto", "icon": auto},
    {"id": 6, "title": "Auto", "icon": auto},
  ];
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
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Gap(150),
                RoundedProgress(
                  btnActive: bottomModal,
                  count: counter ?? 0,
                ),
                const Gap(60),
                Expanded(
                    child: SingleChildScrollView(
                  child: Column(
                      children: List.generate(menuList.length, (index) {
                    return SliderListTile(
                      title: menuList[index]['title'],
                      icon: menuList[index]['icon'],
                      btnActive:
                          (selectdItem == index && bottomModal) ? true : false,
                      onActiveBtn: () {
                        if (menuList[index]['id'] == index) {
                          setState(() {
                            selectdItem = index;
                            bottomModal = true;
                          });
                        }
                      },
                      onSliderAction: (value) {
                        log("value ${(1.6 + 6.2 / value)}");

                        setState(() {
                          counter = (value).toInt();
                        });
                      },
                    );
                  })),
                ))
              ],
            ),
            if (bottomModal)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                height: SizeConfig.screenHeight * 0.15,
                child: Stack(
                  children: [
                    const BlurryEffect(0.5, 7, Color(0x30000000)),
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: SizeConfig.safeBlockVertical * 3,
                          horizontal: SizeConfig.safeBlockHorizontal * 8),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              InkWell(
                                onTap: () {
                                  setState(() {
                                    bottomModal = false;
                                  });
                                },
                                child: Image.asset(onoff),
                              ),
                              const Gap(10),
                              InkWell(
                                child: Image.asset(
                                  leftarrow,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "20°",
                                style: TextStyle(
                                    fontSize:
                                        SizeConfig.safeBlockHorizontal * 7,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              InkWell(
                                child: Image.asset(
                                  rightarrow,
                                  color: Colors.white,
                                ),
                              ),
                              const Gap(10),
                              InkWell(
                                child: Image.asset(vent),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "On",
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                                  color: Colors.white,
                                ),
                              ),
                              Text(
                                "Vent",
                                style: TextStyle(
                                  fontSize: SizeConfig.safeBlockHorizontal * 4,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
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
