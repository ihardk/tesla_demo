import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

import '../constants/my_colors.dart';

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
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
        targetHeight: widget.assetImageHeight,
        targetWidth: widget.assetImageWidth);
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
        trackShape: GradientSliderTrackShape(
          linearGradient: widget.linearGradient ??
              const LinearGradient(
                colors: [
                  kcPrimary,
                  kcPrimaryDark,
                ],
              ),
        ),
        trackHeight: 15,
        overlayColor: kcLabelGrey,
        thumbShape: isImage
            ? SliderThumbImage(
                image: customImage!,
                min: widget.min,
                max: widget.max,
                innerThumbColor: widget.activeInnerTrackColor,
              )
            : SliderThumbImage(
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
          widget.onChanged(value);
          setState(() {
            intValue = value;
          });
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
        const LinearGradient(colors: [
          Colors.black,
          Colors.amber,
        ]);
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
        end: sliderTheme.activeTrackColor);
    final ColorTween inactiveTrackColorTween = ColorTween(
      begin: sliderTheme.disabledInactiveTrackColor?.withOpacity(0.1),
      end: sliderTheme.inactiveTrackColor?.withOpacity(1.0),
    );

    final Paint activePaint = Paint()
      ..shader = linearGradient!.createShader(activeGradientRect)
      ..color = activeTrackColorTween.evaluate(enableAnimation)!;
    final Paint inactivePaint = Paint()
      ..color = inactiveTrackColorTween.evaluate(enableAnimation)!;

    final Rect leftTrackSegment = Rect.fromLTRB(
        trackRect.left, trackRect.top, thumbCenter.dx, trackRect.bottom);
    if (!leftTrackSegment.isEmpty) {
      context.canvas.drawRect(leftTrackSegment, activePaint);
      context.canvas.drawCircle(
        trackRect.centerLeft,
        sliderTheme.trackHeight! / 2,
        activePaint,
      );
    }
    final Rect rightTrackSegment = Rect.fromLTRB(
        thumbCenter.dx, trackRect.top, trackRect.right, trackRect.bottom);
    if (!rightTrackSegment.isEmpty) {
      context.canvas.drawRect(rightTrackSegment, inactivePaint);
      context.canvas.drawCircle(
        trackRect.centerRight,
        sliderTheme.trackHeight! / 2,
        inactivePaint,
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
    this.thumbRadius = 23,
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
    //
    assert(sliderTheme.disabledThumbColor != null);
    assert(sliderTheme.thumbColor != null);
    var canvas = context.canvas;

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    paint = Paint()
      ..color = kcWhite //Thumb Background Color
      ..style = PaintingStyle.fill;

    TextSpan span = TextSpan(
      style: TextStyle(
        fontSize: thumbRadius * .8,
        fontWeight: FontWeight.w700,
        color: sliderTheme.thumbColor, //Text Color of Value on Thumb
      ),
      text: getValue(value),
    );

    TextPainter tp = TextPainter(
        text: span,
        textAlign: TextAlign.center,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter =
        Offset(center.dx - (tp.width / 2), center.dy - (tp.height / 2));

    if (image != null) {
      final picWidth = image!.width;
      final picHeight = image!.height;

      Offset picOffset = Offset(
        (center.dx - (picWidth / 2)),
        (center.dy - (picHeight / 2)),
      );

      canvas.drawImage(image!, picOffset, paint);
    } else {
      canvas.drawCircle(
        center,
        thumbRadius * 1.1,
        paint
          ..maskFilter = const MaskFilter.blur(BlurStyle.solid, 10)
          ..color = Colors.black,
      );
      canvas.drawCircle(
        center,
        thumbRadius,
        paint..color = sliderTheme.activeTrackColor ?? Colors.grey,
      );
      canvas.drawCircle(
        center,
        thumbRadius * .9,
        paint..color = innerThumbColor ?? kcLabelGrey,
      );

      tp.paint(canvas, textCenter);
    }
  }

  String getValue(double value) {
    return (min + (max - min) * value * 100).round().toString();
  }
}
