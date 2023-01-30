import 'package:flutter/material.dart';
import 'package:hypegym/pages/personal_trainer_pages/trainer_member_measurement_edit_page.dart';

class TrainerMemberMeasurementPage extends StatefulWidget {
  const TrainerMemberMeasurementPage(this.measurementMap, {super.key});
  final Map<String, String> measurementMap;

  @override
  State<TrainerMemberMeasurementPage> createState() => _TrainerMemberMeasurementPageState();
}

class _TrainerMemberMeasurementPageState extends State<TrainerMemberMeasurementPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey.shade900,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 60.0, bottom: 20.0,),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "MEASUREMENTS",
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent.shade400,
                      ),
                    ),
                  ],
                ),
              ),
              DataTable(
                //headingRowColor: MaterialStateProperty.all(Colors.greenAccent.shade400),
                columns: [
                  DataColumn(label: Text('Field', style: TextStyle(color: Colors.greenAccent.shade400, fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('Data', style: TextStyle(color: Colors.greenAccent.shade400, fontWeight: FontWeight.bold),)),
                ],
                rows: widget.measurementMap.entries
                    .map((e) => DataRow(cells: [
                  DataCell(Text(e.key.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                  DataCell(Text(e.value.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)),
                ]))
                    .toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MeasurementEditPage(widget.measurementMap)));
        },
        backgroundColor: Colors.greenAccent.shade400,
        foregroundColor: Colors.black,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
