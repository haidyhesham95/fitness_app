import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:mockito/annotations.dart';
import 'package:fitness_app/features/exercises/data/repositories/exercise_repo_impl.dart';
import 'package:fitness_app/features/exercises/domain/entities/exercises_entity.dart';
import 'package:fitness_app/features/exercises/domain/entities/levels_prime_over_muscle_entity.dart';
import 'package:fitness_app/features/exercises/data/data_sources/contract/exercise_data_sources.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';

import 'exercise_repo_impl_test.mocks.dart';

@GenerateMocks([ExerciseDataSource])
void main() {
  provideDummy<DataResult<ExercisesEntity>>(Success(ExercisesEntity(exercises: [])));
  provideDummy<DataResult<LevelsPrimeMoverMuscleEntity>>(Success(LevelsPrimeMoverMuscleEntity(
    message: 'Success',
    totalLevels: 3,
    difficultyLevels: [],
  )));

  late ExerciseRepoImpl exerciseRepoImpl;
  late MockExerciseDataSource mockExerciseDataSource;

  setUp(() {
    mockExerciseDataSource = MockExerciseDataSource();
    exerciseRepoImpl = ExerciseRepoImpl(mockExerciseDataSource);
  });


  group('ExerciseRepoImpl', () {
    test('getExercises should return data from ExerciseDataSource', () async {
      final response = Success(ExercisesEntity(exercises: []));

      when(mockExerciseDataSource.getExercises(any, any))
          .thenAnswer((_) async => response);

      final result = await exerciseRepoImpl.getExercises('1', '2');

      expect(result, equals(response));
      verify(mockExerciseDataSource.getExercises('1', '2')).called(1);
    });

    test('getLevels should return data from ExerciseDataSource', () async {
      final response = Success(LevelsPrimeMoverMuscleEntity(
        message: 'Success',
        totalLevels: 3,
        difficultyLevels: [],
      ));

      when(mockExerciseDataSource.getLevels(any))
          .thenAnswer((_) async => response);

      final result = await exerciseRepoImpl.getLevels('1');

      expect(result, equals(response));
      verify(mockExerciseDataSource.getLevels('1')).called(1);
    });
  });
}
