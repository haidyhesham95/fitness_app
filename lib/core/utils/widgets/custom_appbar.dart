import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';

import '../../styles/fonts/my_fonts.dart';


AppBar customAppBar({
  required String appBarTxt,
  bool showArrow = false,
  VoidCallback? navigation,
  required BuildContext context,
  List<Widget>? actions
}) {
  return AppBar(
    backgroundColor: context.colors.white,
    automaticallyImplyLeading: false,
    title:  Row(
      children: [
        showArrow == true
            ? GestureDetector(
                onTap: () {
                  if (navigation != null) {
                    navigation();
                  } else {
                    Navigator.pop(context);
                  }
                },
                child:  Icon(
                  Icons.arrow_back_ios,
                  color: context.colors.black,
                ),
              )
            : const SizedBox(),
        Text(
          appBarTxt,
          style: MyFonts.styleMedium500_20

        ),
      ],
      ),
      elevation: 0.0,
      centerTitle: true,
      actions: actions
  );
}