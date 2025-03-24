import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/registration_controller.dart';

class CustomDropdownbutton extends StatelessWidget {
  String? optionOne, optionTwo;
  CustomDropdownbutton({this.optionOne, this.optionTwo});

  RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return 
    Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: DropdownButtonFormField<String>(
        value: registrationController.selectedRole,
        decoration: InputDecoration(
          labelText: "Select Role",
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        ),
        items: [optionOne, optionTwo].map((role) {
          return DropdownMenuItem(
            value: role,
            child: Text(role!),
          );
        }).toList(),
        onChanged: (newRole) {
          registrationController.selectedRole = newRole!;
        },
      ),
    );
  }
}
