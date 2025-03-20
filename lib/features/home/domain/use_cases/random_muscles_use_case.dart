import 'package:fitness_app/features/home/domain/contracts/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/get_random_muscles_response_entity.dart';

@injectable
class RandomMusclesUseCase {
  final HomeRepo _homeRepo;

  const RandomMusclesUseCase(this._homeRepo);

  Future<DataResult<GetRandomMusclesResponseEntity>> getRandomMuscles() async =>
      await _homeRepo.getRandomMusclesRecommended();
}
