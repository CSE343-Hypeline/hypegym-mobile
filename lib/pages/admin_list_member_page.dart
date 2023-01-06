import 'package:flutter/material.dart';
import 'package:hypegym/pages/admin_gym_page.dart';
import 'package:hypegym/pages/admin_member_page.dart';
import 'package:hypegym/pages/admin_member_profile_page.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/user.dart';
import 'package:confirm_dialog/confirm_dialog.dart';

class AdminListMemberPage extends StatefulWidget {
  const AdminListMemberPage(this.user, {super.key});
  final UserDto user;

  @override
  State<AdminListMemberPage> createState() => _AdminListMemberPageState();
}

class _AdminListMemberPageState extends State<AdminListMemberPage> {

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
                    "Members of ${widget.user.name}",
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
                future: apiService.getMembers(widget.user.ID), //gym id yollamamiz lazim
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {

                        return ListTile(
                          focusColor: Colors.grey,
                          leading: const Icon(Icons.account_circle, color: Colors.white,),
                          title: Text(snapshot.data![index].name),
                          trailing: Wrap(
                            spacing: 12,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.close,color: Colors.red),
                                onPressed: ()async {
                                  if (await confirm(  context,
                                    title: const Text('Confirm'),
                                    content: const Text('Would you like to dismiss?'),
                                    textOK: const Text('Yes'),
                                    textCancel: const Text('No'),
                                  ))
                                  {
                                    var res = await apiService.dismissMember(snapshot.data![index].ID,widget.user.ID);
                                    switch (res!.statusCode) {
                                      case 200:
                                        print('assigned to member');
                                        Navigator.pop(context);
                                        break;
                                      default:
                                        print('member not dismiss');
                                        break;
                                    }
                                    return;
                                  }
                                  return print('pressedCancel');
                                },
                              ),

                            ],
                          ),
                          subtitle: Text(
                            "In gym/Outside",
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.5),
                            ),
                          ),
                          textColor: Colors.white,
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminMemberProfilePage(snapshot.data![index]))),
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

