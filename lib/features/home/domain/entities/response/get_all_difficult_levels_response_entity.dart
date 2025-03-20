class GetAllDifficultLevelsResponseEntity {
  final List<GetAllDifficultLevelsResponseEntityLevels?>? levels;

  GetAllDifficultLevelsResponseEntity(this.levels);
}

class GetAllDifficultLevelsResponseEntityLevels {
  final String? id;
  final String? name;

  GetAllDifficultLevelsResponseEntityLevels(this.id, this.name);
}
