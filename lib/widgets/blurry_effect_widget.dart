import 'dart:ui';

import 'package:flutter/material.dart';

class BlurryEffect extends StatelessWidget {
  final double opacity;
  final double blurry;
  final Color shade;

  const BlurryEffect(this.opacity, this.blurry, this.shade, {super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30),
        topRight: Radius.circular(30),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: blurry, sigmaY: blurry),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(color: shade.withOpacity(opacity)),
        ),
      ),
    );
  }
}
