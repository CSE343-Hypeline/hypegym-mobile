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
                          title: Text(snapshot.data![index].email.toString()),
                          trailing: Wrap(
                            spacing: 12,
                            children: <Widget>[
                              IconButton(
                                icon: const Icon(Icons.close,color: Colors.red),
                                onPressed: (){

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

