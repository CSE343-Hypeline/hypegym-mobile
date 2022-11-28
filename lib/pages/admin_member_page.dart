import 'package:flutter/material.dart';
import 'package:hypegym/pages/admin_member_profile_page.dart';

class AdminMemberPage extends StatefulWidget {
  const AdminMemberPage({Key? key}) : super(key: key);

  @override
  State<AdminMemberPage> createState() => _AdminMemberPageState();
}

class _AdminMemberPageState extends State<AdminMemberPage> {
  @override
  Widget build(BuildContext context) {
    final membersList = ['Member 1', 'Member 2', 'Member 3', 'Member 4', 'Member 5', 'Member 6', 'Member 7', 'Member 8', 'Member 9', 'Member 10', 'Member 11', 'Member 12', 'Member 13', 'Member 14', 'Member 15', 'Member 16'];
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
        ),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back, color: Colors.white, size: 35.0,),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 5.0),
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
              // burda online olma durumunu gore opacity eklencek ve subtitleler ona gore ayarlancak
              child: ListView.builder(
                itemCount: membersList.length,
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
                      title: Text(membersList[i]),
                      subtitle: Text(
                        "In gym/Outside",
                        style: TextStyle(
                          color: Colors.white.withOpacity(0.5),
                        ),
                      ),
                      textColor: Colors.white,
                      onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminMemberProfilePage())), //membersList[i] gelmesi lazim
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

        },
        backgroundColor: Colors.greenAccent.shade400,
        foregroundColor: Colors.black,
        child: const Icon(Icons.add),
      ),
    );
  }
}