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
  int levelIndex = 0;

  PopularTrainingUseCase(this._workoutsRepo, this._homeRepo);

  Future<DataResult<GetAllDifficultLevelsResponseEntity>?>
  getAllLevels() async => await _homeRepo.getAllDifficultLevel();

  Future<DataResult<AllMusclesResponseEntity>> getAllWorkouts() async =>
      await _workoutsRepo.getAllWorkouts();

  Future<List<PopularTrainingEntity>> getPopularTraining() async {
    List<PopularTrainingEntity> popularTrainingItems = [];
    List<GetAllDifficultLevelsResponseEntityLevels?>? levels = [];
    List<MuscleGroupEntity> muscles = [];
    int itemLength = 0;

    var allLevels = await getAllLevels();
    var allMuscles = await getAllWorkouts();

    if (allLevels is Success<GetAllDifficultLevelsResponseEntity> &&
        allMuscles is Success<AllMusclesResponseEntity>) {
      muscles = List.from( allMuscles.data.musclesGroup)
        ..shuffle(Random());
      levels = allLevels.data.levels!;
      List<int> lengthsList = [levels.length, muscles.length, images.length];
      itemLength = lengthsList.reduce(min);
      for (int i = 0; i < itemLength; i++) {
        popularTrainingItems.add(PopularTrainingEntity(
          levelId: levels[i]?.id ?? "",
          levelName: levels[i]?.name ?? "",
          muscleName: muscles[i].name,
          muscleId: muscles[i].id,
          image: images[i],
        ));
      }
      int index = allLevels.data.levels!.indexWhere((element) =>
      element!.id == popularTrainingItems.map((e) =>e.levelId,));
      levelIndex = index;
    }
    debugPrint('muscle Name = ${muscles
        .map((e) => 'muscle Name : ${e.name}',)
        .toList()}');
    debugPrint('muscle length = ${muscles.length}');
    debugPrint('Level index = ${levelIndex}');

    debugPrint('levels Name = ${levels
        .map((e) => 'levels Name${e?.name}',)
        .toList()}');
    debugPrint('levels length = ${levels.length}');

    debugPrint("popular training use case : ${popularTrainingItems.map(
          (e) =>
      "${e.levelName} -- ${e.muscleName} -- ${e.image} -- ${e.muscleId} -- ${e
          .levelId} ",
    )}");
    return popularTrainingItems;
  }



}
