import 'package:dio/dio.dart';
import 'package:fitness_app/features/auth/data/models/response/forget_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../features/auth/data/models/request/forget_password_request_dto.dart';
import 'api_constants.dart';
part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class  ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(@Body() ForgetPasswordRequestDto request);
}