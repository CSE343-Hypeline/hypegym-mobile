import 'package:flutter/material.dart';
import 'package:hypegym/pages/gym_admin_pages/admin_gym_page.dart';
import 'package:hypegym/services/api_service.dart';

class UserAddPage extends StatefulWidget {
  const UserAddPage(this.tempNumber, {super.key});

  final int tempNumber;

  @override
  State<UserAddPage> createState() => _UserAddPageState();
}

class _UserAddPageState extends State<UserAddPage> {
  final GlobalKey<FormState> _formKey = GlobalKey();
  final ApiService apiService = ApiService();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  String gender = 'MALE';
  String dropdownValue = '1 Month';
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
                Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: MediaQuery.of(context).size.height/9,
                        width: MediaQuery.of(context).size.width/1.5,
                        child: TextFormField(
                          controller: _nameController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Name must contain a value';
                            }
                          },
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
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/9,
                        width: MediaQuery.of(context).size.width/1.5,
                        child: TextFormField(
                          controller: _emailController,
                          validator: (value) {
                            if (value == null || value.isEmpty || value.length < 3) {
                              return 'Email must contain at least 3 characters';
                            }
                          },
                          onChanged: (value) {},
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
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/9,
                        width: MediaQuery.of(context).size.width/1.5,
                        child: TextFormField(
                          controller: _passwordController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Password must contain a value';
                            }
                          },
                          onChanged: (value) {},
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Password',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              border: OutlineInputBorder()),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/9,
                        width: MediaQuery.of(context).size.width/1.5,
                        child: TextFormField(
                          controller: _phoneNumberController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Phone number must contain a value';
                            }
                          },
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Phone Number',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/9,
                        width: MediaQuery.of(context).size.width/1.5,
                        child: TextFormField(
                          controller: _addressController,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Address must contain a value';
                            }
                          },
                          decoration: const InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: 'Address',
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              border: OutlineInputBorder()
                          ),
                        ),
                      ),
                      Theme(
                        data: ThemeData(unselectedWidgetColor: Colors.white),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height/3,
                          width: MediaQuery.of(context).size.width/1.5,
                          child: ListView(
                            children: [
                              Text("Gender", style: TextStyle(color: Colors.greenAccent.shade400, fontWeight: FontWeight.bold, fontSize: 15.0,),),
                              //SizedBox(height: MediaQuery.of(context).size.height/30,),
                              RadioListTile<String>(
                                activeColor: Colors.greenAccent.shade400,
                                secondary: const Icon(Icons.male, color: Colors.white,),
                                controlAffinity: ListTileControlAffinity.trailing,
                                title: const Text('Male', style: TextStyle(color: Colors.white),),
                                value: 'MALE',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                activeColor: Colors.greenAccent.shade400,
                                secondary: const Icon(Icons.female, color: Colors.white,),
                                controlAffinity: ListTileControlAffinity.trailing,
                                title: const Text('Female', style: TextStyle(color: Colors.white),),
                                value: 'FEMALE',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                activeColor: Colors.greenAccent.shade400,
                                secondary: const Icon(Icons.transgender, color: Colors.white,),
                                controlAffinity: ListTileControlAffinity.trailing,
                                title: const Text('Other', style: TextStyle(color: Colors.white),),
                                value: 'OTHER',
                                groupValue: gender,
                                onChanged: (value) {
                                  setState(() {
                                    gender = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/35,),
                      SizedBox(
                        height: MediaQuery.of(context).size.height/7,
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Membership",
                              style: TextStyle(
                                color: Colors.greenAccent.shade400,
                                fontWeight: FontWeight.bold,
                                fontSize: 15.0,),
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height/60,),
                            DropdownButtonFormField(
                              decoration: const InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white, width: 2),
                                ),
                                filled: true,
                                fillColor: Colors.white,
                              ),
                              dropdownColor: Colors.white,
                              value: dropdownValue,
                              onChanged: (String? newValue) {
                                setState(() {
                                  dropdownValue = newValue!;
                                });
                              },
                              items: <String>['1 Month', '2 Months', '3 Months', '6 Months','9 Months','12 Months'].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: const TextStyle(fontSize: 15),
                                  ),
                                );
                              }).toList(),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/25,),
                      ElevatedButton(
                        onPressed: () async {
                          // Validate returns true if the form is valid, or false otherwise.
                          if (_formKey.currentState!.validate() && gender != null) {
                            String userType = '';
                            if(widget.tempNumber == 1) {
                              userType = 'MEMBER';
                            }
                            if(widget.tempNumber == 2) {
                              userType = 'PT';
                            }
                            var res = await apiService.addUser(_nameController.text, _emailController.text, _passwordController.text, _phoneNumberController.text, gender,_addressController.text, 1, userType);
                            switch (res!.statusCode) {
                              case 201:
                                print('added member');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminGymPage()));
                                break;
                              default:
                                print('member not added');
                                Navigator.push(context, MaterialPageRoute(builder: (context) => const AdminGymPage()));
                                break;
                            }
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.greenAccent.shade400,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25)
                          ),
                          minimumSize: const Size(200, 50),
                          maximumSize: const Size(200, 50),
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