import 'package:fitness_app/features/home/domain/contracts/home_repo.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../entities/response/get_all_difficult_levels_response_entity.dart';

@injectable
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

/*

1- popular training use case
2- call two repos (home and workout)
3- impl
4- shuffle
5- loop in popular
6- return list of popular

 */