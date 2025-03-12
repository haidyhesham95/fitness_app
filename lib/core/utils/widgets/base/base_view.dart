import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class BaseView extends StatelessWidget {
  const BaseView({
    super.key,
    required this.child,
    required this.image,
    required this.isArrowBackShow,
    this.actions,
    this.title,
    this.subTitle,
    this.blur,
    this.drawer,
    this.scaffoldKey, // إضافة المفتاح
    this.extendBodyBehindAppBar = false,
  });

  final List<Widget> child;
  final String image;
  final bool isArrowBackShow;
  final bool? extendBodyBehindAppBar;
  final List<Widget>? actions;
  final String? title;
  final String? subTitle;
  final double? blur;
  final Widget? drawer;
  final GlobalKey<ScaffoldState>? scaffoldKey; // تعريف المفتاح

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      key: scaffoldKey,
      endDrawer: drawer,
      appBar: AppBar(
        leading: isArrowBackShow
            ? InkWell(
                onTap: () {
                  Navigator.pop(context);
                },
                child: SvgPicture.asset(
                  Assets.svgArrowBack,
                  width: 24.w,
                  height: 24.h,
                  fit: BoxFit.scaleDown,
                ),
              )
            : const SizedBox(),
        title: Row(
          children: [
            Expanded(
              child: RichText(
                text: TextSpan(
                  text: title ?? '',
                  style: MyFonts.styleMedium500_16
                      .copyWith(color: context.colors.white),
                  children: [
                    TextSpan(
                      text: '${title != null ? '\n' : ''}${subTitle ?? ''}',
                      style: MyFonts.styleBold700_18
                          .copyWith(color: context.colors.white),
                    ),
                  ],
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
        actions: actions,
      ),
      body: Container(
        decoration: BoxDecoration(
          color: context.colors.transparent,
        ),
        child: Stack(
          children: [
            Positioned.fill(
              child: GlassImage(
                height: context.height,
                borderRadius: BorderRadius.zero,
                blur: blur ?? 6,
                image: Image.asset(
                  image,
                  fit: BoxFit.fill,
                ),
              ),
            ),
            Positioned(
              top: extendBodyBehindAppBar == true
                  ? 0
                  : context.height * .1,
              bottom: 0,
              right: 0,
              left: 0,
              child: CustomScrollView(
                slivers: child,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
