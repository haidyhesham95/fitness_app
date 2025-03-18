import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/widgets/base/base_view.dart';
import '../widget/exercise_details.dart';
import '../widget/exercise_selector.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView({super.key, required this.imageUrl, required this.title});

  final String imageUrl, title;

  @override
  Widget build(BuildContext context) {
    return BaseView(
        extendBodyBehindAppBar: true,
        child: [
          ExerciseDetails(
            imageUrl: imageUrl,
            title: title,
          ),
          const ExerciseSelector(),
        ],
        image: Assets.imagesMealBg,
        isArrowBackShow: true,
        blur: 7);
  }
}
