import 'dart:convert';
//import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:hypegym/helpers/constants.dart';
//import 'package:http/http.dart' as http;
//import 'dart:io';
//import 'package:hypegym/pages/admin_gym_page.dart';


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