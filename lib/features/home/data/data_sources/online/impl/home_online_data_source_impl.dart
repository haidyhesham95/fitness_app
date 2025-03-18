import 'package:fitness_app/core/networking/api_execute.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/home/data/data_sources/online/contracts/home_online_data_source.dart';
import 'package:fitness_app/features/home/data/mapper/home_mapper.dart';
import 'package:fitness_app/features/home/domain/entities/response/get_random_exercises_response_entity.dart';
import 'package:fitness_app/features/home/domain/entities/response/get_random_muscles_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../../../../../core/networking/api/api_manager.dart';

@Injectable(as: HomeOnlineDataSource)
class HomeOnlineDataSourceImpl implements HomeOnlineDataSource {
  final ApiManager _apiManager;

  @factoryMethod
  HomeOnlineDataSourceImpl(this._apiManager);

  @override
  Future<DataResult<
      GetRandomMusclesResponseEntity>> getRandomMusclesRecommended() {
    return executeApi(() async {
      var response = await _apiManager.getRandomMusclesRecommendation();
      return HomeMapper.mapRandomMusclesToEntity(response);
    });
  }

  @override
  Future<DataResult<GetRandomExercisesResponseEntity>> getRandomExercises() {
    return executeApi(() async {
      var response = await _apiManager.getRandomExercises();
      return HomeMapper.mapRandomExercisesToEntity(response);
    });
  }


}


