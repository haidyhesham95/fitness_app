import 'package:cached_network_image/cached_network_image.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import 'home_loading_widget.dart';

class RecommendationCard extends StatelessWidget {
  const RecommendationCard({super.key, this.data, required this.title});

  final data;
  final String title;

  @override
  Widget build(BuildContext context) {
    switch (title) {
      case "Recommendation To Day":
        return Container(
          height: 104.h,
          width: 104.w,
          decoration: BoxDecoration(
            color: const Color(0xFF505050),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 104.h,
                  width: 104.w,
                  child: CachedNetworkImage(
                    imageUrl: data.image ?? "",
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) => const HomeLoadingWidget(),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.darkGray.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        data.name ?? "",
                        style: MyFonts.styleSemiBold600_16
                            .copyWith(color: context.colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      case "Recommendation For You":
        return Container(
          height: 104.h,
          width: 104.w,
          decoration: BoxDecoration(
            color: const Color(0xFF505050),
            borderRadius: BorderRadius.circular(20),
          ),
          child: Stack(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  height: 104.h,
                  width: 104.w,
                  child: CachedNetworkImage(
                    imageUrl: data.categoryImage ?? "",
                    fit: BoxFit.cover,
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                    placeholder: (context, url) => const HomeLoadingWidget(),
                  ),
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: context.colors.darkGray.withValues(alpha: 0.8),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: FittedBox(
                      alignment: Alignment.bottomCenter,
                      fit: BoxFit.scaleDown,
                      child: Text(
                        data.categoryName ?? "",
                        style: MyFonts.styleSemiBold600_16
                            .copyWith(color: context.colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      default:
        return const SizedBox();
    }
  }
}
