import 'package:flutter/material.dart';

class AboutUsPage extends StatelessWidget {
  const AboutUsPage({Key? key}) : super(key: key);

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
              image: const AssetImage('images/image_2.jpg'),
              fit: BoxFit.cover,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
            ),
          ),
          Column(
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
                padding: const EdgeInsets.only(top: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "ABOUT US",
                      style: TextStyle(
                          backgroundColor: Colors.black.withOpacity(0.5),
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.shade400
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 50.0, bottom: 20.0, left: 20.0, right: 20.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16.0),
                    color: Colors.grey.shade300.withOpacity(0.6),
                  ),
                  child: Column(
                    children: const [
                      Padding(
                        padding: EdgeInsets.all(30.0),
                        child: Text(
                          "REACH YOUR LIMITS AND GET TO THE NEXT LEVEL",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 0.0, bottom: 30.0, left: 10.0, right: 10.0),
                        child: Text(
                          "     Hypegym is a gym management system enterprice that can "
                              "be used simultaneously by gym owners, personal trainers "
                              "and members. Thanks to the QR code, the Hypegym system "
                              "removes the obligation to use a card when entering gyms. "
                              "Furthermore, Hypegym simplifies member management and "
                              "assigning exercise programs.",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ],
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