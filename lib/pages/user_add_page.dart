import 'package:flutter/material.dart';

class UserAddPage extends StatefulWidget {
  const UserAddPage({Key? key}) : super(key: key);

  @override
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  late String name;
  late String email;
  late String phone;

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
          SingleChildScrollView(
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 80.0, bottom: 30.0),
                    child: Text(
                      "Enter User Data",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Colors.greenAccent.shade400,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 40,),
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Name',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              border: OutlineInputBorder()),
                          onFieldSubmitted: (value) {
                            setState(() {
                              name = value;
                              // firstNameList.add(firstName);
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 3) {
                              return 'First Name must contain at least 3 characters';
                            }
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Email',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              border: OutlineInputBorder()),
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 3) {
                              return 'Email must contain at least 3 characters';
                            }
                          },
                          onFieldSubmitted: (value) {
                            setState(() {
                              email = value;
                              // lastNameList.add(lastName);
                            });
                          },
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Phone Number',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              border: OutlineInputBorder()),
                          onFieldSubmitted: (value) {
                            setState(() {
                              name = value;
                              // firstNameList.add(firstName);
                            });
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 10) {
                              return 'Phone Number must contain at least 10 characters';
                            }
                          },
                        ),
                      ),
                      const SizedBox(height: 20,),
                      ElevatedButton(
                        onPressed: () {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate()) {
                            //burda backend e ekleme islemi olcak
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          minimumSize: const Size(350, 50),
                          maximumSize: const Size(350, 50),
                        ),
                        child: const Text("Add User"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
