import 'package:flutter/material.dart';
import 'package:hypegym/pages/admin_gym_page.dart';
import 'package:hypegym/pages/member_gym_page.dart';
import 'package:hypegym/pages/trainer_gym_page.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/user.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage(this.user, {super.key});
  final UserDto? user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final ApiService apiService = ApiService();
  final GlobalKey<FormState> _formKey = GlobalKey();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _addressController = TextEditingController();
  late int? tID = widget.user?.ID;
  late String? tGender = widget.user?.gender;
  late String? tName = widget.user?.name;
  late String? tEmail = widget.user?.email;
  late String? tPhone = widget.user?.phone_number;
  late String? tAddress = widget.user?.address;

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
                      "Change User Data",
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
                          onChanged: (value) {
                            setState(() {
                              tName = value;
                            });
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: widget.user?.name,
                              hintText: 'Name',
                              enabledBorder: const OutlineInputBorder(
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
                          onChanged: (value) {
                            setState(() {
                              tEmail = value;
                            });
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: widget.user?.email,
                              hintText: 'Email',
                              enabledBorder: const OutlineInputBorder(
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
                          onChanged: (value) {
                            setState(() {
                              tPhone = value;
                            });
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: widget.user?.phone_number,
                              hintText: 'Phone Number',
                              enabledBorder: const OutlineInputBorder(
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
                          controller: _addressController,
                          onChanged: (value) {
                            setState(() {
                              tAddress = value;
                            });
                          },
                          decoration: InputDecoration(
                              filled: true,
                              fillColor: Colors.white,
                              labelText: widget.user?.address,
                              hintText: 'Address',
                              enabledBorder: const OutlineInputBorder(
                                borderRadius: BorderRadius.all(Radius.circular(20.0)),
                                borderSide:
                                BorderSide(color: Colors.grey, width: 0.0),
                              ),
                              border: const OutlineInputBorder()
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
                                groupValue: tGender,
                                onChanged: (value) {
                                  setState(() {
                                    tGender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                activeColor: Colors.greenAccent.shade400,
                                secondary: const Icon(Icons.female, color: Colors.white,),
                                controlAffinity: ListTileControlAffinity.trailing,
                                title: const Text('Female', style: TextStyle(color: Colors.white),),
                                value: 'FEMALE',
                                groupValue: tGender,
                                onChanged: (value) {
                                  setState(() {
                                    tGender = value.toString();
                                  });
                                },
                              ),
                              RadioListTile<String>(
                                activeColor: Colors.greenAccent.shade400,
                                secondary: const Icon(Icons.transgender, color: Colors.white,),
                                controlAffinity: ListTileControlAffinity.trailing,
                                title: const Text('Other', style: TextStyle(color: Colors.white),),
                                value: 'OTHER',
                                groupValue: tGender,
                                onChanged: (value) {
                                  setState(() {
                                    tGender = value.toString();
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height/25,),
                      ElevatedButton(
                        onPressed: () async {
                          // Validate returns true if the form is valid, or false otherwise.
                          apiService.editUser(tID!,
                              tName!,
                              tEmail!,
                              tPhone!,
                              tGender!,
                              tAddress!);
                          if(widget.user?.role == "SUPERADMIN") {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const AdminGymPage()));
                          } else if(widget.user?.role == "PT") {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const TrainerGymPage()));
                          } else if(widget.user?.role == "MEMBER") {
                            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MemberGymPage()));
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
                        child: const Text("Update User"),
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
