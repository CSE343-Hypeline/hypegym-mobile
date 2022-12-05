import 'package:flutter/material.dart';
import 'package:hypegym/models/user.dart';
import 'package:hypegym/pages/admin_member_profile_page.dart';
import 'package:hypegym/pages/user_add_page.dart';
import 'package:hypegym/services/api_service.dart';

class AdminMemberPage extends StatefulWidget {
  const AdminMemberPage({Key? key}) : super(key: key);

  @override
  State<AdminMemberPage> createState() => _AdminMemberPageState();
}

class _AdminMemberPageState extends State<AdminMemberPage> {
  final ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    //final trainersList = ['Trainer 1', 'Trainer 2', 'Trainer 3', 'Trainer 4', 'Trainer 5', 'Trainer 6', 'Trainer 7', 'Trainer 8', 'Trainer 9', 'Trainer 10', 'Trainer 11', 'Trainer 12', 'Trainer 13', 'Trainer 14'];
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
                    "MEMBERS",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                ],
              ),
            ),
            Center(
              child: FutureBuilder<List<UserDto>>(
                future: apiService.fetchMembers(1),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
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
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminMemberProfilePage())),
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserAddPage()));
        },
        backgroundColor: Colors.greenAccent.shade400,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}