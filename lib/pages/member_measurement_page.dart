import 'package:flutter/material.dart';

class MemberMeasurementPage extends StatelessWidget {
  const MemberMeasurementPage({Key? key}) : super(key: key);

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
            children: [
              DataTable(
                columns: [
                  DataColumn(
                    label: Text(
                      "Body Region",
                      style: TextStyle(color: Colors.greenAccent.shade400, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Last Month",
                      style: TextStyle(color: Colors.greenAccent.shade400, fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      "Now",
                      style: TextStyle(color: Colors.greenAccent.shade400, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: const [
                  DataRow(
                    cells: [
                      DataCell(Text("Kilogram", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      DataCell(Text("80", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      DataCell(Text("85", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                    ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text("Height", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("170", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("170", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text("Wrist", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text("Chest", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text("Waist", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text("Hip", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text("Arm", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text("Forearm", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text("Leg", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      ]
                  ),
                  DataRow(
                      cells: [
                        DataCell(Text("Calf", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                        DataCell(Text("20", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),),),
                      ]
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
