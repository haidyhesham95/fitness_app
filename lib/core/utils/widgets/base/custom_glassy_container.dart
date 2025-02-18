import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class CustomGlassyContainer extends StatelessWidget {
  const CustomGlassyContainer({
    super.key,
    required this.child,
    this.height,
    this.blur,
    this.borderRadius,
  });

  final Widget child;
  final double? height;
  final double? blur;
  final BorderRadius? borderRadius;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      height: height,
      width: double.infinity,
      blur:  blur??34.6,
      color: Colors.black.withValues(alpha: 0.002),
      shape: BoxShape.rectangle,
      borderRadius:borderRadius??BorderRadius.circular(50),
      child: child,
    );
  }
}
