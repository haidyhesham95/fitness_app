import 'package:flutter/material.dart';

import '../../../../generated/assets.dart';

class AvatarWithShadow extends StatelessWidget {
  const AvatarWithShadow({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Outer shadow effect
        Container(
          width: 40, // Adjusted size
          height: 40,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: Colors.orange.withValues(alpha: 0.5),
                blurRadius: 10,
                spreadRadius: 3,
              ),
            ],
          ),
        ),
        // CircleAvatar on top
        Positioned(
          left: 2, // Adjusting for shadow positioning
          top: 2,
          child: CircleAvatar(
            backgroundColor: Colors.transparent,
            radius: 18,
            backgroundImage: _getImageProvider(imageUrl), // ImageProvider type expected
          ),
        ),
      ],
    );
  }

  ImageProvider _getImageProvider(String url) {
    if (url.startsWith('http') || url.startsWith('https')) {
      return NetworkImage(url);
    } else if (url.startsWith('assets/')) {
      return AssetImage(url);
    } else {
      return const AssetImage(Assets.imagesUser);
    }
  }
}
