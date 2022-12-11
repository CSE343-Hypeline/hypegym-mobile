import 'package:flutter/material.dart';
import 'package:hypegym/pages/member_program_page.dart';

class MemberGymPage extends StatefulWidget {
  const MemberGymPage({Key? key}) : super(key: key);

  @override
  State<MemberGymPage> createState() => _MemberGymPageState();
}

class _MemberGymPageState extends State<MemberGymPage> {
  int selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    MemberProgramPage(),
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
              Icons.fitness_center_outlined,
              color: Colors.greenAccent.shade400,
            ),
            label: 'Exercises',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.qr_code_2_outlined,
              color: Colors.greenAccent.shade400,
            ),
            label: 'QR Code',
            backgroundColor: Colors.black,
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.signal_cellular_alt,
              color: Colors.greenAccent.shade400,
            ),
            label: 'Measurements',
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
