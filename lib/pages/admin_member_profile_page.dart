import 'package:flutter/material.dart';

class AdminMemberProfilePage extends StatefulWidget {
  const AdminMemberProfilePage({Key? key}) : super(key: key);

  @override
  State<AdminMemberProfilePage> createState() => _AdminMemberProfilePageState();
}

class _AdminMemberProfilePageState extends State<AdminMemberProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.grey.shade900,
            ),
          ),
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 40.0, bottom: 50.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "MEMBER PROFILE",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              Column(
                children: [
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Eray Ozkan",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Email",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "erayozkan@gmail.com",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Phone",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "+90 539 939 39 39",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  Text(
                    "Trainer Name",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    "Burcu Akar",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: (){
                      //Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminGymPage()));
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.greenAccent.shade700,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)
                      ),
                      minimumSize: const Size(230, 30),
                      maximumSize: const Size(230, 30),
                    ),
                    child: const Text(
                      "Change/Add Trainer",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        style: TextButton.styleFrom(
                          textStyle: const TextStyle(
                            fontSize: 20.0,
                          ),
                        ),
                        onPressed: () {},
                        child: const Text(
                          'Remove this member',
                          style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline,
                            decorationStyle: TextDecorationStyle.dashed,
                          ),
                        ),
                      ),
                      const Icon(Icons.delete, size: 20.0, color: Colors.red),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}