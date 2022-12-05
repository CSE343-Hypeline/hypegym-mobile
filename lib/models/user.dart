//import 'dart:convert';

class User {
  final String email;
  final String roles;
  final int gymId;
  final int exp;

  const User({required this.email, required this.roles, required this.gymId, required this.exp});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        email: json['email'], roles: json['roles'], gymId: json['gym_id'], exp: json['exp']);
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'roles': roles,
    'gym_id': gymId,
    'exp': exp,
  };
}