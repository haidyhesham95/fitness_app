import 'package:fitness_app/core/services/shared_preference/shared_pref_keys.dart';
import 'package:fitness_app/core/services/shared_preference/shared_preference_helper.dart';
import 'package:fitness_app/features/auth/data/contracts/auth_offline_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: OfflineDataSource)
class OfflineDataSourceImplementation implements OfflineDataSource {

  @factoryMethod
  OfflineDataSourceImplementation();

  @override
  Future<void> cacheToken(String token) async {
    SharedPrefHelper()
        .setString(key: SharedPrefKeys.tokenKey, stringValue: token);
  }

  @override
  Future<String?> getToken() async {
    return SharedPrefHelper().getString(key: SharedPrefKeys.tokenKey) ?? "";
  }

  @override
  Future<void> deleteCachedToken() {
    return SharedPrefHelper().removePreference(key: SharedPrefKeys.tokenKey);
  }
}
