import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/domain/entities/request/signup_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/sign_up_response_entity.dart';
import 'package:fitness_app/features/auth/domain/repositories/auth_repo.dart';
import 'package:fitness_app/features/auth/domain/use_case/signup_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepository])
void main() {
  late MockAuthRepository mockAuthRepository;
  late SignUpUseCase signUpUseCase;
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


  setUp(() {
    mockAuthRepository = MockAuthRepository();
    signUpUseCase = SignUpUseCase(mockAuthRepository);
    provideDummy<DataResult<SignUpResponseEntity>>(Success(const SignUpResponseEntity()));
  });

  test('when call (signUp method) it should get authRepository.signUp with correct parameters', () async {
    var expectedResponse = Success<SignUpResponseEntity>(const SignUpResponseEntity());
    when(mockAuthRepository.signUp(request:signUpRequestEntity )).thenAnswer((_) async => expectedResponse);
    var result = await signUpUseCase.signUp(signUpRequestEntity);
    expect(result, isA<Success<SignUpResponseEntity>>());
    verify(mockAuthRepository.signUp(request: signUpRequestEntity)).called(1);
  });
}
