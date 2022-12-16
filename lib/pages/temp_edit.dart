import 'package:flutter/material.dart';

class TempEdit extends StatefulWidget {
  const TempEdit(this.memberMeasurement, {super.key});
  final Map memberMeasurement;
  @override
  State<TempEdit> createState() => _TempEditState();
}

class _TempEditState extends State<TempEdit> {
  final _inController = TextEditingController();
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
                        controller: _inController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Input can not be empty';
                          }
                        },
                        style: const TextStyle(color: Colors.white),
                        onChanged: (value) {},
                        autocorrect: true,
                        decoration: InputDecoration(
                          errorStyle: const TextStyle(color: Colors.red),
                          fillColor: Colors.black38,
                          enabledBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Colors.greenAccent.shade400, width: 1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                            borderSide: BorderSide(
                                color: Colors.greenAccent.shade400, width: 1),
                          ),
                          hintText: e.value.toString(),
                          hintStyle: const TextStyle(
                            height: 0.8,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
                          ),
                          filled: true,
                        ),
                      ),
                    ),
                      //Text(e.value.toString(), style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),)
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