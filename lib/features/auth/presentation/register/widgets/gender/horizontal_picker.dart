import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../core/styles/fonts/my_fonts.dart';

class HorizontalPicker extends StatefulWidget {
  final int minValue;
  final int maxValue;
  final int initialValue;
  final ValueChanged<int> onSelected;

  const HorizontalPicker({
    Key? key,
    required this.minValue,
    required this.maxValue,
    required this.initialValue,
    required this.onSelected,
  }) : super(key: key);

  @override
  _HorizontalPickerState createState() => _HorizontalPickerState();
}

class _HorizontalPickerState extends State<HorizontalPicker> {
  late int selectedValue;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    selectedValue = widget.initialValue;
    _pageController = PageController(
        initialPage: selectedValue - widget.minValue, viewportFraction: 0.2);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 62.h,
      child: PageView.builder(
        controller: _pageController,
        scrollDirection: Axis.horizontal,
        itemCount: widget.maxValue - widget.minValue + 1,
        onPageChanged: (index) {
          setState(() {
            selectedValue = widget.minValue + index;
          });
          widget.onSelected(selectedValue);
        },
        itemBuilder: (context, index) {
          final value = widget.minValue + index;
          final isSelected = value == selectedValue;
          return Center(
            child: Text("$value",
                style: isSelected
                    ? MyFonts.styleExtraBold800_44.copyWith(
                        color: context.colors.baseColor,
                      )
                    : MyFonts.styleExtraBold800_33.copyWith(
                        color: context.colors.hintText,
                      )),
          );
        },
      ),
    );
  }
}
