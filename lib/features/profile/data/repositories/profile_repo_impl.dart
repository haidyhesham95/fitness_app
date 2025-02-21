import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/profile/data/data_sources/contracts/profile_online_data_source.dart';
import 'package:fitness_app/features/profile/data/models/request/edit_profile_request_dto.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:fitness_app/features/profile/domain/repositories/profile_repo.dart';
import 'package:injectable/injectable.dart';


@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileOnlineDataSource _onlineDataSource;
  ProfileRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<EditProfileResponseEntity>> editProfile(
      EditProfileRequestDto request) async {
    return await _onlineDataSource.editProfile(request);
  }
}
