import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../contracts/home_repo.dart';
import '../entities/response/get_random_exercises_response_entity.dart';

@injectable
class RandomExercisesUseCase {
  final HomeRepo _homeRepo;

  RandomExercisesUseCase(this._homeRepo);

  Future<DataResult<GetRandomExercisesResponseEntity>>
      getRandomExercises() async => await _homeRepo.getRandomExercises();
}
