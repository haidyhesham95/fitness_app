import 'package:fitness_app/core/networking/api/api_manager.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/exercises/data/data_sources/impl/exercise_data_source_impl.dart';
import 'package:fitness_app/features/exercises/data/model/exercises_response_dto.dart';
import 'package:fitness_app/features/exercises/data/model/levels_prime_over_muscle_dto.dart';
import 'package:fitness_app/features/exercises/domain/entities/exercises_entity.dart';
import 'package:fitness_app/features/exercises/domain/entities/levels_prime_over_muscle_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../auth/data/contracts/auth_online_data_source_test.mocks.dart';
@GenerateMocks([ApiManager])

void main() {
  late ExerciseDataSourceImpl exerciseDataSourceImpl;
  late MockApiManager mockApiManager;

  setUp(() {
    mockApiManager = MockApiManager();
    exerciseDataSourceImpl = ExerciseDataSourceImpl(mockApiManager);
  });
  group('getExercises and getLevels tests', () {

    test('getExercises should return data from ApiManager', () async {
      final response = ExercisesResponseDto(message: 'Success', exercises: []);
      when(mockApiManager.getExercises(primeMoverMuscleId: anyNamed('primeMoverMuscleId'), difficultyLevelId: anyNamed('difficultyLevelId'))).thenAnswer((_) async => response);
      var result = await exerciseDataSourceImpl.getExercises('1','2');
      expect(result, isA<Success<ExercisesEntity>>());
      verify(mockApiManager.getExercises(primeMoverMuscleId: anyNamed('primeMoverMuscleId'), difficultyLevelId: anyNamed('difficultyLevelId'))).called(1);
    });
  });

  test('getLevels should return data from ApiManager', () async {
    final response = LevelsPrimeOverMuscleDto(message: 'Success', difficultyLevels: []);
    when(mockApiManager.getDifficultyLevelsByPrimeMoverMuscle(primeMoverMuscleId: anyNamed('primeMoverMuscleId'))).thenAnswer((_) async => response);
    var result = await exerciseDataSourceImpl.getLevels('1');
    expect(result, isA<Success<LevelsPrimeMoverMuscleEntity>>());
    verify(mockApiManager.getDifficultyLevelsByPrimeMoverMuscle(primeMoverMuscleId: anyNamed('primeMoverMuscleId'))).called(1);
  });


  }