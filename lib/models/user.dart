//import 'dart:convert';

class User {
  final String email;
  final String role;
  final int gymId;
  final int exp;

  const User({required this.email, required this.role, required this.gymId, required this.exp});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'], role: json['role'], gymId: json['gym_id'], exp: json['exp']);
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'role': role,
    'gym_id': gymId,
    'exp': exp,
  };
}

class UserDto {
  final int ID;
  final String email;
  final String role;
  final int gymId;

  const UserDto({required this.ID, required this.email, required this.role, required this.gymId});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto(
        ID: json['ID'], email: json['email'], role: json['role'], gymId: json['gym_id']);
  }

  Map<String, dynamic> toJson() => {
    'ID': ID,
    'email': email,
    'role': role,
    'gym_id': gymId,
  };
}