import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

import '../constants/my_colors.dart';
import '../constants/size_config.dart';

class CustomSlider extends StatefulWidget {
  final String? assetImage;
  final LinearGradient? linearGradient;
  final Color? inActiveTrackColor;
  final Color? activeTrackColor;
  final Color? activeInnerTrackColor;
  final double trackHeight;
  final double min;
  final double max;
  final int? assetImageHeight;
  final int? assetImageWidth;
  final int? divisions;
  final ValueChanged<double> onChanged;
  final bool? btnActive;

  const CustomSlider({
    Key? key,
    this.assetImage,
    this.linearGradient,
    this.inActiveTrackColor,
    required this.onChanged,
    this.activeTrackColor,
    this.activeInnerTrackColor,
    required this.trackHeight,
    required this.min,
    required this.max,
    this.divisions,
    this.assetImageHeight = 50,
    this.assetImageWidth = 60,
    this.btnActive,
  }) : super(key: key);

  @override
  State<CustomSlider> createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  double intValue = 0;
  ui.Image? customImage;

  bool get isImage => customImage != null;

  Future<ui.Image> load(String asset) async {
    ByteData data = await rootBundle.load(asset);
    ui.Codec codec = await ui.instantiateImageCodec(
      data.buffer.asUint8List(),
      targetHeight: widget.assetImageHeight,
      targetWidth: widget.assetImageWidth,
    );
    ui.FrameInfo frameInfo = await codec.getNextFrame();
    return frameInfo.image;
  }

  @override
  void initState() {
    if (widget.assetImage != null) {
      load(widget.assetImage!)
          .then((image) => setState(() => customImage = image));
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        inactiveTrackColor: widget.inActiveTrackColor,
        activeTrackColor: widget.activeTrackColor,
        trackShape:
            GradientSliderTrackShape(linearGradient: widget.linearGradient),
        trackHeight: widget.trackHeight,
        overlayColor: kcLabelGrey,
        thumbShape: SliderThumbImage(
          min: widget.min,
          max: widget.max,
          innerThumbColor: widget.activeInnerTrackColor,
        ),
      ),
      child: Slider(
        min: widget.min,
        max: widget.max,
        divisions: widget.divisions,
        onChanged: (double value) {
          if (widget.btnActive ?? false) {
            widget.onChanged(value);
            setState(() => intValue = value);
          }
        },
        value: intValue,
      ),
    );
  }
}

class GradientSliderTrackShape extends SliderTrackShape
    with BaseSliderTrackShape {
  LinearGradient? linearGradient;

  GradientSliderTrackShape({
    this.linearGradient,
  }) {
    linearGradient ??
        const LinearGradient(
          colors: [
            Colors.black,
            Colors.amber,
          ],
        );
  }

  @override
  void paint(
    PaintingContext context,
    Offset offset, {
    required RenderBox parentBox,
    required SliderThemeData sliderTheme,
    required Animation<double> enableAnimation,
    required Offset thumbCenter,
    Offset? secondaryOffset,
    bool isEnabled = false,
    bool isDiscrete = false,
    required TextDirection textDirection,
    double additionalActiveTrackHeight = 2,
  }) {
    assert(sliderTheme.disabledActiveTrackColor != null);
    assert(sliderTheme.disabledInactiveTrackColor != null);
    assert(sliderTheme.activeTrackColor != null);
    assert(sliderTheme.inactiveTrackColor != null);
    assert(sliderTheme.thumbShape != null);

    if (sliderTheme.trackHeight! <= 0) {
      return;
    }

    final Rect trackRect = getPreferredRect(
      parentBox: parentBox,
      offset: offset,
      sliderTheme: sliderTheme,
      isEnabled: isEnabled,
      isDiscrete: isDiscrete,
    );

    final activeGradientRect = Rect.fromLTRB(
      trackRect.left,
      (textDirection == TextDirection.ltr)
          ? trackRect.top - (additionalActiveTrackHeight / 2)
          : trackRect.top,
      thumbCenter.dx,
      (textDirection == TextDirection.ltr)
          ? trackRect.bottom + (additionalActiveTrackHeight / 2)
          : trackRect.bottom,
    );

    final ColorTween activeTrackColorTween = ColorTween(
      begin: sliderTheme.disabledActiveTrackColor,
      end: sliderTheme.activeTrackColor,
    );

    final ColorTween inactiveTrackColorTween = ColorTween(
      begin: sliderTheme.disabledInactiveTrackColor?.withOpacity(0.1),
      end: sliderTheme.inactiveTrackColor?.withOpacity(1.0),
    );

    final Paint activePaint = Paint()
      ..shader = linearGradient!.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;

    final Paint glowPaint = Paint()
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 10.0)
      ..shader = linearGradient!.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;

    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

    final Paint leftTrackPaint;
    final Paint rightTrackPaint;

    switch (textDirection) {
      case TextDirection.ltr:
        leftTrackPaint = activePaint;
        rightTrackPaint = inactivePaint;
        break;
      case TextDirection.rtl:
        leftTrackPaint = inactivePaint;
        rightTrackPaint = activePaint;
        break;
    }

    final Rect leftTrackSegment = Rect.fromLTRB(
        trackRect.left, trackRect.top, thumbCenter.dx, trackRect.bottom);
    if (!leftTrackSegment.isEmpty) {
      context.canvas.drawRect(leftTrackSegment, glowPaint);
      context.canvas.drawRect(leftTrackSegment, leftTrackPaint);
      context.canvas.drawCircle(
        trackRect.centerLeft,
        sliderTheme.trackHeight! / 2,
        leftTrackPaint,
      );
    }
    final Rect rightTrackSegment = Rect.fromLTRB(
        thumbCenter.dx, trackRect.top, trackRect.right, trackRect.bottom);
    if (!rightTrackSegment.isEmpty) {
      context.canvas.drawRect(rightTrackSegment, rightTrackPaint);
      context.canvas.drawCircle(
        trackRect.centerRight,
        sliderTheme.trackHeight! / 2,
        rightTrackPaint,
      );
    }
  }
}

class SliderThumbImage extends SliderComponentShape {
  final ui.Image? image;
  final double thumbRadius;
  final double min;
  final double max;
  final Color? innerThumbColor;

  const SliderThumbImage({
    this.thumbRadius = 15,
    this.image,
    this.min = 0,
    this.max = 10,
    this.innerThumbColor,
  });

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return const Size(0, 0);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);
    var canvas = context.canvas;

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    paint = Paint()
      ..color = kcWhite
      ..style = PaintingStyle.fill;

    final paint2 = Paint();
    paint2.shader = ui.Gradient.linear(
        Offset(center.dx - 10, center.dy - 6),
        Offset(
          center.dx + 10,
          center.dy + 10,
        ),
        [
          const Color(0xFF2E3236),
          const Color(0xFF141515),
        ]);

    canvas.drawRRect(
      RRect.fromRectAndCorners(
        Rect.fromLTWH(
          center.dx - 10,
          center.dy - 5,
          SizeConfig.screenWidth * 0.06,
          SizeConfig.screenHeight * 0.013,
        ),
        topLeft: const Radius.circular(5),
        bottomLeft: const Radius.circular(5),
        topRight: const Radius.circular(5),
        bottomRight: const Radius.circular(5),
      ),
      paint2,
    );
    canvas.drawLine(
      Offset(center.dx + 3, center.dy - 5),
      Offset(
        center.dx + 3,
        center.dy + 5,
      ),
      paint
        ..color = const Color(0xFF363636)
        ..strokeWidth = 2,
    );
    canvas.drawLine(
      Offset(center.dx - 3, center.dy - 5),
      Offset(
        center.dx - 3,
        center.dy + 5,
      ),
      paint
        ..color = const Color(0xFF363636)
        ..strokeWidth = 2,
    );
  }

  String getValue(double value) {
    return (min + (max - min) * value * 100).round().toString();
  }
}
