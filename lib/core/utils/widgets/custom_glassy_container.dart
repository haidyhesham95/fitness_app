import 'package:flutter/material.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class CustomGlassyContainer extends StatelessWidget {
  const CustomGlassyContainer({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return GlassContainer(
      width: double.infinity,
      blur: 34.6,
      color: Colors.black.withValues(alpha: 0.002),
      shape: BoxShape.rectangle,
      borderRadius: BorderRadius.circular(50),
      child: child,
    );
  }
}
