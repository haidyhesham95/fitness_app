import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/repositories/workouts_repo.dart';
import 'package:fitness_app/features/workouts/domain/use_cases/get_workout_by_id.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_workout_by_id_test.mocks.dart';

@GenerateMocks([WorkoutsRepo])
void main() {
  late MockWorkoutsRepo mockWorkoutsRepo;
  late GetWorkoutsByIdUseCase useCase;
  setUp(() {
    mockWorkoutsRepo = MockWorkoutsRepo();
    useCase = GetWorkoutsByIdUseCase(mockWorkoutsRepo);
    provideDummy<DataResult<MusclesByIdResponseEntity>>(
      Success(const MusclesByIdResponseEntity()),
    );
  });
  test(
      'when call (get muscles by id) method it should get it from getWorkoutsRepo.getWorkoutsById',
      () async {
    final musclesByIdResponseEntity = const MusclesByIdResponseEntity(
        muscleGroup: MuscleGroupEntityById(
          name: 'Abdominals',
          id: '10',
        ),
        muscles: [
          MuscleEntity(
            id: '10',
            name: 'Back',
            image: Assets.imagesEditBg,
          ),
        ],
        message: 'success');
    when(mockWorkoutsRepo.getWorkoutById('1'))
        .thenAnswer((_) async => Success(musclesByIdResponseEntity));
    final result = await useCase.getWorkoutById('1');
    expect(result, isA<Success<MusclesByIdResponseEntity>>());
    verify(mockWorkoutsRepo.getWorkoutById('1')).called(1);
  });
}
=======
}
>>>>>>> origin/feature/POW-24-Home
