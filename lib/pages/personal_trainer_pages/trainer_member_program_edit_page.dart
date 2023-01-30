import 'package:flutter/material.dart';
import 'package:hypegym/models/user.dart';
import 'package:hypegym/pages/personal_trainer_pages/trainer_member_program_add_page.dart';
import 'package:hypegym/models/program.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/exercise.dart';

class TrainerMemberProgramEditPage extends StatefulWidget {
  const TrainerMemberProgramEditPage(this.programList, this.user, {super.key});
  final List<ProgramListDto> programList;  //programDTO
  final UserDto user;

  @override
  State<TrainerMemberProgramEditPage> createState() => _TrainerMemberProgramEditPageState();
}

class _TrainerMemberProgramEditPageState extends State<TrainerMemberProgramEditPage> {

  @override
  void initState() {
    super.initState();
  }

  final ApiService apiService = ApiService();
  late final Exercise exer;

  Future<Exercise> getMemberExercise(int exer_id) async {
    exer = await apiService.getExercise(exer_id);
    return exer;
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
                    "UPDATE PROGRAM",
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
              child: ListView.separated(
                  separatorBuilder: (context, index) => const Divider(color: Colors.white,),
                  itemCount: widget.programList.length,
                  itemBuilder: (context, i) {
                        return Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: ListTile(
                            leading: SizedBox(
                              width: 50,
                              height: 100,
                              child: Icon(Icons.fitness_center_outlined, color: Colors.greenAccent.shade400,),
                            ),
                            trailing: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade900,
                                ),
                                child: const Icon(Icons.cancel_outlined, color: Colors.red,),
                                onPressed: () async{   //bu kisim emin degilim eraya sor
                                  var res = await apiService.dismissProgram(widget.user.ID,widget.programList[i].id );
                                  if(res!.statusCode == 200){
                                    print("silindi");
                                    widget.programList.removeAt(i);
                                    setState(() {
                                      //refresh UI after deleting element from list
                                    });
                                  } else {
                                    print("silinemedi");
                                  }
                                }
                            ),
                            title: Text(widget.programList[i].exercise.name),
                            subtitle: Text(
                              "${widget.programList[i].set.toString()} x ${widget.programList[i].rep.toString()}",
                              style: TextStyle(
                                color: Colors.white.withOpacity(0.5),
                              ),
                            ),
                            textColor: Colors.white,
                            //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramDetailedPage(mExercise.data!))),
                          ),
                        );

                  }
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => TrainerMemberProgramAddPage(widget.user)));
          //Navigator.push( context, MaterialPageRoute( builder: (context) => TrainerMemberProgramAddPage().then((value) => setState(() {}));
        },
        backgroundColor: Colors.greenAccent.shade400,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
