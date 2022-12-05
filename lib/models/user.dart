//import 'dart:convert';

class User {
  final String email;
  final String roles;
  final int exp;
  //final int gymId;

  const User({required this.email, required this.roles, required this.exp/*, required this.gymId*/});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      email: json['email'], roles: json['roles'], exp: json['exp'], /*gymId: json['exp']*/);
  }

  Map<String, dynamic> toJson() => {
    'email': email,
    'roles': roles,
    'exp': exp,
    //'gymId': gymId,
  };
}