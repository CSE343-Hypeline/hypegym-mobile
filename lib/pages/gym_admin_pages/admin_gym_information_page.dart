import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AdminGymInformationPage extends StatelessWidget {
  const AdminGymInformationPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Colors.black,
                  blurRadius: 30.0,
                  spreadRadius: 5.0,
                ),
              ],
            ),
            child: Image(
                image: const AssetImage('images/image_admin.jpg'),
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color.fromRGBO(255, 255, 255, 0.9),
                colorBlendMode: BlendMode.modulate
            ),
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "HYPEGYM",
                      style: GoogleFonts.roboto(
                        textStyle: TextStyle(
                            backgroundColor: Colors.black.withOpacity(0.5),
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.greenAccent.shade400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey.shade900.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Text(
                          "How many members are in the gym right now?",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "12",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey.shade900.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Text(
                          "How many trainers are in the gym right now?",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "4",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 20.0, bottom: 20.0, left: 10.0, right: 10.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey.shade900.withOpacity(0.8),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                    child: Column(
                      children: [
                        Text(
                          "How many members have come up to now?",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          textAlign: TextAlign.center,
                        ),
                        Text(
                          "40",
                          style: GoogleFonts.roboto(
                            textStyle: const TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}