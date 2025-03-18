import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/features/generic/widgets/app_bar.dart';
import 'package:fitness_app/features/workouts/presentation/widgets/selector_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_view_model.dart';

class AllMusclesWidget extends StatefulWidget {
  AllMusclesWidget({super.key});

  @override
  State<AllMusclesWidget> createState() => _AllMusclesWidgetState();
}

class _AllMusclesWidgetState extends State<AllMusclesWidget> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<WorkoutsViewModelCubit>();
    return
      Column(
        children: [
          FitnessAppBar(
            title: context.translate(LangKeys.workouts),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: SizedBox(
              height: 60.h,
              child: cubit.data!.isEmpty
                  ? const Center(
                  child: Text("", style: TextStyle(color: Colors.white)))
                  : ListView.builder(
                itemCount: cubit.data!.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                    child: buildCategory(
                      cubit.data![index].name ?? '',
                      context,
                      isSelected: selectedIndex == index,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
    );
  }
}
