import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:flutter/material.dart';

class GenericCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final double borderRadius;
  final TextStyle? textStyle;
  final Color overlayColor;
  final List<Color> gradientColors;
  final Alignment gradientBegin;
  final Alignment gradientEnd;

  const GenericCard({
    super.key,
    required this.imageUrl,
    required this.title,
    this.borderRadius = 15.0,
    this.textStyle,
    this.overlayColor = Colors.black54,
    this.gradientColors = const [Colors.black54, Colors.transparent],
    this.gradientBegin = Alignment.bottomCenter,
    this.gradientEnd = Alignment.topCenter,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(borderRadius),
      child: Stack(
        fit: StackFit.expand,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            imageBuilder: (context, imageProvider) => Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: imageProvider,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            placeholder: (context, url) => const AppLoader(),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: gradientColors,
                begin: gradientBegin,
                end: gradientEnd,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: textStyle ??
                    MyFonts.styleBold700_16.copyWith(
                      color: context.colors.white,
                    ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
