import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hypegym/pages/personal_trainer_pages/trainer_member_program_page.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/exercise.dart';
import 'package:hypegym/models/program.dart';
import 'package:hypegym/models/user.dart';

class TrainerMemberProgramAddPage extends StatefulWidget {
  const TrainerMemberProgramAddPage(this.user, {super.key});
  final UserDto user;
  @override
  State<TrainerMemberProgramAddPage> createState() => _TrainerMemberProgramAddPageState();
}

class _TrainerMemberProgramAddPageState extends State<TrainerMemberProgramAddPage> {

  List<String>? tSet = List.filled(10,"");
  List<String>? tRep = List.filled(10,"");

  final ApiService apiService = ApiService();
  //late final Program mProgram;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
        ),
        child: Column(
          children: [

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 10,),
                  child: IconButton(
                    icon: const Icon(
                      Icons.arrow_back,
                      color: Colors.white,
                      size: 35.0,
                    ),
                    onPressed: () {
                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_) => TrainerMemberProgramPage(widget.user)));
                      });
                    },
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 50.0, right: 10.0),
                  child: Text(
                    "ADD PROGRAM",
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder<List<ExerciseResDto>>(
                future: apiService.getAllExercises(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.separated(
                        separatorBuilder: (context, index) => const Divider(color: Colors.white,),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (context, i) {
                          return Padding(
                            padding: const EdgeInsets.all(5.0),
                            child: ListTile(
                              leading: SizedBox(
                                width: 50,
                                height: 150,
                                child: Icon(Icons.fitness_center_outlined, color: Colors.greenAccent.shade400,),
                              ),
                              trailing: Wrap(
                                spacing: 12, // space between two icons
                                children: <Widget>[
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.white),
                                      controller: TextEditingController(),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                      ],
                                      onChanged: (value){
                                        tSet![i] = value;
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        //hintText: 'Set',
                                        //hintStyle: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(top: 7.0),
                                    child: SizedBox(
                                        height: 40,
                                        width: 20,
                                        child: Text('x', style: TextStyle(color: Colors.white,fontSize: 25.0,),)
                                      //child: Icon(Icons.cancel_outlined, color: Colors.white,),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 40,
                                    width: 40,
                                    child: TextFormField(
                                      style: const TextStyle(color: Colors.white),
                                      controller: TextEditingController(),
                                      inputFormatters: <TextInputFormatter>[
                                        FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
                                      ],
                                      onChanged: (value){
                                        tRep![i] = value;
                                      },
                                      decoration: InputDecoration(
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(color: Colors.white),
                                          borderRadius: BorderRadius.circular(5.0),
                                        ),
                                        //hintText: 'Rep',
                                        //hintStyle: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  IconButton(
                                      style: IconButton.styleFrom(backgroundColor: Colors.grey.shade900,),
                                      icon: Icon(Icons.add_circle, color: Colors.greenAccent.shade400,),
                                      onPressed: () async {
                                        print(tSet);
                                        if(tSet![i].isEmpty || tRep![i].isEmpty)
                                            return;
                                        Program mProgram = Program(
                                            exercise_id: snapshot.data![i].id,
                                            set: int.parse(tSet![i]),
                                            rep: int.parse(tRep![i]));
                                        var res = await apiService.assignProgram(widget.user.ID, mProgram);
                                        if (res!.statusCode == 200) {
                                          print("eklendi");
                                        } else {
                                          print("eklenemedi");
                                        }
                                        setState(() {
                                          //refresh UI after deleting element from list
                                        });
                                      }
                                  ),
                                ],
                              ),

                              title: Text(snapshot.data![i].name),
                              textColor: Colors.white,
                              //onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramDetailedPage(snapshot.data!.))),
                            ),
                          );
                        }
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
