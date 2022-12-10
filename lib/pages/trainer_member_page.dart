import 'package:flutter/material.dart';
import 'package:hypegym/pages/trainer_member_measurement_page.dart';
import 'package:hypegym/pages/trainer_member_program_page.dart';

class TrainerMemberPage extends StatefulWidget {
  const TrainerMemberPage({Key? key}) : super(key: key);

  @override
  State<TrainerMemberPage> createState() => _TrainerMemberPageState();
}

class _TrainerMemberPageState extends State<TrainerMemberPage> {
  @override
  Widget build(BuildContext context) {
    final membersList = ['Trainer 1', 'Trainer 2', 'Trainer 3', 'Trainer 4', 'Trainer 5', 'Trainer 6', 'Trainer 7'];
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
            Expanded(
              child: ListView.builder(
                itemCount: membersList.length,
                itemBuilder: (context, i) {
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
                      title: Text(membersList[i]),
                      subtitle: Text(
                        "In gym/Outside",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      textColor: Colors.white,
                      onTap: () => showAlertDialog(context),
                    ),
                  );
                }
              ),
            ),
          ],
        ),
      ),
    );
  }
}

showAlertDialog(BuildContext context) {
  Widget programsButton = TextButton(
    child: const Text(
      "Member's Program",
    ),
    onPressed: () {
      Navigator.push(context, MaterialPageRoute(builder: (context) => const TrainerMemberProgramPage()));
    },
  );
  Widget measurementsButton = TextButton(
    child: const Text(
        "Member's Measurement",
    ),
    onPressed: () {
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