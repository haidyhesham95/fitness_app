import 'package:fitness_app/features/exercises/domain/use_case/exercise_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:fitness_app/features/exercises/domain/repositories/exercise_repo.dart';
import 'package:fitness_app/features/exercises/domain/entities/exercises_entity.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';

import 'exercise_use_case_test.mocks.dart';

@GenerateMocks([ExerciseRepo])
void main() {
  provideDummy<DataResult<ExercisesEntity>>(Success(ExercisesEntity(exercises: [])));

  late ExerciseUseCase exerciseUseCase;
  late MockExerciseRepo mockExerciseRepo;

  setUp(() {
    mockExerciseRepo = MockExerciseRepo();
    exerciseUseCase = ExerciseUseCase(mockExerciseRepo);
  });

  test('getExercises should return data from ExerciseRepo', () async {
    final response = Success(ExercisesEntity(exercises: []));

    when(mockExerciseRepo.getExercises(any, any))
        .thenAnswer((_) async => response);

    final result = await exerciseUseCase.getExercises('1', '2');

    expect(result, equals(response));
    verify(mockExerciseRepo.getExercises('1', '2')).called(1);
  });
}
