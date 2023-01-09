import 'package:hypegym/models/exercise.dart';

class Program {
  final int exercise_id;
  final int set;
  final int rep;

  const Program({required this.exercise_id, required this.set,required this.rep});

  factory Program.fromJson(Map<String, dynamic> json) {
    return Program(
        exercise_id: json['exercise_id'],
        set: json['set'],
        rep: json['repetition']);
  }

  Map<String, dynamic> toJson() => {
    "exercise_id": exercise_id,
    "set": set,
    "repetition": rep
  };
}

class ProgramDto {
  final int id;
  final int exercise_id;
  final int set;
  final int rep;

  const ProgramDto({required this.id,required this.exercise_id, required this.set,required this.rep});

  factory ProgramDto.fromJson(Map<String, dynamic> json) {
    return ProgramDto(
        id: json['id'],
        exercise_id: json['exercise_id'],
        set: json['set'],
        rep: json['repetition']);
  }

  Map<String, dynamic> toJson() => {
    "id": id,
    "exercise_id": exercise_id,
    "set": set,
    "repetition": rep
  };
}

class ProgramListDto {
  final int id;
  final int exercise_id;
  final Exercise exercise;
  final int set;
  final int rep;


  const ProgramListDto({  required this.id,
                          required this.exercise_id,
                          required this.exercise,
                          required this.set,
                          required this.rep});

  factory ProgramListDto.fromJson(Map<String, dynamic> json) {
    return ProgramListDto(
        id: json['id'],
        exercise_id: json['exercise_id'],
        exercise: Exercise.fromJson(json['exercise']),
        set: json['set'],
        rep: json['repetition']);
  }
  Map<String, dynamic> toJson() => {
    "id": id,
    "exercise_id": exercise_id,
    "exercise": exercise,
    "set": set,
    "repetition": rep
  };
}