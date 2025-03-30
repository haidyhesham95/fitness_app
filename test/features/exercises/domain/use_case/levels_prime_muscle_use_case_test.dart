import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/exercises/domain/entities/levels_prime_over_muscle_entity.dart';
import 'package:fitness_app/features/exercises/domain/repositories/exercise_repo.dart';
import 'package:fitness_app/features/exercises/domain/use_case/levels_prime_muscle_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'levels_prime_muscle_use_case_test.mocks.dart';

@GenerateMocks([ExerciseRepo])
void main() {
  provideDummy<DataResult<LevelsPrimeMoverMuscleEntity>>(
    Success(LevelsPrimeMoverMuscleEntity(
      message: 'Success',
      totalLevels: 3,
      difficultyLevels: [],
    )),
  );

  late LevelsPrimeMuscleUseCase levelsPrimeMuscleUseCase;
  late MockExerciseRepo mockExerciseRepo;

  setUp(() {
    mockExerciseRepo = MockExerciseRepo();
    levelsPrimeMuscleUseCase = LevelsPrimeMuscleUseCase(mockExerciseRepo);
  });

  test('getLevels should return data from ExerciseRepo', () async {
    final response = Success(LevelsPrimeMoverMuscleEntity(
      message: 'Success',
      totalLevels: 3,
      difficultyLevels: [],
    ));

    when(mockExerciseRepo.getLevels(any)).thenAnswer((_) async => response);

    final result = await levelsPrimeMuscleUseCase.getLevels('1');

    expect(result, equals(response));
    verify(mockExerciseRepo.getLevels('1')).called(1);
  });
}
