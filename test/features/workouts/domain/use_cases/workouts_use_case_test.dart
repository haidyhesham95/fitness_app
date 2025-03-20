import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/domain/repositories/workouts_repo.dart';
import 'package:fitness_app/features/workouts/domain/use_cases/workouts_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'get_workout_by_id_test.mocks.dart';
@GenerateMocks([WorkoutsRepo])
void main() {
  late MockWorkoutsRepo mockWorkoutsRepo;
  late WorkoutsUseCase useCase;
  setUp((){
    mockWorkoutsRepo =MockWorkoutsRepo();
    useCase = WorkoutsUseCase(mockWorkoutsRepo);
    provideDummy<DataResult<AllMusclesResponseEntity>>(
      Success(const AllMusclesResponseEntity(message: '', musclesGroup: [

      ])),
    );
  });

  test('when call (get all muscles) method it should get it from workoutsRepo.getAllWorkouts', ()async {
    final allMuscleResponseEntity = const AllMusclesResponseEntity(
      musclesGroup: [
        MuscleGroupEntity(name: 'High Chest', id: '2'),
      ], message: 'success',
    );
    when(mockWorkoutsRepo.getAllWorkouts()).thenAnswer((_) async=> Success(allMuscleResponseEntity),);
    final result = await useCase.getAllWorkouts();
    expect(result, isA<Success<AllMusclesResponseEntity>>());
    verify(mockWorkoutsRepo.getAllWorkouts()).called(1);
  });
}