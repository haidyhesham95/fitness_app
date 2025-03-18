import 'package:fitness_app/core/networking/api/api_manager.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/data/data_sources/online_data_sources/impl/get_all_workouts_online_data_source_impl.dart';
import 'package:fitness_app/features/workouts/data/models/response/get_all_workout_by_id_dto.dart';
import 'package:fitness_app/features/workouts/data/models/response/workouts_response_dto.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import '../../../../../auth/data/contracts/auth_online_data_source_test.mocks.dart';

@GenerateMocks([ApiManager])
void main() {
  late MockApiManager mockApiManager;
  late WorkoutsOnlineDataSourceImpl workoutsOnlineDataSourceImpl;

  setUp(() {
    mockApiManager = MockApiManager();
    workoutsOnlineDataSourceImpl = WorkoutsOnlineDataSourceImpl(mockApiManager);
  });

  group('getAllWorkouts and getWorkoutById tests', () {

    test('getAllWorkouts should return data from ApiManager', () async {
      final workoutsResponseDto = WorkoutsResponseDto(
        message: 'Success',
        musclesGroup: [
          MusclesGroup(name: 'High Chest', Id: '1'),
        ],
      );

      when(mockApiManager.getAllWorkouts()).thenAnswer(
            (_) async => workoutsResponseDto,
      );
      var result = await workoutsOnlineDataSourceImpl.getAllWorkouts();
      expect(result, isA<Success<AllMusclesResponseEntity>>());
      verify(mockApiManager.getAllWorkouts()).called(1);
    });

    test('getWorkoutById should return data from ApiManager', () async {
      final getAllWorkoutsBuIdDto = GetAllWorkoutsByIdDto(
        message: 'Success',
        muscleGroup: MuscleGroup(name: 'High Chest', Id: '1'),
        muscles: [
          Muscles(Id: '2', name: 'Abdominals', image: Assets.imagesEditBg),
        ],
      );

      when(mockApiManager.getWorkoutsById()).thenAnswer(
            (_) async => getAllWorkoutsBuIdDto,
      );
      var result = await workoutsOnlineDataSourceImpl.getWorkoutById();
      expect(result, isA<Success<MusclesByIdResponseEntity>>());
      verify(mockApiManager.getWorkoutsById()).called(1);
    });
  });
}
