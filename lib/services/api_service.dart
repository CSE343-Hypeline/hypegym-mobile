import 'dart:convert';

import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:http/http.dart';
import 'package:hypegym/helpers/constants.dart';
import 'package:hypegym/models/user.dart';


class ApiService {

  final storage = const FlutterSecureStorage();

  Future<String> get tokenOrEmpty async {
    var token = await storage.read(key: "token");
    if (token == null) return "";
    return token;
  }

  Future<Response?> getMyProfile() async {
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

  Future<List<UserDto>> fetchMembers(int gym_id) async {
    String token = await tokenOrEmpty;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Cookie': 'Authorization=$token'
    };

    final response = await get(
        Uri.parse('${Constants.baseUrl}/api/users/members/$gym_id'),
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

  Future<List<UserDto>> fetchTrainers(int gym_id) async {
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
        Uri.parse('${Constants.baseUrl}/api/pt/${pt_id}/members)'),
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

/*
  Future<Response> getMyProfile() async {
    var myProfileUri = Uri.parse('${Constants.baseUrl}/auth/user/me');
    final res = await client.get(myProfileUri);
    return res;
  }
 */
/*
  Future<Response> getUserList() async {
    var userUrl = Uri.parse('${Constants.baseUrl}/users');
    final res = await client.get(userUrl);
    return res;
  }

  Future<Response> getUserById(String id) async {
    var userUrl = Uri.parse('${Constants.baseUrl}/users/$id');
    final res = await client.get(userUrl);
    return res;
  }

  Future<Response> addUser(int roleId, String email, String password,
      String fullName, String phone) async {
    var userUrl = Uri.parse('${Constants.baseUrl}/users');
    final res = await client.post(userUrl, body: {
      "email": email,
      "password": password,
      "fullName": fullName,
      "phone": phone
    });
    return res;
  }

  Future<Response> updateUser(
      int? id, String email, String fullName, String phone) async {
    var userUrl = Uri.parse('${Constants.baseUrl}/users/$id');
    final res = await client.put(userUrl, body: {
      "email": email,
      "fullName": fullName,
      "phone": phone
    });
    return res;
  }

  Future<Response> deleteUser(String id) async {
    var userUrl = Uri.parse('${Constants.baseUrl}/users/$id');
    final res = await client.delete(userUrl);
    return res;
  }
   */
}