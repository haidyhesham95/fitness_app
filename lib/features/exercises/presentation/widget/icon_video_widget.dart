import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

class IconVideoWidget extends StatelessWidget {
  const IconVideoWidget({super.key, required this.onPressed});

  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: context.colors.baseColor,
        borderRadius: BorderRadius.circular(50),
      ),
      child: IconButton(
        padding: EdgeInsets.zero,
        onPressed: onPressed,
        icon: Icon(
          Icons.play_arrow,
          color: context.colors.black,
          size: 40,
        ),
      ),
    );
  }
}
