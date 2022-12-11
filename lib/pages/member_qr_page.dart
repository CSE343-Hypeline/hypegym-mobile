import 'package:flutter/material.dart';

class MemberQrPage extends StatefulWidget {
  const MemberQrPage({Key? key}) : super(key: key);

  @override
  State<MemberQrPage> createState() => _MemberQrPageState();
}

class _MemberQrPageState extends State<MemberQrPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: const [
          Padding(
            padding: EdgeInsets.only(top: 100.0, left: 20.0, right: 20.0,),
              child: Text("BURANIN NASIL OLCAGI DAHA KARARLASTIRILCAK"),
          ),
        ],
      ),
    );
  }
}
