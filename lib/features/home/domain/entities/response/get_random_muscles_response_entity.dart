class GetRandomMusclesResponseEntity {
  final List<GetRandomMusclesResponseEntityMuscles?>? muscles;

  GetRandomMusclesResponseEntity(this.muscles);
}

class GetRandomMusclesResponseEntityMuscles {
  final String? id;
  final String? name;
  final String? image;

  GetRandomMusclesResponseEntityMuscles(this.id, this.name, this.image);
}
