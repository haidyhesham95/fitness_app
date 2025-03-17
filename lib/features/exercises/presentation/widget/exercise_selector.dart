import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/features/exercises/presentation/widget/container_selectable_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/localization/lang_keys.dart';
import '../../../../core/networking/common/register_context_module.dart';
import '../../../../core/styles/fonts/my_fonts.dart';
import '../../../../core/utils/widgets/spacing.dart';
import '../viewModel/exercise_action.dart';
import '../viewModel/exercise_view_model_cubit.dart';
import 'build_item_exercise_selector.dart';
import 'container_exercise_selector_widget.dart';

class ExerciseSelector extends StatefulWidget {
  const ExerciseSelector({super.key});

  @override
  _ExerciseSelectorState createState() => _ExerciseSelectorState();
}

class _ExerciseSelectorState extends State<ExerciseSelector> {
  String? selectedText;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    selectedText = context.translate(LangKeys.beginner);
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: BlocProvider(
        create: (context) =>
            getIt.get<ExerciseViewModelCubit>()..doAction(GetExercises()),
        child: BlocBuilder<ExerciseViewModelCubit, ExerciseViewModelState>(
          builder: (context, state) {
            switch (state.runtimeType) {
              case ExerciseViewModelLoading:
                return const AppLoader();
              case ExerciseViewModelSuccess:
                final filteredExercises = (state as ExerciseViewModelSuccess)
                    .data
                    .exercises!
                    .where(
                        (exercise) => exercise.difficultyLevel == selectedText)
                    .toList();

                return Column(
                  children: [
                    ContainerSelectableWidget(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          _buildSelectableText(
                              context.translate(LangKeys.beginner)),
                          _buildSelectableText(
                              context.translate(LangKeys.intermediate)),
                          _buildSelectableText(
                              context.translate(LangKeys.novice)),
                        ],
                      ),
                    ),
                    verticalSpacing(8.h),
                    if (filteredExercises.isNotEmpty)
                      ContainerExerciseSelectorWidget(
                          child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemCount: filteredExercises.length,
                        itemBuilder: (context, index) {
                          final exercise = filteredExercises[index];
                          return FadeInRight(
                            child: BuildItemExerciseSelector(
                              exercise: exercise,
                            ),
                          );
                        },
                        separatorBuilder: (context, index) => Divider(
                          color: context.colors.darkGray,
                          thickness: 1,
                        ),
                      )),
                  ],
                );
              case ExerciseViewModelError:
                return Center(
                    child: Text((state as ExerciseViewModelError)
                        .errorMessage
                        .error
                        .toString()));
              default:
                return const AppLoader();
            }
          },
        ),
      ),
    );
  }

  Widget _buildSelectableText(String text) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedText = text;
        });
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        decoration: BoxDecoration(
          color: selectedText == text
              ? context.colors.baseColor
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
