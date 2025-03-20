import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/data/data_sources/online_data_sources/contracts/get_all_workouts_online_data_source.dart';
import 'package:fitness_app/features/workouts/data/repositories/workouts_repo_impl.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'workouts_repo_impl_test.mocks.dart';

@GenerateMocks([WorkoutsOnlineDataSource])
void main() {
  late MockWorkoutsOnlineDataSource mockWorkoutsOnlineDataSource;
  late WorkoutsRepoImpl workoutsRepoImpl;

  setUp(() {
    mockWorkoutsOnlineDataSource = MockWorkoutsOnlineDataSource();
    workoutsRepoImpl = WorkoutsRepoImpl(mockWorkoutsOnlineDataSource);
    provideDummy<DataResult<AllMusclesResponseEntity>>(
      Success(const AllMusclesResponseEntity(musclesGroup: [], message: '')),
    );
    provideDummy<DataResult<MusclesByIdResponseEntity>>(
      Success(const MusclesByIdResponseEntity(muscles: [], muscleGroup: MuscleGroupEntityById(id: '', name: ''), message: '')),
    );

  });

  group(
      'when calling getAllWorkouts, it should call WorkoutsOnlineDataSource',
          () {
        test(
            'when calling getAllWorkouts, it should fetch data from WorkoutsOnlineDataSource.getAllWorkouts',
                () async {
                  final allMuscleResponseEntity = const AllMusclesResponseEntity(
                    musclesGroup: [
                      MuscleGroupEntity(name: 'High Chest', id: '2'),
                    ], message: 'S',
                  );
              when(mockWorkoutsOnlineDataSource.getAllWorkouts()).thenAnswer(
                    (_) async => Success<AllMusclesResponseEntity>(allMuscleResponseEntity),
              );
              var result = await workoutsRepoImpl.getAllWorkouts();
              expect(result, isA<Success<AllMusclesResponseEntity>>());
              verify(mockWorkoutsOnlineDataSource.getAllWorkouts()).called(1);
            });

  test('when calling getAllWorkouts, it should fetch data from WorkoutsOnlineDataSource.getWorkoutsById', ()async{
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
              message: 'success'
          );
          when(mockWorkoutsOnlineDataSource.getWorkoutById('1')).thenAnswer(
                (_) async => Success<MusclesByIdResponseEntity>(musclesByIdResponseEntity),
          );
          var result = await workoutsRepoImpl.getWorkoutById( '1');
          expect(result, isA<Success<MusclesByIdResponseEntity>>());
          verify(mockWorkoutsOnlineDataSource.getWorkoutById('1')).called(1);
        });
  });
}
