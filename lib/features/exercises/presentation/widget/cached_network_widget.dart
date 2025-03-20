import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';

import '../../../../generated/assets.dart';

class CachedNetworkWidget extends StatelessWidget {
  const CachedNetworkWidget(
      {super.key, required this.imageUrl, this.height, this.fit, this.width});

  final String imageUrl;
  final double? height, width;
  final BoxFit? fit;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      height: height,
      imageUrl: imageUrl,
      width: width ?? double.infinity,
      fit: fit ?? BoxFit.fitWidth,
      placeholder: (context, url) => Lottie.asset(
        Assets.jsonFitnessLoader,
      ),
      // errorWidget: (context, url, error) => const Icon(Icons.error),
      errorWidget: (context, url, error) => Image.asset(
        Assets.imagesFit,
        width: 70.w,
        height: 48.h,
      ),
    );
  }
}
