import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/networking/common/register_context_module.dart';
import '../../../../core/utils/widgets/base/base_view.dart';
import '../viewModel/exercise_view_model_cubit.dart';
import '../widget/exercise_details.dart';
import '../widget/exercise_selector.dart';

class ExerciseView extends StatelessWidget {
  const ExerciseView(
      {super.key,
      required this.id,
      required this.title,
      required this.imageUrl});

  final String id, title, imageUrl;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ExerciseViewModelCubit>(),
      child: BaseView(
          extendBodyBehindAppBar: true,
          child: [
            ExerciseDetails(
              imageUrl: imageUrl,
              title: title,
            ),
            ExerciseSelector(primeMoverMuscleId: id),
          ],
          image: Assets.imagesMealBg,
          isArrowBackShow: true,
          blur: 7),
    );
  }
}
