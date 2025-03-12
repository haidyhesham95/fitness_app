import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';

class ExerciseSelector extends StatefulWidget {
  const ExerciseSelector({super.key});

  @override
  _ExerciseSelectorState createState() => _ExerciseSelectorState();
}

class _ExerciseSelectorState extends State<ExerciseSelector> {
  String? selectedText; // لتتبع النص المحدد

  @override
  void initState() {
    super.initState();
    selectedText = 'Exercise';
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.h),
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.zero,
                topRight: Radius.zero,
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
              ),
              color: context.colors.bgColor.withValues(alpha: 0.9),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildSelectableText('Exercise'),
                _buildSelectableText('Intermediate'),
                _buildSelectableText('Advanced'),
              ],
            ),
          ),

          verticalSpacing(8.h),

          // ListView متصل بالنص المحدد
          if (selectedText != null)
            Container(
              margin: EdgeInsets.symmetric(horizontal: 12.w),
              padding: EdgeInsets.only(top: 0.h , bottom: 8.h , left: 8.w , right: 8.w),
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: context.colors.bgColor.withValues(alpha: 0.8),
              ),
              child: ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                // itemBuilder: (context, index) => Text(
                //   '$selectedText $index',
                //   style: MyFonts.styleBold700_12.copyWith(
                //     color: context.colors.white,
                //   ),
                // ),
                itemBuilder:( context, index){
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipPath(
                          clipper: ShapeBorderClipper(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Image.asset('assets/images/Frame 88.png',
                            height: 80,
                          ),
                        ),
                        SizedBox(width: 17.w,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Bench press'  ,style: MyFonts.styleMedium500_18.copyWith(
                            color: context.colors.white,
                            )),
                            SizedBox(height: 6.h,),
                            Text('Bench press'  ,style: MyFonts.styleRegular400_14.copyWith(
                              color: context.colors.white,
                            )),
                            Text('Bench press'  ,style: MyFonts.styleRegular400_14.copyWith(
                              color: context.colors.white,
                            )),
                            Text('Bench press'  ,style: MyFonts.styleRegular400_14.copyWith(
                              color: context.colors.white,
                            )),

                          ],
                        ),
                        Spacer(),
                        Container(
                          height: 40,
                          width: 40,
                           decoration: BoxDecoration(

                            color: context.colors.baseColor,
                            borderRadius: BorderRadius.circular(50),

                          ),
                          child: IconButton(
                            padding: EdgeInsets.zero,
                              onPressed: (){}, icon: Icon(Icons.play_arrow , color: context.colors.black,
                            size: 40,
                          )),
                        )


                    ],
                  );
                } ,
                separatorBuilder: (context, index) => Divider(
                  color: context.colors.darkGray,
                  thickness: 1,
                ),
                itemCount: 3,
              ),
            ),
        ],
      ),
    );
  }

  // طريقة مساعدة لبناء نص قابل للتحديد
  Widget _buildSelectableText(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedText = text; // تحديث النص المحدد
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selectedText == text
              ? context.colors.baseColor// تمييز النص المحدد
              : Colors.transparent,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Text(
          text,
          style: MyFonts.styleBold700_12.copyWith(
            color: context.colors.white,
          ),
        ),
      ),
    );
  }
}
