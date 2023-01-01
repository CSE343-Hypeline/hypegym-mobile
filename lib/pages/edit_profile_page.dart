import 'package:flutter/material.dart';
import 'package:hypegym/services/api_service.dart';
import 'package:hypegym/models/user.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage(this.user, {super.key});
  final UserDto user;

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final ApiService apiService = ApiService();

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
          ListView(
            physics: const BouncingScrollPhysics(),
            children: [
              TextFormField(
                controller: TextEditingController(text: widget.user.email),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Name can not be empty';
                  }
                },
                onFieldSubmitted: (val){
                  //widget.user.email = val;     //this will be name
                },
              ),
              TextFormField(
                controller: TextEditingController(text: widget.user.email),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Email can not be empty';
                  }
                },
                onFieldSubmitted: (val){
                  //widget.user.email = val;
                },
              ),
              TextFormField(
                controller: TextEditingController(text: widget.user.email),
                keyboardType: TextInputType.text,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Phone can not be empty';
                  }
                },
                onFieldSubmitted: (val){
                  //widget.user.email = val; //this will be phone number
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
