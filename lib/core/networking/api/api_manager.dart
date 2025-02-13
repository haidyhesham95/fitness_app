import 'package:dio/dio.dart';
import 'package:fitness_app/core/networking/api/api_constants.dart';
import 'package:fitness_app/features/auth/data/models/request/login_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/request/signup_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/response/login_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/response/signup_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/http.dart';
part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class  ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @POST(ApiConstants.signInApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);
  @POST(ApiConstants.signUpApi)
  Future<SignUpResponseDto> signup(@Body() SignUpRequestDto request);


}