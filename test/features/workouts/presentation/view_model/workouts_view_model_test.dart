import 'package:bloc_test/bloc_test.dart';
import 'package:fitness_app/core/networking/common/api_result.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_by_id_entity.dart';
import 'package:fitness_app/features/workouts/domain/entities/response/get_all_workouts_entity.dart';
import 'package:fitness_app/features/workouts/domain/use_cases/get_workout_by_id.dart';
import 'package:fitness_app/features/workouts/domain/use_cases/workouts_use_case.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_actions.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_states.dart';
import 'package:fitness_app/features/workouts/presentation/view_model/workouts_view_model.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'workouts_view_model_test.mocks.dart';
@GenerateMocks([WorkoutsUseCase,GetWorkoutsByIdUseCase])
void main() {
   late MockWorkoutsUseCase mockWorkoutsUseCase;
   late MockGetWorkoutsByIdUseCase mockGetWorkoutsByIdUseCase;
   late WorkoutsViewModelCubit workoutsViewModelCubit;
   final allMuscleResponseEntity = const AllMusclesResponseEntity(
      message: ' success',
     musclesGroup: [
       MuscleGroupEntity(name: 'High Chest', id: '2'),
     ],
   );
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

   setUp((){
     mockWorkoutsUseCase = MockWorkoutsUseCase();
     mockGetWorkoutsByIdUseCase = MockGetWorkoutsByIdUseCase();
     workoutsViewModelCubit = WorkoutsViewModelCubit(mockWorkoutsUseCase, mockGetWorkoutsByIdUseCase);
     provideDummy<DataResult<AllMusclesResponseEntity>>(Success(allMuscleResponseEntity));
     provideDummy<DataResult<MusclesByIdResponseEntity>>(Success(musclesByIdResponseEntity));
   });

   group('when call doAction function it should call getAllWorkouts and getWorkoutsById from useCases and change state with the right and left sequences ', (){
    // test get all muscles success
     blocTest<WorkoutsViewModelCubit, WorkoutsViewModelState>(
       'when call doAction function it should call getAllWorkouts from useCase and change state with the right sequence',
       build: () {
         var mockedResult = Success<AllMusclesResponseEntity>(
           allMuscleResponseEntity,
         );
         when(mockWorkoutsUseCase.getAllWorkouts()).thenAnswer((_) async => mockedResult);
         return workoutsViewModelCubit;
       },
       act: (workoutsViewModelCubit) => workoutsViewModelCubit.doAction(GetAllWorkouts()),
       expect: () => [
         isA<GetAllWorkoutsLoading>(),
         isA<GetAllWorkoutsSuccess>(),
       ],
       verify: (_) {
         verify(mockWorkoutsUseCase.getAllWorkouts()).called(1);
       },
     );
// test get all muscle by id success
   blocTest<WorkoutsViewModelCubit, WorkoutsViewModelState>(
       'when call doAction function it should call login from useCase and change state with the right sequence',
       build: () {
         var mockedResult = Success<MusclesByIdResponseEntity>(
           musclesByIdResponseEntity,
         );
         when(mockGetWorkoutsByIdUseCase.getWorkoutById('1')).thenAnswer((_) async => mockedResult);
         return workoutsViewModelCubit;
       },
       act: (workoutsViewModelCubit) => workoutsViewModelCubit.doAction(GetWorkoutsById('1')),
       expect: () => [
         isA<GetWorkoutsByIdLoading>(),
         isA<GetWorkoutsByIdSuccess>(),
       ],
       verify: (_) {
         verify(mockGetWorkoutsByIdUseCase.getWorkoutById('1')).called(1);
       },
     );
   });
   // test get all muscles fail
   blocTest<WorkoutsViewModelCubit, WorkoutsViewModelState>(
     'when call doAction function  returns fail  it should emit Error state ',
     build: () {
       var mockedResult = Fail<AllMusclesResponseEntity>(Exception('Invalid credentials'));

       when(mockWorkoutsUseCase.getAllWorkouts()).thenAnswer((_) async => mockedResult);
       return workoutsViewModelCubit;
     },
     act: (workoutsViewModelCubit) => workoutsViewModelCubit.doAction(GetAllWorkouts()),
     expect: () => [
       isA<GetAllWorkoutsLoading>(),
       isA<GetAllWorkoutsError>(),
     ],
     verify: (_) {
       verify(mockWorkoutsUseCase.getAllWorkouts()).called(1);
     },
   );

   // test get all muscles by id fail
   blocTest<WorkoutsViewModelCubit, WorkoutsViewModelState>(
     'when call doAction function returns fail, it should emit Error state',
     build: () {
       var mockedResult = Fail<MusclesByIdResponseEntity>(Exception('Invalid credentials'));

       when(mockGetWorkoutsByIdUseCase.getWorkoutById('1'))
           .thenAnswer((_) async => mockedResult);

       return workoutsViewModelCubit;
     },
     act: (workoutsViewModelCubit) => workoutsViewModelCubit.doAction(GetWorkoutsById('1')),
     expect: () => [
       isA<GetWorkoutsByIdLoading>(),
       isA<GetWorkoutsByIdError>(),
     ],
     verify: (_) {
       verify(mockGetWorkoutsByIdUseCase.getWorkoutById('1')).called(1);
     },
   );

}