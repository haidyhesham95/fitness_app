import 'dart:io';
import 'package:dio/dio.dart';
import 'package:fitness_app/features/auth/data/models/request/reset_password_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/request/verify_otp_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/response/forget_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/response/reset_password_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/request/login_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/request/signup_request_dto.dart';
import 'package:fitness_app/features/auth/data/models/response/login_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/response/signup_response_dto.dart';
import 'package:fitness_app/features/profile/data/models/response/edit_profile_response_dto.dart';
import 'package:fitness_app/features/profile/data/models/response/upload_photo_response_dto.dart';
import 'package:fitness_app/features/workouts/data/models/response/get_all_workout_by_id_dto.dart';
import 'package:fitness_app/features/workouts/data/models/response/workouts_response_dto.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../features/auth/data/models/request/forget_password_request_dto.dart';
import '../../../features/profile/data/models/response/profile_response_model.dart';
import 'api_constants.dart';
part 'api_manager.g.dart';

@singleton
@injectable
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiManager {
  @factoryMethod
  factory ApiManager(Dio dio) = _ApiManager;

  @POST(ApiConstants.forgetPassword)
  Future<ForgetPasswordResponseDto> forgetPassword(
      @Body() ForgetPasswordRequestDto request);
  @POST(ApiConstants.signInApi)
  Future<LoginResponseDto> login(@Body() LoginRequestDto request);
  @POST(ApiConstants.signUpApi)
  Future<SignUpResponseDto> signup(@Body() SignUpRequestDto request);

  @POST(ApiConstants.verifyOtp)
  Future verifyOtp(@Body() VerifyOtpRequestDto request);

  @PUT(ApiConstants.resetPassword)
  Future<ResetPasswordResponseDto> resetPassword(
      @Body() ResetPasswordRequestDto request);
  @GET(ApiConstants.profileData)
  Future<ProfileResponseDto> getLoggedUserData();
  @GET(ApiConstants.getAllWorkouts)
  Future<WorkoutsResponseDto> getAllWorkouts();
  @GET(ApiConstants.getWorkoutsById)
  Future<GetAllWorkoutsByIdDto> getWorkoutsById();
  @PUT(ApiConstants.editProfileApi)
  Future<EditProfileResponseDto> editProfile(
      @Body() Map<String, dynamic> profileData);
  @PUT(ApiConstants.uploadPhoto)
  @MultiPart()
  Future<UploadPhotoResponseDto> uploadPhoto(
    @Part(name: "photo") File photo,
  );
}
