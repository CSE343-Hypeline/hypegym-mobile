import 'package:flutter/material.dart';

class MeasurementEditPage extends StatefulWidget {
  const MeasurementEditPage(this.memberMeasurement, {super.key});
  final Map memberMeasurement;
  @override
  State<MeasurementEditPage> createState() => _MeasurementEditPageState();
}

class _MeasurementEditPageState extends State<MeasurementEditPage> {
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
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.white70,
                                ),
                                child: Text(
                                  widget.memberMeasurement.values.elementAt(i),
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                                onPressed: () {
                                  showAlertDialog(context, widget.memberMeasurement, i);
                                  setState(() {
                                    //refresh UI after deleting element from list
                                  });
                                },
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
/*
showAlertDialog(BuildContext context, Map memberMeasurement, int index) {
  final inputController = TextEditingController();
  Widget measurementsButton = TextFormField(
    controller: inputController,
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Input can not be empty!!!';
      }
    },
    onChanged: (value) {
      memberMeasurement[index] = inputController.text;
    },
    autocorrect: true,
  );
  Widget elevatedButton = SizedBox(
    height: 35.0,
    width: 200.0,
    child: ElevatedButton(
      child: const Text(
        'Update',
        style: TextStyle(fontSize: 40),
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
  );
  AlertDialog alert = AlertDialog(
    backgroundColor: Colors.grey.shade900,
    title: const Text(
      "User Measurement",
      style: TextStyle(color: Colors.white),
    ),
    content: const Text(
      "Enter the new measurement",
      style: TextStyle(color: Colors.white),
    ),
    actions: [
      measurementsButton,
      elevatedButton,
    ],
  );
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
}
*/