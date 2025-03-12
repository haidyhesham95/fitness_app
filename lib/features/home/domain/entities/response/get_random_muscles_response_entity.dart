class GetRandomMusclesResponseDto {
  final List<GetRandomMusclesResponseDtoMuscles?>? muscles;

  GetRandomMusclesResponseDto(this.muscles);
}

class GetRandomMusclesResponseDtoMuscles {
  final String? id;
  final String? name;
  final String? image;

  GetRandomMusclesResponseDtoMuscles(this.id, this.name, this.image);
}
