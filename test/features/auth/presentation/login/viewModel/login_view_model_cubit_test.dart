import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:fitness_app/features/auth/domain/use_case/login_use_case.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_action.dart';
import 'package:fitness_app/features/auth/presentation/login/viewModel/login_view_model_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_view_model_cubit_test.mocks.dart';

@GenerateMocks([LoginUseCase])
void main() {
  late MockLoginUseCase loginUseCase;
  late LoginViewModel loginViewModel;

  var loginRequestEntity = LoginRequestEntity(
    email: 'somayamahmoud12@gmail.com',
    password: 'Somaya@123',
  );


  setUp(() {
    loginUseCase = MockLoginUseCase();
    loginViewModel = LoginViewModel(loginUseCase);
    provideDummy<DataResult<LoginResponseEntity>>(Success(LoginResponseEntity(
      token: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdiMTFlZjg5MWJiYTMxOTJjNzY2MDJhIiwiaWF0IjoxNzM5NjYxMDQ4fQ.oqUSFMKAvJMW04jLTvR2pGStdwa0r99DLBWmRPMS2DE",
      message: "success",
      error: "",
    )));
    provideDummy<DataResult<LoginResponseEntity>>(Fail(Exception('Login Failed')));
  });


  blocTest<LoginViewModel, LoginViewModelState>(
    'when call doAction function it should call login from useCase and change state with the right sequence',
    build: () {
      var mockedResult = Success<LoginResponseEntity>(
        LoginResponseEntity(token: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdiMTFlZjg5MWJiYTMxOTJjNzY2MDJhIiwiaWF0IjoxNzM5NjYxMDQ4fQ.oqUSFMKAvJMW04jLTvR2pGStdwa0r99DLBWmRPMS2DE',error: 'error',message: 'success'),
      );

      when(loginUseCase.login(loginRequestEntity)).thenAnswer((_) async => mockedResult);
      return loginViewModel;
    },
    act: (loginViewModel) => loginViewModel.doAction(LoginAction(loginRequestEntity)),
    expect: () => [
      isA<LoginViewModelLoading>(),
      isA<LoginViewModelSuccess>(),
    ],
    verify: (_) {
      verify(loginUseCase.login(loginRequestEntity)).called(1);
    },
  );


  blocTest<LoginViewModel, LoginViewModelState>(
    'when call doAction function  returns fail  it should emit Error state ',
    build: () {
      var mockedResult = Fail<LoginResponseEntity>(Exception('Invalid credentials'));

      when(loginUseCase.login(loginRequestEntity)).thenAnswer((_) async => mockedResult);
      return loginViewModel;
    },
    act: (loginViewModel) => loginViewModel.doAction(LoginAction(loginRequestEntity)),
    expect: () => [
      isA<LoginViewModelLoading>(),
      isA<LoginViewModelError>(),
    ],
    verify: (_) {
      verify(loginUseCase.login(loginRequestEntity)).called(1);
    },
  );
}
