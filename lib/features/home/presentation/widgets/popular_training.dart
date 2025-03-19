import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/utils/widgets/base/app_loader.dart';
import 'package:fitness_app/features/home/presentation/widgets/popular_training_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../viewModel/home_view_model_cubit.dart';

class PopularTraining extends StatefulWidget {
  const PopularTraining({super.key});

  @override
  State<PopularTraining> createState() => _PopularTrainingState();
}

class _PopularTrainingState extends State<PopularTraining> {
  HomeViewModelCubit get viewModel => context.read<HomeViewModelCubit>();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeViewModelCubit, HomeViewModelState>(
        builder: (context, state) {
          return FadeInLeft(
              child: PopularTrainingSection(
        popularTrainingItems: viewModel.popularTrainingItems,
      ));
    });
  }
}
