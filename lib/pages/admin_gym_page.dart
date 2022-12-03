import 'package:flutter/material.dart';
import 'package:hypegym/pages/admin_gym_information_page.dart';
import 'package:hypegym/pages/admin_member_page.dart';
import 'package:hypegym/pages/admin_profile_page.dart';
//import 'package:hypegym_yedek_1/pages/member_list.dart';

class AdminGymPage extends StatefulWidget {
  const AdminGymPage({Key? key}) : super(key: key);

  @override
  State<AdminGymPage> createState() => _AdminGymPageState();
}

class _AdminGymPageState extends State<AdminGymPage> {
  int selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold, backgroundColor: Colors.white);

  static const List<Widget> _widgetOptions = <Widget>[
    AdminGymInformationPage(),
    Text(
      'Trainer bilgileri olcak',
      style: optionStyle,
    ),
    AdminMemberPage(),
    AdminProfiePage(),
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
          color: Colors.black54,
        ),
        child: _widgetOptions.elementAt(selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
              Icons.fitness_center,
              color: Colors.greenAccent.shade400,
            ),
            label: 'Gym',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.accessibility_new,
              color: Colors.greenAccent.shade400,
            ),
            label: 'Personal Trainers',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.accessibility_new,
              color: Colors.greenAccent.shade400,
            ),
            label: 'Members',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_box,
              color: Colors.greenAccent.shade400,
            ),
            label: 'Profile',
            backgroundColor: Colors.black,
          ),
        ],
        currentIndex: selectedIndex,
        selectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
