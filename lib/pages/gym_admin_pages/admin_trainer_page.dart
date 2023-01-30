import 'package:flutter/material.dart';
import 'package:hypegym/models/user.dart';
import 'package:hypegym/pages/gym_admin_pages/admin_trainer_profile_page.dart';
import 'package:hypegym/pages/gym_admin_pages/user_add_page.dart';
import 'package:hypegym/services/api_service.dart';

class AdminTrainerPage extends StatefulWidget {
  const AdminTrainerPage({Key? key}) : super(key: key);

  @override
  State<AdminTrainerPage> createState() => _AdminTrainerPageState();
}

class _AdminTrainerPageState extends State<AdminTrainerPage>{
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
                    "TRAINERS",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: FutureBuilder<List<UserDto>>(
                future: apiService.fetchTrainers(), //gym id yollamamiz lazim
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: const Icon(Icons.account_circle, color: Colors.white,),
                          title: Text(snapshot.data![index].name.toString()),
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
                          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => AdminTrainerProfilePage(snapshot.data![index]))),
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
          Navigator.push(context, MaterialPageRoute(builder: (context) => const UserAddPage(2)));
        },
        backgroundColor: Colors.greenAccent.shade400,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
