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
    required this.address});

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
    'address': address
  };
}

class MemberResDto {
  final int id;
  final int user_id;
  final int trainer_id;
  final List<int>? programs;

  const MemberResDto({  required this.id,
                        required this.user_id,
                        required this.trainer_id,
                        required this.programs});

  factory MemberResDto.fromJson(Map<String, dynamic> json) {
    return MemberResDto(  id: json['id'],
                        user_id: json['user_id'],
                        trainer_id: json['trainer_id'],
                        programs: json['programs'],);
  }

  Map<String, dynamic> toJson() => {
    'id': id,
    'user_id': user_id,
    'trainer_id': trainer_id,
    'programs': programs,
  };
}