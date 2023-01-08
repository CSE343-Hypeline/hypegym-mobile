import 'package:flutter/material.dart';
import 'package:hypegym/pages/admin_gym_page.dart';
import 'package:hypegym/pages/admin_pt_assign_page.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/user.dart';

class AdminMemberProfilePage extends StatefulWidget {
  const AdminMemberProfilePage(this.user, {super.key});
  final UserDto user;

  @override
  State<AdminMemberProfilePage> createState() => _AdminMemberProfilePageState();
}

class _AdminMemberProfilePageState extends State<AdminMemberProfilePage> {

  final ApiService apiService = ApiService();

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
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "MEMBER PROFILE",
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
                    widget.user.name,
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
                    widget.user.email,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.user.phone_number,
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
                    widget.user.address,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminPTAssignPage(widget.user)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      minimumSize: const Size(230, 30),
                      maximumSize: const Size(230, 30),
                    ),
                    child: const Text(
                      "Change/Add Trainer",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {
                          final snackBar = SnackBar(
                            content: const Text(
                              "Attention!!  You are deleting this user.",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            action: SnackBarAction(
                              label: 'DELETE',
                              onPressed: () async {
                                var res = await apiService.deleteUser(widget.user.ID);
                                switch (res!.statusCode) {
                                  case 200:
                                    print('deleted member');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminGymPage()));
                                    break;
                                  default:
                                    print('member not delete');
                                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminGymPage()));
                                    break;
                                }
                              },
                            ),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(snackBar);
                        },
                        child: const Text(
                          'Remove this member',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed,
                          ),
                        ),
                      ),
                      const Icon(Icons.delete, size: 20.0, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}