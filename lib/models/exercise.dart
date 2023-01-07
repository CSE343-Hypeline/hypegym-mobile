class Exercise {
  final int id;
  final String name;
  final String level;
  final String equipment;
  final List<String> instructions;

  const Exercise({required this.id, required this.name,required this.level,required this.equipment,required this.instructions});

  factory Exercise.fromJson(Map<String, dynamic> json) {
    return Exercise(
          id: json['id'],
          name: json['name'],
          level: json['level'],
          equipment: json['equipment'],
          instructions: json['instructions']);
  }

  Map<String, dynamic> toJson() => {
      "id": 5,
      "name": name,
      "level": level,
      "equipment": equipment,
      "instructions": instructions
  };
}

class ExerciseResDto {
  final int id;
  final String name;

  const ExerciseResDto({required this.id, required this.name});

  factory ExerciseResDto.fromJson(Map<String, dynamic> json) {
    return ExerciseResDto(
        id: json['ID'],
        name: json['name']);
  }

  Map<String, dynamic> toJson() => {
    "ID": id,
    "name": name,
  };
}

