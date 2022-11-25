import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminDefault extends StatefulWidget {
  const AdminDefault({Key? key}) : super(key: key);

  @override
  State<AdminDefault> createState() => _AdminDefaultState();
}

class _AdminDefaultState extends State<AdminDefault> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(32),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/image_admin.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 30.0,
            ),
            Text(
              "Hypegym",
              style: GoogleFonts.lobster(
                textStyle: const TextStyle(
                  color: Colors.greenAccent,
                  letterSpacing: 5.0,
                  fontWeight: FontWeight.bold,
                  fontSize: 60.0,
                ),
              ),
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              "How many members are in the gym right now?",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                ),
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "132",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              "How many trainers are in the gym right now?",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                ),
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "18",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40.0,
            ),
            Text(
              "How many members have come today?",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontStyle: FontStyle.italic,
                  fontSize: 25.0,
                ),
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              "320",
              style: GoogleFonts.roboto(
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 25.0,
                ),
                backgroundColor: Colors.black.withOpacity(0.5),
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
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
