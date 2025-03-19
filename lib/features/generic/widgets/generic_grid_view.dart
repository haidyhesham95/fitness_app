import 'package:fitness_app/features/generic/widgets/generic_card.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_states.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GenericGridView extends StatelessWidget {
  const GenericGridView(this.imageUrl, this.title);

  final String imageUrl;
  final String title;

  @override
  Widget build(BuildContext context) {
    int? length;
    return BlocBuilder<WorkoutsViewModelCubit, WorkoutsViewModelState>(
      builder: (context, state) {
        if (state is GetWorkoutsByIdSuccess) {
          length = state.data.muscles!.length;
        }
        return Padding(
          padding: EdgeInsets.all(16.sp),
          child: GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              crossAxisSpacing: 18,
              mainAxisSpacing: 18,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return GenericCard(imageUrl: imageUrl, title: title);
            },
            itemCount: length,
          ),
        );
      },
    );
  }
}
