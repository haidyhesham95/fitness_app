import 'package:injectable/injectable.dart';

import '../../../../../core/services/shared_preference/shared_preference_helper.dart';
import '../contracts/offline_data_sources/auth_offline_data_source.dart';

@Injectable(as: AuthOfflineDataSource)
class AuthOfflineDataSourceImpl implements AuthOfflineDataSource {
  static const String _TOKENkEY = 'TOKENkEY';
  final SharedPrefHelper _sharedPrefHelper;

  @factoryMethod
  AuthOfflineDataSourceImpl(this._sharedPrefHelper);

  @override
  Future<void> cacheToken(String token) async {
    return await _sharedPrefHelper.setString(
        key: _TOKENkEY, stringValue: token);
  }

  @override
  Future<void> deleteToken() async {
    return await _sharedPrefHelper.removePreference(key: _TOKENkEY);
  }

  @override
  Future<String?> getToken() async {
    return await _sharedPrefHelper.getString(key: _TOKENkEY);
  }
}
