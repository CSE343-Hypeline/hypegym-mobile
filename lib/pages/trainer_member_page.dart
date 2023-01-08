import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:hypegym/pages/trainer_member_measurement_page.dart';
import 'package:hypegym/pages/trainer_member_program_page.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/user.dart';


class TrainerMemberPage extends StatefulWidget {
  const TrainerMemberPage({Key? key}) : super(key: key);

  @override
  State<TrainerMemberPage> createState() => _TrainerMemberPageState();
}

class _TrainerMemberPageState extends State<TrainerMemberPage> {

  final ApiService apiService = ApiService();
  late final UserDto profile;

  Future<UserDto> temp() async {
    var res = await apiService.getMe() ;
    profile = UserDto.fromJson(jsonDecode(res!.body));
    return profile;
  }

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
                    "MEMBERS",
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
              child: FutureBuilder(
                future: temp(),
                  builder: (context,snapshot) {
                    if (snapshot.hasData) {
                      return FutureBuilder<List<UserDto>>(
                        future: apiService.getMembers(snapshot.data!.ID),
                        builder: (context, tMembers) {
                          if (tMembers.hasData) {
                            return ListView.builder(
                              shrinkWrap: true,
                              itemCount: tMembers.data!.length,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: ListTile(
                                    leading: const Icon(Icons.account_circle, color: Colors.white,),
                                    trailing: Wrap(
                                      spacing: 12,
                                      children: <Widget>[
                                        Icon(Icons.fitness_center, color: Colors.greenAccent.shade400,),
                                        const Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                                      ],
                                    ),
                                    title: Text(tMembers.data![index].name),
                                    subtitle: Text(
                                      "In gym/Outside",
                                      style: TextStyle(
                                        color: Colors.white.withOpacity(0.5),
                                      ),
                                    ),
                                    textColor: Colors.white,
                                    onTap: () => showAlertDialog(context, tMembers.data![index]),
                                  ),
                                );
                              },
                            );
                          } else if (tMembers.hasData == false){
                            return const Text(
                              "You do not have any members", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                            );
                          }
                          return const CircularProgressIndicator();
                        },
                      );
                    }else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    }
                    return const CircularProgressIndicator();
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context, UserDto user) {
  Widget programsButton = TextButton(
    child: const Text(
      "Member's Program",
    ),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => TrainerMemberProgramPage(user)));
    },
  );
  Widget measurementsButton = TextButton(
    child: const Text(
        "Member's Measurement",
    ),
    onPressed: () {
      //Navigator.push(context, MaterialPageRoute(builder: (context) => const TempPage()));
      Navigator.push(context, MaterialPageRoute(builder: (context) => const TrainerMemberMeasurementPage()));
    },
  );
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.grey.shade900,
    title: const Text(
      "Caution",
      style: TextStyle(color: Colors.white),
    ),
    content: const Text(
      "Which page do you want to go to?",
      style: TextStyle(color: Colors.white),
    ),
    actions: [
      programsButton,
      measurementsButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}