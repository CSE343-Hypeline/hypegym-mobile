import 'package:flutter/material.dart';
import 'package:hypegym/pages/trainer_member_program_edit_page.dart';

class TrainerMemberProgramPage extends StatefulWidget {
  const TrainerMemberProgramPage({Key? key}) : super(key: key);

  @override
  State<TrainerMemberProgramPage> createState() => _TrainerMemberProgramPageState();
}

class _TrainerMemberProgramPageState extends State<TrainerMemberProgramPage> {
  final List programList = ['Warn Up', 'Jumping Jack', 'Skipping', 'Squats', 'Arm Raises', 'Incline Push-Ups', 'Push-Ups'];
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
                    "EXERCISES",
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
              child: ListView.builder(
                  itemCount: programList.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: ListTile(
                        leading: ConstrainedBox(
                          constraints: const BoxConstraints(
                            minWidth: 90,
                            minHeight: 90,
                            maxWidth: 90,
                            maxHeight: 90,
                          ),
                          child: Image.asset('images/image_1.jpg', fit: BoxFit.cover),
                        ),
                        //trailing: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white,),
                        title: Text(programList[i]),
                        subtitle: Text(
                          "xbilmemne kere", //burda hareketin kac kere tekrarlancagi bilgisi gelcek ama bunu interaktif bi sekilde alinmasi lazim
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.5),
                          ),
                        ),
                        textColor: Colors.white,
                        //onTap: () => ,
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => TrainerMemberProgramEditPage(programList)));
        },
        backgroundColor: Colors.greenAccent.shade400,
        foregroundColor: Colors.black,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
