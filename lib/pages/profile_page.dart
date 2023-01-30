import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hypegym/models/user.dart';
import 'package:hypegym/pages/edit_profile_page.dart';
//import 'package:hypegym/pages/edit_profile_page.dart';
import 'package:hypegym/pages/login_page.dart';
import 'package:hypegym/services/api_service.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {

  final ApiService apiService = ApiService();
  final storage = const FlutterSecureStorage();
  late final UserDto user;
  late final UserDto profile;

  Future<UserDto> temp() async {
    var res = await apiService.getMe() ;
    profile = UserDto.fromJson(jsonDecode(res!.body));
    return profile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
            ),
          ),
          FutureBuilder(
              future: temp(),
              builder: (context,snapshot) {
                if (snapshot.hasData) {
                  return ListView(
                    physics: const BouncingScrollPhysics(),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {
                              storage.deleteAll();
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                            },
                            icon: Icon(
                              Icons.logout,
                              color: Colors.greenAccent.shade400,
                              size: 24,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 30.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "PROFILE",
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                                color: Colors.greenAccent.shade400,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Text(
                            "Name",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent.shade400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            snapshot.data!.name,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Email",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent.shade400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            snapshot.data!.email,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Phone",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent.shade400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            snapshot.data!.phone_number,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Address",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent.shade400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            snapshot.data!.address,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 24),
                          Text(
                            "Gender",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.greenAccent.shade400,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            snapshot.data!.gender,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 35),
                          ElevatedButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EditProfilePage(snapshot.data)));
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.greenAccent.shade700,
                              minimumSize: const Size(150, 30),
                              maximumSize: const Size(150, 30),
                            ),
                            child: const Text(
                              "Edit Profile",
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  );
                } else if (snapshot.hasError) {
                  return Text('${snapshot.error}');
                }
                return const CircularProgressIndicator();
              }
          ),
        ],
      ),
    );
  }
}

