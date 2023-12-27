import 'package:flutter/material.dart';
import 'package:tesla_demo/constants/images.dart';
import 'package:tesla_demo/constants/theme.dart';

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
                    Text("Unlock"),
                    Spacer(),
                    RoundedIconButton(
                      icon: lock1,
                    ),
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

// class RoundedIconButton extends StatelessWidget {
//   final String icon;
//   const RoundedIconButton({
//     super.key,
//     required this.icon,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Stack(
//       alignment: Alignment.center,
//       children: [
//         Container(
//           height: SizeConfig.screenHeight * 0.065,
//           width: SizeConfig.screenWidth * 0.135,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(100),
//             // color: black,
//             gradient: const LinearGradient(
//               colors: [
//                 Color(0xFF000000),
//                 Color(0x22FFFFFF),
//               ],
//               stops: [0.5, 1],
//               begin: Alignment.topCenter,
//               end: Alignment.bottomRight,
//             ),
//           ),
//         ),
//         Container(
//           height: SizeConfig.screenHeight * 0.07,
//           width: SizeConfig.screenWidth * 0.15,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(100),
//             boxShadow: const [
//               BoxShadow(
//                 color: Colors.white30,
//                 blurRadius: 35,
//                 offset: Offset(-4, -4),
//               )
//             ],
//           ),
//         ),
//         Container(
//           height: SizeConfig.screenHeight * 0.06,
//           width: SizeConfig.screenWidth * 0.13,
//           decoration: BoxDecoration(
//             borderRadius: BorderRadius.circular(100),
//             gradient: const LinearGradient(
//               colors: [
//                 Color(0xFF545659),
//                 Color(0xFF232629),
//               ],
//               begin: Alignment.topLeft,
//               end: Alignment.bottomRight,
//             ),
//           ),
//           child: Image.asset(icon),
//         ),
//       ],
//     );
//   }
// }
