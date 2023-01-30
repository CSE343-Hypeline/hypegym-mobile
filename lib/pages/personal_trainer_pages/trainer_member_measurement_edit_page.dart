import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hypegym/pages/personal_trainer_pages/trainer_member_measurement_page.dart';

class MeasurementEditPage extends StatefulWidget {
  const MeasurementEditPage(this.memberMeasurement, {super.key});
  final Map<String,String> memberMeasurement;
  @override
  State<MeasurementEditPage> createState() => _MeasurementEditPageState();
}

class _MeasurementEditPageState extends State<MeasurementEditPage> {
  late final TextInputType keyboardType;
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
                padding: const EdgeInsets.only(top: 60.0, bottom: 5.0,),
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
                columns: [
                  DataColumn(label: Text('Field', style: TextStyle(color: Colors.greenAccent.shade400, fontWeight: FontWeight.bold),)),
                  DataColumn(label: Text('Data', style: TextStyle(color: Colors.greenAccent.shade400, fontWeight: FontWeight.bold),)),
                ],
                rows: widget.memberMeasurement.entries
                    .map((e) => DataRow(cells: [
                  DataCell(
                      Text(e.key.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
                  ),
                  DataCell(
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: TextFormField(
                        controller: TextEditingController(text: e.value.toString()),
                        style: const TextStyle(color: Colors.white),
                        keyboardType: TextInputType.text,
                        onFieldSubmitted: (val){
                          widget.memberMeasurement[e.key] = val;
                        },
                      ),
                    ),
                  ),
                ]))
                    .toList(),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => TrainerMemberMeasurementPage(widget.memberMeasurement)));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.greenAccent.shade400,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)
                  ),
                  minimumSize: const Size(150, 50),
                  maximumSize: const Size(150, 50),
                ),
                child: const Text("Edit"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}