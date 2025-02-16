import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/styles/colors/my_colors.dart';
import '../../../../../../core/styles/fonts/my_fonts.dart';

class CustomContainerGoal extends StatefulWidget {
  const CustomContainerGoal({super.key, required this.txt});

  final String txt;

  @override
  State<CustomContainerGoal> createState() => _CustomContainerGoalState();
}

class _CustomContainerGoalState extends State<CustomContainerGoal> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 12.h),
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.transparent,
          borderRadius: BorderRadius.circular(50),
          border: Border.all(color: MyColors.white),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              widget.txt,
              style: MyFonts.styleBold700_12.copyWith(color: MyColors.gray),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isChecked = !isChecked;
                });
              },
              child: Icon(
                isChecked ? Icons.radio_button_checked : Icons.radio_button_off,
                color: MyColors.gray,
              ),
            ),
          ],
        ));
  }
}
