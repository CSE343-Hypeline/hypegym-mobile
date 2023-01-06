import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hypegym/models/user.dart';
import 'package:hypegym/pages/admin_gym_page.dart';
import 'package:hypegym/pages/trainer_gym_page.dart';
import 'package:hypegym/pages/welcome_page.dart';
import 'package:hypegym/services/api_service.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final ApiService apiService = ApiService();
  const storage = FlutterSecureStorage();
  var status = await storage.read(key: 'token');
  var resMe = await apiService.getMe();
  if(status != null){
      switch (resMe!.statusCode) {
        case 200:
          final User user = User.fromJson(jsonDecode(resMe.body));
          storage.write(key: "user", value: resMe.body);
          if(user.role == "SUPERADMIN"){
            runApp(const MyApp(2));
          } else if(user.role == "PT"){
            runApp(const MyApp(3));
          } else if(user.role == "MEMBER"){
            runApp(const MyApp(4));
          }
          break;
        case 401:
          runApp(const MyApp(1));
          break;
        default:
          runApp(const MyApp(1));
          break;
      }
  }else{
    runApp(const MyApp(1));
  }

}

class MyApp extends StatelessWidget {
  const MyApp(this.direct,{super.key});
  final int direct;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HypeGym',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: directpage(direct),

    );
  }
}

directpage(int direct){
  print(direct);
  switch (direct){
    case 1:  return const WelcomePage();
    case 2:  return const AdminGymPage();
    case 3:  return const WelcomePage();
    case 4:  return const AdminGymPage();
    default: return const WelcomePage();
  };
}