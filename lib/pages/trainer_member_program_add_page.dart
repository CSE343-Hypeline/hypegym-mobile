import 'package:flutter/material.dart';

class TrainerMemberProgramAddPage extends StatefulWidget {
  const TrainerMemberProgramAddPage(this.programList, this.memberProgramList, {super.key});
  final List programList;
  final List memberProgramList;
  @override
  State<TrainerMemberProgramAddPage> createState() => _TrainerMemberProgramAddPageState();
}

class _TrainerMemberProgramAddPageState extends State<TrainerMemberProgramAddPage> {
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
                  itemCount: widget.programList.length,
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
                            child: Icon(Icons.add_circle, color: Colors.greenAccent.shade400,),
                            onPressed: () {
                              widget.memberProgramList.add(widget.programList[i]);
                              widget.programList.removeAt(i);
                              setState(() {
                                //refresh UI after deleting element from list
                              });
                            }
                        ),
                            /*
                          const Icon(Icons.add_circle, color: Colors.white,),
                          onTap: () {
                            widget.memberProgramList.add(widget.programList[i]);
                            widget.programList.removeAt(i);
                            setState(() {
                              //refresh UI after deleting element from list
                            });
                          },
                             */
                        title: Text(widget.programList[i]),
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
    );
  }
}
