import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/profile/domain/contracts/profile_repo.dart';
import 'package:fitness_app/features/profile/domain/entities/response/profile_response_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProfileUseCases {
  final ProfileRepo _profileRepo;

  ProfileUseCases(this._profileRepo);

  Future<DataResult<ProfileResponseEntity>> getUserData() async {
    return await _profileRepo.getUserData();
  }
}
