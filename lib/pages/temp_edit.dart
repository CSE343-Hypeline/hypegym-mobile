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
                            Row(
                              children: [
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
                                          controller: _inController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty) {
                                              return 'Input can not be empty';
                                            }
                                          },
                                          style: const TextStyle(color: Colors.white),
                                          onChanged: (value) {},
                                          autocorrect: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    widget.memberMeasurement[widget.memberMeasurement.keys.elementAt(i)] = _inController.text;
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.greenAccent.shade400,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(5)
                                    ),
                                    minimumSize: const Size(50, 50),
                                    maximumSize: const Size(50, 50),
                                  ),
                                  child: const Icon(Icons.add),
                                ),
                              ],
                            ),
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