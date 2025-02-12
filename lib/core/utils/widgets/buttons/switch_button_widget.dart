import 'package:flutter/material.dart';

import '../../../styles/colors/my_colors.dart';
import '../../../styles/fonts/my_fonts.dart';

class SwitchButtonWidget extends StatefulWidget {
  final String text;
  final ValueNotifier<bool> value;


  const SwitchButtonWidget(
      {super.key, required this.text, required this.value,});

  @override
  State<SwitchButtonWidget> createState() => _SwitchButtonWidgetState();
}

class _SwitchButtonWidgetState extends State<SwitchButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 24,
          child: Transform.scale(
            scale: .9,
            origin: Offset.zero,
            transformHitTests: true,
            alignment: Alignment.centerLeft,
            child: Switch(
              materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
              inactiveTrackColor: MyColors.white,
              inactiveThumbColor: MyColors.baseColor,
              activeColor: MyColors.white,
              activeTrackColor: MyColors.baseColor,
              value: widget.value.value,
              onChanged: (value) {
                setState(() {
                  widget.value.value = value;
                });
              },
            ),
          ),
        ),
        Expanded(
          child: Text(
            widget.text,
            style: MyFonts.styleMedium500_18.copyWith(color: MyColors.black),
          ),
        ),
      ],
    );
  }
}
