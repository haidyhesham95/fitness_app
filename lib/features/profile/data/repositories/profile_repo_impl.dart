import 'package:injectable/injectable.dart';
import '../../../../core/networking/common/api_result.dart';
import '../../domain/entities/response/profile_response_entity.dart';
import '../data_sources/contracts/online_data_sources/profile_online_data_source.dart';
import 'package:fitness_app/features/profile/domain/entities/response/edit_profile_response_entity.dart';
import 'package:fitness_app/features/profile/domain/repositories/profile_repo.dart';


@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileOnlineDataSource _onlineDataSource;
  ProfileRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<EditProfileResponseEntity>> editProfile(
      Map<String, dynamic> profileData) async {
    return await _onlineDataSource.editProfile(profileData);
  }
  @override
  Future<DataResult<ProfileResponseEntity>> getUserData() async {
    return await _onlineDataSource.getUserData();
  }
}
