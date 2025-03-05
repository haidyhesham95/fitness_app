import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

class ChatImageWidget extends StatelessWidget {
  const ChatImageWidget({super.key, this.onTap, required this.image});

  final void Function()? onTap;

  final ImageProvider<Object> image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 80,
      width: 80,
      child: Stack(
        clipBehavior: Clip.none,
        children: [
          Positioned(
            top: 0,
            left: 0,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 70,
                width: 70,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: image,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Positioned(
            top: -7,
            right: 5,
            child: GestureDetector(
              onTap: onTap,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: context.colors.baseColor,
                child: Icon(
                  Icons.close,
                  color: context.colors.white,
                  size: 15,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
