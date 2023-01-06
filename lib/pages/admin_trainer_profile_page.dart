import 'package:flutter/material.dart';
import 'package:hypegym/pages/admin_gym_page.dart';
import 'package:hypegym/pages/admin_list_member_page.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/user.dart';

class AdminTrainerProfilePage extends StatefulWidget {
  const AdminTrainerProfilePage(this.user, {super.key});
  final UserDto user;

  @override
  State<AdminTrainerProfilePage> createState() => _AdminTrainerProfilePageState();
}

class _AdminTrainerProfilePageState extends State<AdminTrainerProfilePage> {

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
                      "TRAINER PROFILE",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
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
                    "+90 ${widget.user.phone_number}",
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => AdminListMemberPage(widget.user)));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      minimumSize: const Size(250, 30),
                      maximumSize: const Size(250, 30),
                    ),
                    child: const Text(
                      "List his/her trainees",
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
                          'Remove this trainer',
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