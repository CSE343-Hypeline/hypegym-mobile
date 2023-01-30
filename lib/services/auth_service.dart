import 'dart:convert';
import 'package:http/http.dart';
import 'package:hypegym/helpers/constants.dart';

class AuthService {
  var loginUri = Uri.parse('${Constants.baseUrl}/login');

  Future<Response?> login(String email, String password) async {
    Map data = {
      'email': email,
      'password': password,
    };
    try{
      Response response = await post(
          Uri.parse('${Constants.baseUrl}/login'),
          body: json.encode(data)
      );
      return response;
    }catch(e){
      print(e.toString());
    }
  }
}