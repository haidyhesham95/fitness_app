import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

import '../../../styles/fonts/my_fonts.dart';


class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {super.key, required this.appBarTxt, this.showArrow = false});

  final String? appBarTxt;
  final bool? showArrow;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        showArrow == true
            ? GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child:  Icon(
                  Icons.arrow_back_ios,
                  color: context.colors.black,
                ),
              )
            : const SizedBox(),
        Text(
          appBarTxt!,
          style: MyFonts.styleMedium500_20.copyWith(color: context.colors.black),
        ),
      ],
    );
  }
}
