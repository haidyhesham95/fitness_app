import 'package:fitness_app/features/home/domain/contracts/home_repo.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/get_all_difficult_levels_response_entity.dart';

class AllDifficultLevelsUseCase {
  final HomeRepo _homeRepo;

  const AllDifficultLevelsUseCase(this._homeRepo);

  Future<DataResult<GetAllDifficultLevelsResponseEntity>>
      getAllDifficultLevel() async {
    var response = await _homeRepo.getAllDifficultLevel();
    if (response is Success<GetAllDifficultLevelsResponseEntity>) {
      var data = response.data;
      data.levels?.shuffle();
      response = Success(data);
    }
    return response;
  }
}
