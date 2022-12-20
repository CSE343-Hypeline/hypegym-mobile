import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hypegym/models/user.dart';
import 'package:hypegym/pages/admin_gym_page.dart';
import 'package:hypegym/pages/trainer_gym_page.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/services/auth_service.dart';

import 'member_gym_page.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final GlobalKey<FormState> _formKey = GlobalKey();
  final AuthService authService = AuthService();
  final ApiService apiService = ApiService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final storage = const FlutterSecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image(
            image: const AssetImage('images/image_2.jpg'),
            fit: BoxFit.cover,
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
          ),
          SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                            size: 35.0,
                          ),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, right: 10.0),
                        child: Text(
                          'HYPEGYM',
                          style: TextStyle(
                            backgroundColor: Colors.black,
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent.shade400,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 320,),
                  TextFormField(
                    controller: _emailController,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return 'First Name must contain at least 3 characters';
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {},
                    autocorrect: true,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.red),
                      fillColor: Colors.black54,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                            color: Colors.greenAccent.shade400, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: Colors.greenAccent.shade400, width: 1),
                      ),
                      labelText: 'Email',
                      hintText: 'Email',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Icon(
                          Icons.email,
                          color: Colors.greenAccent.shade400,
                          size: 24,
                        ),
                      ),
                      labelStyle: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.greenAccent.shade400,
                      ),
                      hintStyle: TextStyle(
                        height: 1.171875,
                        fontSize: 24.0,
                        fontWeight: FontWeight.w300,
                        color: Colors.greenAccent.shade400,
                      ),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value == null || value.isEmpty || value.length < 3) {
                        return 'First Name must contain at least 3 characters';
                      }
                    },
                    style: const TextStyle(color: Colors.white),
                    onChanged: (value) {},
                    autocorrect: true,
                    obscureText: true,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      errorStyle: const TextStyle(color: Colors.red),
                      fillColor: Colors.black54,
                      enabledBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(20.0)),
                        borderSide: BorderSide(
                            color: Colors.greenAccent.shade400, width: 1),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                        borderSide: BorderSide(
                            color: Colors.greenAccent.shade400, width: 1),
                      ),
                      labelText: 'Password',
                      hintText: 'Password',
                      prefixIcon: Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 0.0, 20.0, 0.0),
                        child: Icon(
                          Icons.password,
                          color: Colors.greenAccent.shade400,
                          size: 24,
                        ),
                      ),
                      labelStyle: TextStyle(
                          height: 1.171875,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.greenAccent.shade400),
                      hintStyle: TextStyle(
                          height: 1.171875,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w300,
                          color: Colors.greenAccent.shade400),
                      filled: true,
                    ),
                  ),
                  const SizedBox(height: 30,),
                  ElevatedButton(
                    onPressed: () async {
                      //login(_emailController.text.toString(), _passwordController.text.toString());
                      if (_formKey.currentState!.validate()) {
                        var res = await authService.login(_emailController.text, _passwordController.text);
                        //print(res?.headers);
                        switch (res!.statusCode) {
                          case 200:
                            var data = jsonDecode(res.body);
                            storage.write(key: "token", value: data['token']);
                            //if (!mounted) return;
                            var resMe = await apiService.getMyProfile();
                            switch (resMe!.statusCode) {
                              case 200:
                                final User user = User.fromJson(jsonDecode(resMe.body));
                                if(user.role == "SUPERADMIN"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminGymPage()));
                                } else if(user.role == "PT"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const TrainerGymPage()));
                                } else if(user.role == "MEMBER"){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => const MemberGymPage()));
                                }
                                  break;
                                case 401:
                                break;
                              default:
                                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                  content: Text("You are not in the gym!"),
                                ));
                                break;
                            }
                            break;
                          default:
                            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                              content: Text("Wrong email or password!"),
                            ));
                            break;
                        }
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent.shade400,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5)
                      ),
                      minimumSize: const Size(200, 50),
                      maximumSize: const Size(200, 50),
                    ),
                    child: const Text("Log In"),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
