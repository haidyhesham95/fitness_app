import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class CustomGlassyContainer extends StatelessWidget {
  const CustomGlassyContainer({
    super.key,
    required this.child,
    this.height,
    this.blur,
    this.borderRadius,
    this.shadowColor,
    this.color,
    this.width,
  });

  final Widget child;
  final double? height;
  final double? width;
  final double? blur;
  final BorderRadius? borderRadius;
  final Color? shadowColor;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: height,
      width: width ,
      shadowColor: shadowColor ?? Colors.transparent,
      blur:  blur??34.6,
      color:color?? Colors.black.withValues(alpha: 0.002),
      shape: BoxShape.rectangle,
      borderRadius:borderRadius??BorderRadius.circular(50),
      child: child,
    );
  }
}
