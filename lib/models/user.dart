//import 'dart:convert';

class User {
  final String email;
  final String role;
  final int ID;
  final int gymId;
  final int exp;

  const User({required this.email, required this.role,required this.ID, required this.gymId, required this.exp});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'], role: json['role'], ID: json['id'], gymId: json['gym_id'], exp: json['exp']);
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'role': role,
    'id': ID,
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
  final String address;
  final String role;
  final int gymId;

  const UserDto({ required this.ID,
                  required this.name,
                  required this.email,
                  required this.phone_number,
                  required this.gender,
                  required this.address,
                  required this.role,
                  required this.gymId});

  factory UserDto.fromJson(Map<String, dynamic> json) {
    return UserDto( ID: json['ID'],
                    name: json['name'],
                    email: json['email'],
                    phone_number: json['phone_number'],
                    gender: json['gender'],
                    address: json['address'],
                    role: json['role'],
                    gymId: json['gym_id']);
  }

  Map<String, dynamic> toJson() => {
    'ID': ID,
    'name': name,
    'email': email,
    'phone_number': phone_number,
    'gender': gender,
    'address': address,
    'role': role,
    'gym_id': gymId,
  };
}

class UserEditDto {
  final String name;
  final String email;
  final String phone_number;
  final String gender;
  final String address;


  const UserEditDto({
    required this.name,
    required this.email,
    required this.phone_number,
    required this.gender,
    required this.address,});

  factory UserEditDto.fromJson(Map<String, dynamic> json) {
    return UserEditDto(
        name: json['name'],
        email: json['email'],
        phone_number: json['phone_number'],
        gender: json['gender'],
        address: json['address']);
  }

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'phone_number': phone_number,
    'gender': gender,
    'address': address,
  };
}

class UserResDto {
  final int ID;
  final int trainerID;

  const UserResDto({ required this.ID, required this.trainerID});

  factory UserResDto.fromJson(Map<String, dynamic> json) {
    return UserResDto( ID: json['UserID'], trainerID: json['TrainerID'],);
  }

  Map<String, dynamic> toJson() => {
    'UserID': ID,
    'TrainerID': trainerID
  };
}