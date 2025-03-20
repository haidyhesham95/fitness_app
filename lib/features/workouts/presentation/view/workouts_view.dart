import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/widgets/base/base_view.dart';
import 'package:fitness_app/core/utils/widgets/pinned_sliver_widget.dart';
import 'package:fitness_app/core/utils/widgets/tab_bar_widget.dart';
import 'package:fitness_app/features/generic/widgets/generic_card.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_states.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_view_model.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WorkoutsView extends StatefulWidget {
  WorkoutsView({super.key});

  @override
  _WorkoutsViewState createState() => _WorkoutsViewState();
}

class _WorkoutsViewState extends State<WorkoutsView> {
  WorkoutsViewModelCubit get viewModel => context.read<WorkoutsViewModelCubit>();

  @override
  void initState() {
    super.initState();
    viewModel.doAction(GetAllWorkouts());
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WorkoutsViewModelCubit, WorkoutsViewModelState>(
      builder: (context, state) {
        return BaseView(

          child: [
            PinnedSliverWidget(
                child: DefaultTabController(
                  length: viewModel.muscles.length,
                  child: Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                    child: tabBarWidget(
                      tabs: [
                        ...viewModel.muscles
                            .map((item) => Tab(text: item.name)),
                      ],
                      onTap: (index) {
                        viewModel.doAction(GetMusclesByMuscleGroupId(
                            viewModel.muscles[index].id));
                      },
                      context: context,
                    ),
                  ),
                )),
            SliverPadding(
              padding: const EdgeInsets.all(16.0),
              sliver: SliverGrid(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 17.h,
                  mainAxisSpacing: 17.w,
                  childAspectRatio: 1,
                ),
                delegate: SliverChildBuilderDelegate(
                      (context, index) {
                    return index % 2 == 1
                        ? FadeInUpBig(
                      child: GenericCard(
                        title: viewModel.musclesGroup[index].name,
                        imageUrl: viewModel.musclesGroup[index].image,
                      ),
                    )
                        : FadeInDownBig(
                      child: GenericCard(
                        title: viewModel.musclesGroup[index].name,
                        imageUrl: viewModel.musclesGroup[index].image,
                      ),
                    );
                  },
                  childCount: viewModel.musclesGroup.length,
                ),
              ),
            ),
          ],
          image: Assets.imagesMealBg,
          isArrowBackShow: false,
          subTitle: context.translate(LangKeys.workouts),
        );
      },
      listener: (context, state) {
        if (state is GetAllWorkoutsSuccess) {
          viewModel.doAction(
              GetMusclesByMuscleGroupId(viewModel.muscles[0].id));
        }
      },
    );
  }
}
