import 'package:flutter/material.dart';

class RenderInnerShadowText extends RenderBox {
  String text;
  TextStyle textStyle;
  Offset offset;
  double blurRadius;
  Color shadowColor;

  RenderInnerShadowText({
    required this.text,
    required this.textStyle,
    required this.offset,
    required this.blurRadius,
    required this.shadowColor,
  });

  @override
  void paint(PaintingContext context, Offset offset) {
    final canvas = context.canvas;

    final textPainter = TextPainter(
      text: TextSpan(text: text, style: textStyle),
      textDirection: TextDirection.ltr,
    );

    textPainter.layout(minWidth: 0, maxWidth: size.width);

    // Paint the shadow
    final shadowTextStyle = textStyle.copyWith(color: shadowColor);
    final shadowTextPainter = TextPainter(
      text: TextSpan(text: text, style: shadowTextStyle),
      textDirection: TextDirection.ltr,
    );

    shadowTextPainter.layout(minWidth: 0, maxWidth: size.width);
    canvas.saveLayer(offset & size, Paint());
    shadowTextPainter.paint(canvas, offset + this.offset);
    canvas.restore();

    // Paint the text
    textPainter.paint(canvas, offset);
  }

  @override
  void performLayout() {
    size = constraints.biggest;
  }
}

class InnerShadowText extends SingleChildRenderObjectWidget {
  final String text;
  final TextStyle textStyle;
  final Offset offset;
  final double blurRadius;
  final Color shadowColor;

  const InnerShadowText({
    Key? key,
    required this.text,
    required this.textStyle,
    required this.offset,
    required this.blurRadius,
    required this.shadowColor,
  }) : super(key: key);

  @override
  RenderInnerShadowText createRenderObject(BuildContext context) {
    return RenderInnerShadowText(
      text: text,
      textStyle: textStyle,
      offset: offset,
      blurRadius: blurRadius,
      shadowColor: shadowColor,
    );
  }

  @override
  void updateRenderObject(
    BuildContext context,
    RenderInnerShadowText renderObject,
  ) {
    renderObject
      ..text = text
      ..textStyle = textStyle
      ..offset = offset
      ..blurRadius = blurRadius
      ..shadowColor = shadowColor;
  }
}
