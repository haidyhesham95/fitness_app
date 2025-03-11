import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import '../../../../core/styles/fonts/my_fonts.dart';

Widget tabBarWidget({
  required List<Widget> tabs,
  required void Function(int)? onTap,
  TabAlignment? tabAlignment,
  required BuildContext context
}) {
  return TabBar(
    isScrollable: true,
    tabAlignment: tabAlignment ?? TabAlignment.start,
    dividerColor: Colors.transparent,
    padding: EdgeInsets.zero,
    indicatorSize: TabBarIndicatorSize.tab,
    indicatorPadding: EdgeInsets.zero,
    indicatorColor: context.colors.baseColor,
    labelColor: context.colors.white,
    unselectedLabelColor: context.colors.white,
    unselectedLabelStyle: MyFonts.styleBold700_14,
    labelStyle: MyFonts.styleBold700_14,
    indicatorAnimation: TabIndicatorAnimation.elastic ,
    indicator: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: context.colors.baseColor),
    tabs: tabs,
    onTap: onTap,

  );
}
