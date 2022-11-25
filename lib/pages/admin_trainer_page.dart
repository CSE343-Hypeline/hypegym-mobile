import 'package:flutter/material.dart';

class AdminTrainer extends StatefulWidget {
  const AdminTrainer({Key? key}) : super(key: key);

  @override
  State<AdminTrainer> createState() => _AdminTrainerState();
}

class _AdminTrainerState extends State<AdminTrainer> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text("Admin Trainer Page"),
    );
  }
}
