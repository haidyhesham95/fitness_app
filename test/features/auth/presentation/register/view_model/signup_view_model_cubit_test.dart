import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
import 'package:fitness_app/features/auth/domain/use_case/signup_use_case.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_action.dart';
import 'package:fitness_app/features/auth/presentation/register/view_model/signup_view_model_cubit.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'signup_view_model_cubit_test.mocks.dart';

@GenerateMocks([SignUpUseCase])
void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockSignUpUseCase signUpUseCase;
  late SignUpViewModel signUpViewModel;
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
      rePassword: 'Somaya@123');
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
      id: '1',
      photo: '',
      createdAt: '16/2/2025');

  setUp(() {
    signUpUseCase = MockSignUpUseCase();
    signUpViewModel = SignUpViewModel(signUpUseCase);
    provideDummy<DataResult<SignUpResponseEntity>>(Success(SignUpResponseEntity(
        token:
            "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdiMTFlZjg5MWJiYTMxOTJjNzY2MDJhIiwiaWF0IjoxNzM5NjYxMDQ4fQ.oqUSFMKAvJMW04jLTvR2pGStdwa0r99DLBWmRPMS2DE",
        message: "success",
        error: "",
        user: signUpUser)));
    provideDummy<DataResult<SignUpResponseEntity>>(
        Fail(Exception('Login Failed')));
  });

  blocTest<SignUpViewModel, SignUpViewModelState>(
    'when call doAction function it should call signUp from useCase and change state with the right sequence',
    build: () {
      var mockedResult = Success<SignUpResponseEntity>(
        SignUpResponseEntity(
          token:
              'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ1c2VyIjoiNjdiMTFlZjg5MWJiYTMxOTJjNzY2MDJhIiwiaWF0IjoxNzM5NjYxMDQ4fQ.oqUSFMKAvJMW04jLTvR2pGStdwa0r99DLBWmRPMS2DE',
          error: 'error',
          message: 'success',
          user: signUpUser
        ),
      );

      when(signUpUseCase.signUp(signUpRequestEntity))
          .thenAnswer((_) async => mockedResult);
      return signUpViewModel;
    },
    act: (signUpViewModel) =>
        signUpViewModel.doAction(SignupActionSelected()),
    expect: () => [
      isA<SignupLoading>(),
      isA<SignupSuccess>(),
    ],
    verify: (_) {
      verify(signUpUseCase.signUp(signUpRequestEntity)).called(1);
    },
  );

  blocTest<SignUpViewModel, SignUpViewModelState>(
    'when call doAction function  returns fail  it should emit Error state ',
    build: () {
      var mockedResult =
          Fail<SignUpResponseEntity>(Exception('Invalid credentials'));

      when(signUpUseCase.signUp(signUpRequestEntity))
          .thenAnswer((_) async => mockedResult);
      return signUpViewModel;
    },
    act: (signUpViewModel) =>
        signUpViewModel.doAction(SignupActionSelected()),
    expect: () => [
      isA<SignupLoading>(),
      isA<SignupError>(),
    ],
    verify: (_) {
      verify(signUpUseCase.signUp(signUpRequestEntity)).called(1);;
    },
  );
}
