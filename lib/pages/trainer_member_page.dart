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
  UserDto? profile;
  Map<String, String> measurementMap = {'Kilogram': '80kg', 'Height': '165cm',
    'Wrist': '20cm', 'Chest': '20cm', 'Waist': '20cm', 'Hip': '20cm', 'Arm': '20cm',
    'Forearm': '20cm', 'Leg': '20cm', 'Calf': '20cm', 'Neck': '20cm'};

  @override
  void initState () {
    super.initState();
    _asyncMethod();
  }

  _asyncMethod() async{
    profile = (await apiService.userOrEmpty)!;
    setState((){});
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
            //bu kalkcak

            Expanded(
              child:
              FutureBuilder<List<UserDto>>(
                        future: profile == null ? null : apiService.getMembers(profile!.ID),
                        builder: (context, tMembers) {
                          if (tMembers.hasData && tMembers.data!.isNotEmpty) {
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
                                    onTap: () => showAlertDialog(context, tMembers.data![index], measurementMap),
                                  ),
                                );
                              },
                            );
                          } else if(tMembers.hasData && tMembers.data!.isEmpty) {
                            return const Padding(
                              padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0),
                              child: Text(
                                "You do not have any members", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            );
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

showAlertDialog(BuildContext context, UserDto user, Map<String, String> measurementMap) {
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
      Navigator.push(context, MaterialPageRoute(builder: (context) => TrainerMemberMeasurementPage(measurementMap)));
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