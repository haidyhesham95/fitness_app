import 'dart:io';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PictureProfileScreen extends StatelessWidget {
  const PictureProfileScreen({super.key});

  final File? _image = null;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Container(
        height: 100.h,
        width: 154.w,
        child: Stack(
          alignment: Alignment.center,
          fit: StackFit.expand,
          clipBehavior: Clip.none,
          children: [
            _image == null
                ? const CircleAvatar(
              backgroundImage: AssetImage(Assets.imagesProfile),
            )
                : CircleAvatar(
              backgroundImage: FileImage(_image) as ImageProvider,
            ),

            Container(
              padding: EdgeInsets.all(6.sp),
              decoration: BoxDecoration(
                color: Colors.black.withValues(alpha: 0.6),
                shape: BoxShape.circle,
              ),
              child: SvgPicture.asset(Assets.svgEdit,
              width: 20.w,
              height: 20.h,
                fit: BoxFit.scaleDown,
              ),
            ),
              Positioned(
              bottom: -35,
              child: Text(
                'Somaya Mahmoud',
                style: MyFonts.styleSemiBold600_20.copyWith(
                  color: context.colors.white,
                    shadows: [
                      const Shadow(
                        color: Colors.black,
                        blurRadius: 5,
                        offset: Offset(0, 2),
                      ),
                    ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}