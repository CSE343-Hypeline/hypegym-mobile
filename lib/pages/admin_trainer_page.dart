import 'package:flutter/material.dart';
import 'package:hypegym/pages/admin_trainer_profile_page.dart';
import 'package:hypegym/pages/user_add_page.dart';

class AdminTrainerPage extends StatefulWidget {
  const AdminTrainerPage({Key? key}) : super(key: key);

  @override
  State<AdminTrainerPage> createState() => _AdminTrainerPageState();
}

class _AdminTrainerPageState extends State<AdminTrainerPage> {
  @override
  Widget build(BuildContext context) {
    final trainersList = ['Trainer 1', 'Trainer 2', 'Trainer 3', 'Trainer 4', 'Trainer 5', 'Trainer 6', 'Trainer 7', 'Trainer 8', 'Trainer 9', 'Trainer 10', 'Trainer 11', 'Trainer 12', 'Trainer 13', 'Trainer 14'];
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
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              // burda online olma durumunu gore opacity eklencek ve subtitleler ona gore ayarlancak
              child: ListView.builder(
                itemCount: trainersList.length,
                itemBuilder: (context, i) {
                  return Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: ListTile(
                      //shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                      leading: const Icon(Icons.account_circle, color: Colors.white,),
                      trailing: Wrap(
                        spacing: 12,
                        children: <Widget>[
                          Icon(Icons.fitness_center, color: Colors.greenAccent.shade400,),
                          const Icon(Icons.keyboard_arrow_right, color: Colors.white,),
                        ],
                      ),
                      title: Text(trainersList[i]),
                      subtitle: Text(
                        "In gym/Outside",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      textColor: Colors.white,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminTrainerProfilePage())), //membersList[i] gelmesi lazim
                    ),
                  );
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
