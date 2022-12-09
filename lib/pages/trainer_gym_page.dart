import 'package:flutter/material.dart';
import 'package:hypegym/pages/trainer_member_page.dart';
import 'package:hypegym/pages/trainer_profile_page.dart';

class TrainerGymPage extends StatefulWidget {
  const TrainerGymPage({Key? key}) : super(key: key);

  @override
  State<TrainerGymPage> createState() => _TrainerGymPageState();
}

class _TrainerGymPageState extends State<TrainerGymPage> {

  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    TrainerMemberPage(),
    TrainerProfilePage(),
  ];

  void _onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.list_alt,
              color: Colors.greenAccent.shade400,
            ),
            label: 'Members',
            backgroundColor: Colors.black54,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              color: Colors.greenAccent.shade400,
            ),
            label: 'Profile',
            backgroundColor: Colors.black54,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
