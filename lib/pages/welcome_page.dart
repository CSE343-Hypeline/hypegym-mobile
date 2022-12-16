import 'package:flutter/material.dart';
import 'package:hypegym/pages/about_us_page.dart';
import 'package:hypegym/pages/member_gym_page.dart';
//import 'package:hypegym/pages/trainer_gym_page.dart';
//import 'package:hypegym/pages/login_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
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
                padding: const EdgeInsets.only(top: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      "HYPEGYM",
                      style: TextStyle(
                          backgroundColor: Colors.black,
                          fontSize: 50,
                          fontWeight: FontWeight.bold,
                          color: Colors.greenAccent.shade400
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    Text(
                      "GET STRONGER",
                      style: TextStyle(
                        backgroundColor: Colors.black,
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Row(
                  children: const [
                    Text(
                      "WELCOME",
                      style: TextStyle(
                        backgroundColor: Colors.black,
                        fontSize: 35,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const MemberGymPage()));
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const TrainerGymPage())); //bunu denedigim icin simdilik bu burda
                    //Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.greenAccent.shade400,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    minimumSize: const Size(350, 50),
                    maximumSize: const Size(350, 50),
                  ),
                  child: const Text(
                    "LOGIN",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                child: ElevatedButton(
                  onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => const AboutUsPage()));
                  },
                  style: ElevatedButton.styleFrom(
                    //backgroundColor: Colors.greenAccent.shade400,
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(25)
                    ),
                    minimumSize: const Size(350, 50),
                    maximumSize: const Size(350, 50),
                  ),
                  child: Text(
                    "ABOUT US",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                      color: Colors.greenAccent.shade400,
                      //color: Colors.white,
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