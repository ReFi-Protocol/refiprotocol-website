import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class GradientText extends StatelessWidget {
  final String text;
  final Gradient gradient;
  final TextStyle? style;
  final TextAlign? alignment;

  const GradientText(
      {super.key, required this.text, required this.gradient, this.style, this.alignment});

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      blendMode: BlendMode.srcIn,
      shaderCallback: (Rect bounds) {
        return gradient.createShader(bounds);
      },
      child: Text(
        text,
        style: style,
        textAlign: alignment,
      ),
    );
  }
}
