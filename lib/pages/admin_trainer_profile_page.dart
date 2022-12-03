import 'package:flutter/material.dart';

class AdminTrainerProfilePage extends StatefulWidget {
  const AdminTrainerProfilePage({Key? key}) : super(key: key);

  @override
  State<AdminTrainerProfilePage> createState() => _AdminTrainerProfilePageState();
}

class _AdminTrainerProfilePageState extends State<AdminTrainerProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
        ),
        child: Column(
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
              padding: const EdgeInsets.only(top: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "TRAINERS",
                    style: TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Name",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.greenAccent.shade400,),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Trainer")
            ), //burda member adi olcak
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Email",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.greenAccent.shade400,),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Trainer")
            ), //burda member email olcak
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Phone",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.greenAccent.shade400,),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Trainer")
            ), //burda member telefon olcak
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Experience",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.greenAccent.shade400,),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Trainer")
            ), //burda member experience olcak
            Padding(
              padding: const EdgeInsets.all(5.0),
              child: Text(
                "Trainer",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.greenAccent.shade400,),
              ),
            ),
            const Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("Trainer")
            ), //burda member trainer bilgisi olcak
          ],
        ),
      ),
    );
  }
}
