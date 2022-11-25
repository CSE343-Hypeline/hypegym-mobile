import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
