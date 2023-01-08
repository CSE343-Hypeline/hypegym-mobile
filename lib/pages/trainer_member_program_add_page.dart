import 'package:flutter/material.dart';
import 'package:http/http.dart';
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

  late String tSet;
  late String tRep;

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
            Padding(
              padding: const EdgeInsets.only(top: 60.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "ADD PROGRAM",
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
                                      onFieldSubmitted: (value){
                                        tSet = value;
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
                                      onFieldSubmitted: (value){
                                        tRep = value;
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
                                      onPressed: () {
                                        Program mProgram = Program(
                                            exercise_id: snapshot.data![i].id,
                                            set: int.parse(tSet),
                                            rep: int.parse(tRep));
                                        var res = apiService.assignProgram(widget.user.ID, mProgram) as Response;
                                        if (res.statusCode == 200) {
                                          print("eklendi");
                                        } else if(res.statusCode == 401) {
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
                              //onTap: () => ,
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
