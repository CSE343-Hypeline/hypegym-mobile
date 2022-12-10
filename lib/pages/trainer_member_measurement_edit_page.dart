import 'package:flutter/material.dart';

class MeasurementEditPage extends StatefulWidget {
  const MeasurementEditPage(this.memberMeasurement, {super.key});
  final Map memberMeasurement;
  @override
  State<MeasurementEditPage> createState() => _MeasurementEditPageState();
}

class _MeasurementEditPageState extends State<MeasurementEditPage> {

 // final _inputController = TextEditingController();

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
            Expanded(
              child: ListView.builder(
                  itemCount: widget.memberMeasurement.length,
                  itemBuilder: (context, i) {
                    return Padding(
                      padding: const EdgeInsets.all(2.0),
                      child: ListTile(
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10.0,),
                              child: SizedBox(
                                height: 35.0,
                                width: 130.0,
                                child: Card(
                                  color: Colors.black38,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      widget.memberMeasurement.keys.elementAt(i),
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            /*
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10.0,),
                              child: SizedBox(
                                height: 35.0,
                                width: 70.0,
                                child: Card(
                                  color: Colors.white70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: TextFormField(
                                      controller: _inputController,
                                      validator: (value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Input can not be empty';
                                        }
                                      },
                                      style: const TextStyle(color: Colors.black),
                                      onChanged: (value) {
                                        widget.memberMeasurement[i] = _inputController.text;
                                      },
                                      autocorrect: true,
                                      decoration: InputDecoration(
                                        errorStyle: const TextStyle(color: Colors.red),
                                        fillColor: Colors.black54,
                                        labelText: widget.memberMeasurement.values.elementAt(i),
                                        //hintText: 'Email',
                                        filled: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            */
                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
