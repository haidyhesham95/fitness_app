import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/exercises/domain/entities/exercises_entity.dart';
import 'package:fitness_app/features/exercises/domain/entities/levels_prime_over_muscle_entity.dart';
import 'package:fitness_app/features/exercises/domain/use_case/exercise_use_case.dart';
import 'package:fitness_app/features/exercises/domain/use_case/levels_prime_muscle_use_case.dart';
import 'package:fitness_app/features/exercises/presentation/viewModel/exercise_action.dart';
import 'package:fitness_app/features/exercises/presentation/viewModel/exercise_view_model_cubit.dart';
import 'package:fitness_app/features/exercises/presentation/viewModel/exercise_view_model_state.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'exercise_view_model_cubit_test.mocks.dart';


@GenerateMocks([ExerciseUseCase, LevelsPrimeMuscleUseCase])
void main() {
  late ExerciseViewModelCubit cubit;
  late MockExerciseUseCase mockExerciseUseCase;
  late MockLevelsPrimeMuscleUseCase mockLevelsPrimeMuscleUseCase;

  setUp(() {
    mockExerciseUseCase = MockExerciseUseCase();
    mockLevelsPrimeMuscleUseCase = MockLevelsPrimeMuscleUseCase();
    cubit = ExerciseViewModelCubit(
        mockExerciseUseCase, mockLevelsPrimeMuscleUseCase);
  });

  group('getExercises', () {
    final successResponse =
    Success<ExercisesEntity>(ExercisesEntity(exercises: []));
    final errorResponse =
    Fail<ExercisesEntity>(Exception('Error fetching exercises'));

    setUpAll(() {
      provideDummy<DataResult<ExercisesEntity>>(successResponse);
      provideDummy<DataResult<ExercisesEntity>>(errorResponse);
    });

    blocTest<ExerciseViewModelCubit, ExerciseViewModelState>(
      'emits [ExerciseViewModelLoading, ExerciseViewModelSuccess] when getExercises succeeds',
      build: () {
        when(mockExerciseUseCase.getExercises(any, any))
            .thenAnswer((_) async => successResponse);
        return cubit;
      },
      act: (cubit) => cubit.doAction(
          GetExercises(primeMoverMuscleId: '1', difficultyLevelId: '2')),
      expect: () => [
        isA<ExerciseViewModelLoading>(),
        isA<ExerciseViewModelSuccess>(),
      ],
      verify: (_) {
        verify(mockExerciseUseCase.getExercises('1', '2')).called(1);
      },
    );

    blocTest<ExerciseViewModelCubit, ExerciseViewModelState>(
      'emits [ExerciseViewModelLoading, ExerciseViewModelError] when getExercises fails',
      build: () {
        when(mockExerciseUseCase.getExercises(any, any))
            .thenAnswer((_) async => errorResponse);
        return cubit;
      },
      act: (cubit) => cubit.doAction(
          GetExercises(primeMoverMuscleId: '1', difficultyLevelId: '2')),
      expect: () => [
        isA<ExerciseViewModelLoading>(),
        isA<ExerciseViewModelError>(),
      ],
      verify: (_) {
        verify(mockExerciseUseCase.getExercises('1', '2')).called(1);
      },
    );
  });

  group('getLevels', () {
    final successResponse = Success<LevelsPrimeMoverMuscleEntity>(
        LevelsPrimeMoverMuscleEntity(
            message: 'Success', totalLevels: 3, difficultyLevels: []));
    final errorResponse =
    Fail<LevelsPrimeMoverMuscleEntity>(Exception('Error fetching levels'));

    setUpAll(() {
      provideDummy<DataResult<LevelsPrimeMoverMuscleEntity>>(successResponse);
      provideDummy<DataResult<LevelsPrimeMoverMuscleEntity>>(errorResponse);
    });

    blocTest<ExerciseViewModelCubit, ExerciseViewModelState>(
      'emits [ExerciseViewModelLoading, LevelsPrimeMoverMuscleSuccess] when getLevels succeeds',
      build: () {
        when(mockLevelsPrimeMuscleUseCase.getLevels(any))
            .thenAnswer((_) async => successResponse);
        return cubit;
      },
      act: (cubit) =>
          cubit.doAction(GetLevelsPrimeMoverMuscle(primeMoverMuscleId: '1')),
      expect: () => [
        isA<ExerciseViewModelLoading>(),
        isA<LevelsPrimeMoverMuscleSuccess>(),
      ],
      verify: (_) {
        verify(mockLevelsPrimeMuscleUseCase.getLevels('1')).called(1);
      },
    );

    blocTest<ExerciseViewModelCubit, ExerciseViewModelState>(
      'emits [ExerciseViewModelLoading, LevelsPrimeMoverMuscleError] when getLevels fails',
      build: () {
        when(mockLevelsPrimeMuscleUseCase.getLevels(any))
            .thenAnswer((_) async => errorResponse);
        return cubit;
      },
      act: (cubit) =>
          cubit.doAction(GetLevelsPrimeMoverMuscle(primeMoverMuscleId: '1')),
      expect: () => [
       isA<ExerciseViewModelLoading>(),
       isA<LevelsPrimeMoverMuscleError>(),
      ],
    );
  });
}