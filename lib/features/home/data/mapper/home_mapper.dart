import '../../domain/entities/response/get_random_muscles_response_entity.dart';
import '../models/response/get_random_muscles_response_dto.dart';

class HomeMapper {
  static GetRandomMusclesResponseEntity mapRandomMusclesToEntity(
      GetRandomMusclesResponseDto dto) {
    return GetRandomMusclesResponseEntity(
      dto.muscles
          ?.map((muscle) => muscle == null
              ? null
              : GetRandomMusclesResponseEntityMuscles(
                  muscle.id, muscle.name, muscle.image))
          .toList(),
    );
  }
}
