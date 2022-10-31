import 'package:flutter/material.dart';

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
    Text(
      'Gym bilgileri olcak',
      style: optionStyle,
    ),
    Text(
      'Trainer bilgileri olcak',
      style: optionStyle,
    ),
    Text(
      'Member bilgileri olcak',
      style: optionStyle,
    ),
    Text(
      'Profil bilgileri olcak',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index){
    setState(() {
      selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  blurRadius: 30.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: Image(
              image: const AssetImage('images/image_2.jpg'),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          _widgetOptions.elementAt(selectedIndex),
        ],
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
