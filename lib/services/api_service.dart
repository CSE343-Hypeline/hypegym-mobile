import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:hypegym/helpers/constants.dart';
import 'package:hypegym/models/exercise.dart';
import 'package:hypegym/models/program.dart';
import 'package:hypegym/models/user.dart';


class ApiService {

  final storage = const FlutterSecureStorage();

  Future<String> get tokenOrEmpty async {
    var token = await storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  Future<UserDto?> get userOrEmpty async {
    var user = await UserDto.fromJson(jsonDecode(await storage.read(key: "user") as String));
    if (user == null) return null;
    return user;
  }

  Future<Response?> getMe() async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      print(token.toString());
      Response response = await get(
          Uri.parse('${Constants.baseUrl}/api/me'), headers: requestHeaders);
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<Response?> addUser(String name, String email, String password, String phoneNumber, String gender,String address, int gymID, String role) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      Map data = {
        'name': name,
        'email': email,
        'password': password,
        'phone_number': phoneNumber,
        'address': address,
        'gym_id': gymID,
        'role': role,
        'gender': gender,
      };
      print(token.toString());
      Response response = await post(
          Uri.parse('${Constants.baseUrl}/api/user'),
          headers: requestHeaders,
          body: json.encode(data)
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<Response?> editUser(int ID,String name, String email, String phoneNumber, String gender,String address) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      Map data = {
        'name': name,
        'email': email,
        'phone_number': phoneNumber,
        'address': address,
        'gender': gender,
      };
      print(token.toString());
      Response response = await put(
          Uri.parse('${Constants.baseUrl}/api/user/$ID'),
          headers: requestHeaders,
          body: json.encode(data)
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<Response?> deleteUser(int user_id) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      print(token.toString());
      Response response = await delete(
        Uri.parse('${Constants.baseUrl}/api/user/$user_id'),
        headers: requestHeaders,
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<Response?> getUser(int user_id) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      print(token.toString());
      Response response = await get(
        Uri.parse('${Constants.baseUrl}/api/user/$user_id'),
        headers: requestHeaders,
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<List<UserDto>> fetchMembers() async {
    String token = await tokenOrEmpty;
    var user = await userOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };
    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/users/members/${user!.gymId}'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      final List result = json.decode(response.body);
      return result.map((e) => UserDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<UserDto>> fetchTrainers() async {
    String token = await tokenOrEmpty;
    var user = await userOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };

    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/users/pts/${user!.gymId}'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      final List result = json.decode(response.body);
      return result.map((e) => UserDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<UserDto>> getTrainers(int gym_id) async {
    String token = await tokenOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };

    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/users/pts/$gym_id'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      final List result = json.decode(response.body);
      return result.map((e) => UserDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Response?> assignPT(int member_id,int pt_id) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      print(token.toString());
      Map data = {
        'user_id': member_id,
      };
      print(token.toString());
      Response response = await post(
          Uri.parse('${Constants.baseUrl}/api/pt/${pt_id}/assign-member'),
          headers: requestHeaders,
          body: json.encode(data)
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<List<UserDto>> getMembers(int pt_id) async {
    String token = await tokenOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };

    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/pt/${pt_id}/members'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {

      print(response.body.toString());
      final List result = json.decode(response.body)['members'];
      List<UserResDto> members = result.map((e) => UserResDto.fromJson(e)).toList();
      print(members);
      List<UserDto> memberlist = [];
      for(int i = 0; i<members.length ;i++){
        var res = await getUser(members[i].ID);
        var user = UserDto.fromJson(jsonDecode(res!.body));
        memberlist.add(user);
      }
      print("memberlist ->");print(memberlist);
      return memberlist;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Response?> dismissMember(int member_id,int pt_id) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      Map data = {
        'user_id': member_id,
      };
      print(token.toString());
      Response response = await delete(
        Uri.parse('${Constants.baseUrl}/api/pt/$pt_id/dismiss-member'),
        headers: requestHeaders,
        body: json.encode(data)
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<Response?> checkIn(int id,int gym_id) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      print(token.toString());
      Response response = await post(
          Uri.parse('${Constants.baseUrl}/api/member/$id/checkIn/$gym_id'),
          headers: requestHeaders
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }
  Future<Response?> checkOut(int id,int gym_id) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      print(token.toString());
      Response response = await post(
          Uri.parse('${Constants.baseUrl}/api/member/$id/checkOut/$gym_id'),
          headers: requestHeaders
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<Response?> assignProgram(int member_id,Program exercise) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      print(token.toString());
      Map data = {
        "exercise_id": exercise.exercise_id,
        "set": exercise.set,
        "repetition": exercise.rep
      };
      print(token.toString());
      Response response = await post(
          Uri.parse('${Constants.baseUrl}/api/member/assign-program/$member_id'),
          headers: requestHeaders,
          body: json.encode(data)
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<Response?> assignPrograms(int member_id,List<Program> exercises) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      print(token.toString());

      print(token.toString());
      Response response = await post(
          Uri.parse('${Constants.baseUrl}/api/member/assign-programs/$member_id'),
          headers: requestHeaders,
          body: json.encode(exercises)
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<List<ProgramDto>> getPrograms(int member_id) async {
    String token = await tokenOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };

    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/member/programs/$member_id'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {

      print(response.body.toString());
      final List result = json.decode(response.body)['programs'];
      return result.map((e) => ProgramDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Response?> dismissProgram(int member_id,int program_id) async {
    try{
      String token = await tokenOrEmpty;
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Cookie': 'Authorization=$token'
      };
      Map data = {
        'program_id': program_id,
      };
      print(token.toString());
      Response response = await delete(
          Uri.parse('${Constants.baseUrl}/api/member/dismiss-program/$member_id'),
          headers: requestHeaders,
          body: json.encode(data)
      );
      print(response.toString());
      return response;
    }catch(e){
      print(e.toString());
    }
    return null;
  }

  Future<List<ExerciseResDto>> getAllExercises() async {
    String token = await tokenOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };
    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/exercises'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      final List result = json.decode(response.body);
      return result.map((e) => ExerciseResDto.fromJson(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Exercise> getExercise(int exercise_id) async {
    String token = await tokenOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };
    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/exercise/$exercise_id'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      var result = json.decode(response.body);
      return Exercise.fromJson(result);
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<int>> getOnlines() async {
    String token = await tokenOrEmpty;
    var user = await userOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };
    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/gym/${user!.gymId}/online'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      final List result = json.decode(response.body)['online_user_ids'];
      return result.map((e) => int.parse(e)).toList();
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<int>> getDailyAttendance() async {
    String token = await tokenOrEmpty;
    var user = await userOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };
    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/gym/${user!.gymId}/attendance/day'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      List<int> attendance = [];
      attendance.add(int.parse(json.decode(response.body)['attendance_count_female']));
      attendance.add(int.parse(json.decode(response.body)['attendance_count_male']));
      attendance.add(int.parse(json.decode(response.body)['attendance_count_other']));
      return attendance;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<int>> getMonthlyAttendance() async {
    String token = await tokenOrEmpty;
    var user = await userOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };
    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/gym/${user!.gymId}/attendance/month'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      List<int> attendance = [];
      attendance.add(int.parse(json.decode(response.body)['attendance_count_female']));
      attendance.add(int.parse(json.decode(response.body)['attendance_count_male']));
      attendance.add(int.parse(json.decode(response.body)['attendance_count_other']));
      return attendance;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<Response> getTrainer(int member_id) async {
    String token = await tokenOrEmpty;
    var user = await userOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };
    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/member/get-trainer-of/${member_id}'),
        headers: requestHeaders
    );

    if (response.statusCode == 200) {
      print(response.body.toString());
      return response;
    } else {
      throw Exception('Failed to load data');
    }
  }

}