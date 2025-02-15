import 'package:fitness_app/core/networking/api/api_manager.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/data/impl/auth_online_data_source_impl.dart';
import 'package:fitness_app/features/auth/data/mappers/auth_mapper.dart';
import 'package:fitness_app/features/auth/data/models/response/login_response_dto.dart';
import 'package:fitness_app/features/auth/data/models/response/signup_response_dto.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'auth_online_data_source_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  var userDto = UserDto(
      firstName: 'Somaya',
      lastName: 'Mahmoud',
      gender: 'female',
      email: 'somayamahmoud12@gmail.com',
      goal: 'Gain weight',
      height: 170,
      weight: 60,
      activityLevel: 'Trainer',
      age: 25,
  );
  var signUpRequestEntity = SignUpRequestEntity(
      firstName: 'Somaya',
      lastName: 'Mahmoud',
      gender: 'female',
      password: 'Somaya@123',
      email: 'somayamahmoud12@gmail.com',
      goal: 'Gain weight',
      height: 170,
      weight: 60,
      activityLevel: 'Trainer',
      age: 25,
      rePassword: 'Somaya@123'
  );
  var signUpResponse = SignUpResponseDto(
    token: '',
    user: userDto,
    message:'success'
  );
  User user = User(
      Id: '1',
      firstName: 'Somaya',
      lastName: 'Mahmoud',
      email:  'somayamahmoud12@gmail.com',
      gender:  'female',
      age:  70,
      weight:  60,
      height:  170,
      activityLevel:  'trainer',
      goal:  'gain weight',
      photo:  '',
      createdAt:  '15/2/2025'
  );
  var loginResponseDto = LoginResponseDto(
      user: user,
      token: '',
      message: 'success'
  );
  var loginResponseEntity = LoginResponseEntity(
      token: '',
      message: 'success',
      error: 'error'
  );
  var loginRequestEntity = LoginRequestEntity(
      email: 'somayamahmoud12@gmail.com',
      password: 'Somaya@123'
  );
  setUp(() async {
   mockApiManager = MockApiManager();
  });
  group('when call signUp or login should get them from api manager', (){

    // test signUp
    test('when call signUp from online data source it should call apiManager.signUp with correct body', ()async{
      SignUpUser expectedUser = AuthMapper.mapUserFromDtoToEntity(userDto);
       var authOnlineDataSourceImpl = AuthOnlineDataSourceImpl(mockApiManager);
       var mockedResult = Success<SignUpUser>(expectedUser);
       provideDummy<DataResult<SignUpUser>>(mockedResult);
      when(mockApiManager.signup(any)).thenAnswer((_) async => signUpResponse);
       var result = await authOnlineDataSourceImpl.signUp(request: signUpRequestEntity);
      expect(result, isA<Success<SignUpResponseEntity>>());
      verify(mockApiManager.signup(any)).called(1);
    });

    // test login
    test('when call login from online data source it should call apiManager.login with correct body', ()async{
       var authOnlineDataSourceImpl = AuthOnlineDataSourceImpl(mockApiManager);
       var mockedResult = Success<User>(user);
       provideDummy<DataResult<User>>(mockedResult);
      when(mockApiManager.login(any)).thenAnswer((_) async => loginResponseDto);
       var result = await authOnlineDataSourceImpl.login(loginRequestEntity);
      expect(result, isA<Success<LoginResponseEntity>>());
      verify(mockApiManager.login(any)).called(1);
    });
  });
}