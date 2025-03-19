import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/response/get_random_exercises_response_entity.dart';
import 'package:fitness_app/features/home/domain/entities/response/get_random_muscles_response_entity.dart';
import 'package:injectable/injectable.dart';

import '../../domain/contracts/home_repo.dart';
import '../data_sources/online/contracts/home_online_data_source.dart';

@Injectable(as: HomeRepo)
class HomeRepoImpl implements HomeRepo {
  final HomeOnlineDataSource _homeOnlineDataSource;

  @factoryMethod
  HomeRepoImpl(this._homeOnlineDataSource);

  @override
  Future<DataResult<GetRandomMusclesResponseEntity>> getRandomMusclesRecommended() async {
    return await _homeOnlineDataSource.getRandomMusclesRecommended();
  }

  @override
  Future<DataResult<GetRandomExercisesResponseEntity>>
      getRandomExercises() async {
    return await _homeOnlineDataSource.getRandomExercises();
  }


}
