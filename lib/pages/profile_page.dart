import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hypegym/models/user.dart';
//import 'package:hypegym/pages/edit_profile_page.dart';
import 'package:hypegym/pages/login_page.dart';
import 'package:hypegym/services/api_service.dart';

class ProfiePage extends StatefulWidget {
  const ProfiePage({Key? key}) : super(key: key);

  @override
  State<ProfiePage> createState() => _ProfiePageState();
}

class _ProfiePageState extends State<ProfiePage> {
  final ApiService apiService = ApiService();
  final storage = const FlutterSecureStorage();
  late final User user;
  late final UserDto profile;

  Future<UserDto> temp() async {
    user = User.fromJson(jsonDecode(await storage.read(key: "user") as String));
    var res = await apiService.getUser(user.ID) ;
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
                              storage.delete(key: "token");
                              storage.delete(key: "user");
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
                            snapshot.data?.name as String,
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
                            snapshot.data?.email as String,
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
                            snapshot.data?.phone_number as String,
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
                            snapshot.data?.adress as String,
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
                            snapshot.data?.gender as String,
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 35),
                          ElevatedButton(
                            onPressed: (){
                              //Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfilePage()));
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

