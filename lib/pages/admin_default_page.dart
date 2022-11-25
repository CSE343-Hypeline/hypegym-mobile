import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hypegym/pages/admin_home_page.dart';
import 'package:hypegym/pages/admin_trainer_page.dart';

class AdminDefault extends StatefulWidget {
  const AdminDefault({Key? key}) : super(key: key);

  @override
  State<AdminDefault> createState() => _AdminDefaultState();
}

class _AdminDefaultState extends State<AdminDefault> {
  int _selectedIndex = 0;
  final screens = [
    const AdminHome(),
    const AdminTrainer(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if(_selectedIndex == 0) {
        debugPrint("Default Page");
      }
      if(_selectedIndex == 1) {
        debugPrint("Trainers Page");
      }
      if(_selectedIndex == 2) {
        debugPrint("Members Page");
      }
      if(_selectedIndex == 3) {
        debugPrint("Profile Page");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        // Fixed
        backgroundColor: Colors.grey[900],
        // <-- This works for fixed
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.greenAccent,

        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.fitness_center_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Trainers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            label: 'Members',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_pin),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,

        //selectedItemColor: Colors.green[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
