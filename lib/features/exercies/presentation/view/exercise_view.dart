import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../widget/exercise_selector.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView(
      child: [
        SliverToBoxAdapter(child: Image.asset('assets/images/Frame 88.png')),
        ExerciseSelector(),
      ],
      image: Assets.imagesMealBg,
      isArrowBackShow: true,
    );
  }
}
