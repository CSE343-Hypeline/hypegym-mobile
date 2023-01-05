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
  final String name;
  final String email;
  final String phone_number;
  final String gender;
  final String adress;
  final String role;
  final int gymId;

  const UserDto({ required this.ID,
                  required this.name,
                  required this.email,
                  required this.phone_number,
                  required this.gender,
                  required this.adress,
                  required this.role,
                  required this.gymId});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto( ID: json['ID'],
                    name: json['name'],
                    email: json['email'],
                    phone_number: json['phone_number'],
                    gender: json['gender'],
                    adress: json['address'],
                    role: json['role'],
                    gymId: json['gym_id']);
  }

  Map<String, dynamic> toJson() => {
    'ID': ID,
    'name': name,
    'email': email,
    'phone_number': phone_number,
    'gender': gender,
    'adress': adress,
    'role': role,
    'gym_id': gymId,
  };
}