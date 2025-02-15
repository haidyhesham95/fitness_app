import 'package:fitness_app/core/services/shared_preference/shared_pref_keys.dart';
import 'package:fitness_app/core/services/shared_preference/shared_preference_helper.dart';
import 'package:injectable/injectable.dart';
import '../contracts/offline_data_sources/auth_offline_data_source.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  @factoryMethod
  AuthOfflineDataSourceImpl();

  @override
  Future<void> cacheToken(String token) async {
    return await SharedPrefHelper()
        .setString(key: SharedPrefKeys.tokenKey, stringValue: token);
  }

  @override
  Future<void> deleteToken() async {
    return await SharedPrefHelper()
        .removePreference(key: SharedPrefKeys.tokenKey);
  }

  @override
  Future<String?> getToken() async {
    return await SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey);
  }
}
