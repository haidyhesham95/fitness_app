import 'package:dio/dio.dart';
import 'package:fitness_app/core/networking/api/api_constants.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';

part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class  ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;


}