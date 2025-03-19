import 'dart:math';

import 'package:fitness_app/features/home/domain/entities/response/get_all_difficult_levels_response_entity.dart';
import 'package:fitness_app/features/home/domain/entities/response/popular_training_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/domain/repositories/workouts_repo.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../presentation/constants/popular_section_images.dart';
import '../contracts/home_repo.dart';

@injectable
class PopularTrainingUseCase {
  final HomeRepo _homeRepo;
  final WorkoutsRepo _workoutsRepo;

  const PopularTrainingUseCase(this._workoutsRepo, this._homeRepo);

  Future<DataResult<GetAllDifficultLevelsResponseEntity>?>
      getAllLevels() async => await _homeRepo.getAllDifficultLevel();

  Future<DataResult<AllMusclesResponseEntity>> getAllWorkouts() async =>
      await _workoutsRepo.getAllWorkouts();

  Future<List<PopularTrainingEntity>> getPopularTraining() async {
    List<PopularTrainingEntity> popularTrainingItems = [];
    List<GetAllDifficultLevelsResponseEntityLevels?>? levels = [];
    List<MuscleGroupEntity> muscles = [];

    var allLevels = await getAllLevels();
    var allMuscles = await getAllWorkouts();

    if (allLevels is Success<GetAllDifficultLevelsResponseEntity> &&
        allMuscles is Success<AllMusclesResponseEntity>) {
      levels = List.from(allLevels.data.levels!)..shuffle(Random());
      muscles = allMuscles.data.musclesGroup;
      int itemLength = 0;
      if (levels.length < muscles.length) {
        itemLength = levels.length;
      } else {
        itemLength = muscles.length;
      }

      for (int i = 0; i < itemLength; i++) {
        popularTrainingItems.add(PopularTrainingEntity(
          levelId: levels[i]?.id ?? "",
          levelName: levels[i]?.name ?? "",
          muscleName: muscles[i].name,
          muscleId: muscles[i].id,
          image: images![i],
        ));
      }
    }
    debugPrint("popular training use case : ${popularTrainingItems.map(
      (e) =>
          "${e.levelName} -- ${e.muscleName} -- ${e.image} -- ${e.muscleId} -- ${e.levelId} ",
    )}");
    return popularTrainingItems;
  }
}
