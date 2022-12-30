import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TempEdit extends StatefulWidget {
  const TempEdit(this.memberMeasurement, {super.key});
  final Map memberMeasurement;
  @override
  State<TempEdit> createState() => _TempEditState();
}

class _TempEditState extends State<TempEdit> {
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
                //headingRowColor: MaterialStateProperty.all(Colors.greenAccent.shade400),
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
                        //initialValue: e.value.toString(),
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
            ],
          ),
        ),
      ),
    );
  }
}