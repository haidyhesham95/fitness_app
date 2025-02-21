import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/auth/domain/contracts/auth_repo.dart';
import 'package:fitness_app/features/auth/domain/entities/request/login_request_entity.dart';
import 'package:fitness_app/features/auth/domain/entities/response/login_response_entity.dart';
import 'package:fitness_app/features/auth/domain/use_cases/login_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'login_use_case_test.mocks.dart';

@GenerateMocks([AuthRepo])
void main() {
  late MockAuthRepo mockAuthRepository;
  late LoginUseCase loginUseCase;

  setUp(() {
    mockAuthRepository = MockAuthRepo();
    loginUseCase = LoginUseCase(mockAuthRepository);
    provideDummy<DataResult<LoginResponseEntity>>(Success(LoginResponseEntity()));
  });

  test('when call (login method) it should get authRepository.login with correct parameters', () async {
    var requestEntity = LoginRequestEntity();
    var expectedResponse = Success<LoginResponseEntity>(LoginResponseEntity());
    when(mockAuthRepository.login(requestEntity)).thenAnswer((_) async => expectedResponse);
    var result = await loginUseCase.login(requestEntity);
    expect(result, isA<Success<LoginResponseEntity>>());
    verify(mockAuthRepository.login(requestEntity)).called(1);
  });
}
