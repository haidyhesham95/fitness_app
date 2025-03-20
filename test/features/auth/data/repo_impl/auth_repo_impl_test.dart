import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/data/data_sources/contracts/online_data_sources/auth_online_data_source.dart';
import 'package:fitness_app/features/auth/data/repositories/auth_repo_impl.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'auth_repo_impl_test.mocks.dart';
@GenerateMocks([AuthOnlineDataSource])

void main() {
  late MockAuthOnlineDataSource onlineDatasource;
  late AuthRepoImpl authOnlineDatasource;

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
      age: 80,
      rePassword: 'Somaya@123'
  );

  var signUpUser = const SignUpUser(
      firstName: 'Somaya',
      lastName: 'Mahmoud',
      gender: 'female',
      email: 'somayamahmoud12@gmail.com',
      goal: 'Gain weight',
      height: 170,
      weight: 60,
      activityLevel: 'Trainer',
      age: 25,
      createdAt: '16/2/2025',
      photo: '',
      id: '1'
  );

  var signUpResponseEntity = SignUpResponseEntity(
      user: signUpUser,
      message: 'success',
      token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdiMTFlZjg5MWJiYTMxOTJjNzY2MDJhIiwiaWF0IjoxNzM5NjYxMDQ4fQ.oqUSFMKAvJMW04jLTvR2pGStdwa0r99DLBWmRPMS2DE',
      error: 'error'
  );

  var loginResponseEntity = LoginResponseEntity(
      token: '',
      message: 'success'
  );
  var loginRequestEntity = LoginRequestEntity(
      email: 'somayamahmoud12@gmail.com',
      password: 'Somaya@123'
  );

  setUp(() {
    onlineDatasource = MockAuthOnlineDataSource();
    authOnlineDatasource = AuthRepoImpl(onlineDatasource);
    provideDummy<DataResult<SignUpResponseEntity>>(Success(signUpResponseEntity));
    provideDummy<DataResult<LoginResponseEntity>>(Success(loginResponseEntity));
  });

group('test auth online data source when call authRepo.signUp or authRepo.login', (){
  // test signUp
  test('when call authRepo.signUp it should call signUp function from auth online data source', () async {
    when(onlineDatasource.signUp(request: signUpRequestEntity))
        .thenAnswer((_) async => Success(signUpResponseEntity));
    var result = await authOnlineDatasource.signUp(request: signUpRequestEntity);
    expect(result, isA<Success<SignUpResponseEntity>>());
    verify(onlineDatasource.signUp(request: signUpRequestEntity)).called(1);
  });

  // testLogin
  test('when call authRepo.login it should call function from auth online data source', ()async{
    when(authOnlineDatasource.login(loginRequestEntity)).thenAnswer((_)async =>Success(loginResponseEntity));
    var result = await authOnlineDatasource.login(loginRequestEntity);
    expect(result, isA<Success<LoginResponseEntity>>());
    verify(onlineDatasource.login(loginRequestEntity)).called(1);
  });
});
}
