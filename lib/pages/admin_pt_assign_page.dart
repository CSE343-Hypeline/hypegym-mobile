import 'package:flutter/material.dart';
import 'package:hypegym/pages/admin_gym_page.dart';
import 'package:hypegym/pages/admin_member_page.dart';
import 'package:hypegym/pages/admin_member_profile_page.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/user.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class AdminPTAssignPage extends StatefulWidget {
  const AdminPTAssignPage(this.user, {super.key});
  final UserDto user;

  @override
  State<AdminPTAssignPage> createState() => _AdminPTAssignPageState();
}

class _AdminPTAssignPageState extends State<AdminPTAssignPage> {

  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Assign Trainer",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<UserDto>>(
                future: apiService.fetchTrainers(widget.user.gymId), //gym id yollamamiz lazim
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          focusColor: Colors.grey,
                          leading: const Icon(Icons.account_circle, color: Colors.white,),
                          title: Text(snapshot.data![index].email.toString()),
                          trailing: Wrap(
                            spacing: 12,
                            children: <Widget>[
                              Icon(Icons.fitness_center, color: Colors.greenAccent.shade400,),
                              const Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                            ],
                          ),
                          subtitle: Text(
                            "In gym/Outside",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          textColor: Colors.white,
                          onTap: ()async {
                          if (await confirm(  context,
                                              title: const Text('Confirm'),
                                              content: const Text('Would you like to assign?'),
                                              textOK: const Text('Yes'),
                                              textCancel: const Text('No'),
                                              ))
                          {
                            var res = await apiService.assignPT(widget.user.ID,snapshot.data![index].ID);
                            switch (res!.statusCode) {
                              case 200:
                                print('assigned to member');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMemberProfilePage(widget.user)));
                                break;
                              default:
                                print('member not assign');
                                break;
                            }
                            return;
                          }
                            return print('pressedCancel');
                          },
                        );
                      },
                    );
                  } else if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  return const CircularProgressIndicator();
                },
              ),
            ),
          ],
        ),
      ),

    );
  }
}

