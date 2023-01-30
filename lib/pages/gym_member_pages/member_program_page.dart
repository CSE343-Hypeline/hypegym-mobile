//import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hypegym/pages/gym_member_pages/program_detailed_page.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/user.dart';
import 'package:hypegym/models/program.dart';
import 'package:hypegym/models/exercise.dart';

class MemberProgramPage extends StatefulWidget {
  const MemberProgramPage({Key? key}) : super(key: key);

  @override
  State<MemberProgramPage> createState() => _MemberProgramPageState();
}

class _MemberProgramPageState extends State<MemberProgramPage> {

  final ApiService apiService = ApiService();
  UserDto? profile;
  late final Exercise exer;

  Future<Exercise> getMemberExercise(int exer_id) async {
    exer = await apiService.getExercise(exer_id);
    return exer;
  }

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
                    "MY EXERCISES",
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
              child: FutureBuilder<List<ProgramDto>> (
                      future: profile == null ? null : apiService.fetchPrograms(profile!.ID),
                      builder: (context, mProgram) {
                        if(mProgram.hasData && mProgram.data!.isNotEmpty) {
                          return ListView.separated(
                            separatorBuilder: (context, index) => const Divider(color: Colors.white,),
                            itemCount: mProgram.data!.length,
                            itemBuilder: (context, i) {
                              return FutureBuilder(
                                future: getMemberExercise(mProgram.data![i].exercise_id),
                                builder: (context, mExercise){
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: ListTile(
                                      leading: SizedBox(
                                        width: 50,
                                        height: 100,
                                        child: Icon(Icons.fitness_center_outlined, color: Colors.greenAccent.shade400,),
                                      ),
                                      trailing: const Icon(Icons.arrow_circle_right_outlined, color: Colors.white, size: 20.0,),
                                      title: Text(mExercise.data!.name),
                                      subtitle: Text(
                                        "${mProgram.data![i].set.toString()} x ${mProgram.data![i].rep.toString()}",
                                        style: TextStyle(
                                          color: Colors.white.withOpacity(0.5),
                                        ),
                                      ),
                                      textColor: Colors.white,
                                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => ProgramDetailedPage(mExercise.data!))),
                                    ),
                                  );
                                },
                              );
                            },
                          );
                        } else if(mProgram.hasData && mProgram.data!.isEmpty) {
                          return const Padding(
                              padding: EdgeInsets.only(top: 100.0),
                              child: Text("You do not have any program", style: TextStyle(color: Colors.white, fontSize: 20.0),)
                          );
                        }
                        return const SizedBox(
                          height: 60.0,
                          child: Center(child: CircularProgressIndicator()),
                        );
                      },
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
