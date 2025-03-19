import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/home/domain/entities/response/get_random_muscles_response_entity.dart';

import '../../../../domain/entities/response/get_random_exercises_response_entity.dart';

abstract interface class HomeOnlineDataSource {
  Future<DataResult<GetRandomMusclesResponseEntity>> getRandomMusclesRecommended();

  Future<DataResult<GetRandomExercisesResponseEntity>> getRandomExercises();
}
