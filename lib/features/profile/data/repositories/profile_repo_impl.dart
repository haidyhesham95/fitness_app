import 'package:injectable/injectable.dart';

import '../../../../core/networking/common/api_result.dart';
import '../../domain/contracts/profile_repo.dart';
import '../../domain/entities/response/profile_response_entity.dart';
import '../data_sources/contracts/online_data_sources/profile_online_data_source.dart';


@Injectable(as: ProfileRepo)
class ProfileRepoImpl implements ProfileRepo {
  final ProfileOnlineDataSource _onlineDataSource;

  @factoryMethod
  ProfileRepoImpl(this._onlineDataSource);

  @override
  Future<DataResult<ProfileResponseEntity>> getUserData() async {
    return await _onlineDataSource.getUserData();
  }
}