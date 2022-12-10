import 'package:flutter/material.dart';
import 'package:hypegym/pages/trainer_member_program_add_page.dart';

class TrainerMemberProgramEditPage extends StatefulWidget {
  const TrainerMemberProgramEditPage(this.memberProgramList, {super.key});
  final List memberProgramList;
  @override
  State<TrainerMemberProgramEditPage> createState() => _TrainerMemberProgramEditPageState();
}



class _TrainerMemberProgramEditPageState extends State<TrainerMemberProgramEditPage> {

  @override
  void initState() {
    super.initState();
  }

  final List programList = ['Yeni1', 'Yeni2', 'Yeni3', 'Yeni4', 'Yeni5', 'Yeni6', 'Yeni7'];
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
                  itemCount: widget.memberProgramList.length,
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
                        trailing:
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.grey.shade900,
                              ),
                              child: const Icon(Icons.cancel_outlined, color: Colors.red,),
                                onPressed: () {
                                  programList.add(widget.memberProgramList[i]);
                                  widget.memberProgramList.removeAt(i);
                                  setState(() {
                                    //refresh UI after deleting element from list
                                  });
                                }
                            ),
                            /*
                          const Icon(Icons.cancel_outlined, color: Colors.red,),
                          onTap: () {
                            programList.add(widget.memberProgramList[i]);
                            widget.memberProgramList.removeAt(i);
                            setState(() {
                              //refresh UI after deleting element from list
                            });
                          },
                             */
                        title: Text(widget.memberProgramList[i]),
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
        onPressed: () {
          Navigator.push( context, MaterialPageRoute( builder: (context) => TrainerMemberProgramAddPage(programList, widget.memberProgramList)), ).then((value) => setState(() {}));
          //Navigator.push(context, MaterialPageRoute(builder: (context) => TrainerMemberProgramAddPage(programList, widget.memberProgramList)));
        },
        backgroundColor: Colors.greenAccent.shade400,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}
