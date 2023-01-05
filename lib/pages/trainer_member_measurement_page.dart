import 'package:flutter/material.dart';
import 'package:hypegym/pages/trainer_member_measurement_edit_page.dart';

// I can not do the change body measurement part
class TrainerMemberMeasurementPage extends StatefulWidget {
  const TrainerMemberMeasurementPage({Key? key}) : super(key: key);

  @override
  State<TrainerMemberMeasurementPage> createState() => _TrainerMemberMeasurementPageState();
}

class _TrainerMemberMeasurementPageState extends State<TrainerMemberMeasurementPage> {

  Map<String, String> measurementMap = {'Kilogram': '80kg', 'Height': '165cm', 'Wrist': '20cm', 'Chest': '20cm', 'Waist': '20cm', 'Hip': '20cm', 'Arm': '20cm', 'Forearm': '20cm', 'Leg': '20cm', 'Calf': '20cm', 'Neck': '20cm'};

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
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.greenAccent.shade400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: measurementMap.length,
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
                                      measurementMap.keys.elementAt(i),
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
                            Padding(
                              padding: const EdgeInsets.only(left: 20.0, right: 10.0,),
                              child: SizedBox(
                                height: 35.0,
                                width: 70.0,
                                child: Card(
                                  color: Colors.white70,
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Text(
                                      measurementMap.values.elementAt(i),
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                  ),
                                ),
                              ),
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
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => MeasurementEditPage(measurementMap)));
        },
        backgroundColor: Colors.greenAccent.shade400,
        foregroundColor: Colors.black,
        child: const Icon(Icons.edit),
      ),
    );
  }
}
