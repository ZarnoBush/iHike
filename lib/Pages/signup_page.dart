import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hike/Controllers/registration_controller.dart';
import 'package:hike/Utils/loader.dart';
import 'package:hike/Widgets/custom_button.dart';
import 'package:hike/Widgets/custom_dropdownbutton.dart';

class RiderSignupPage extends StatelessWidget {
  RiderSignupPage({super.key});

  RegistrationController registrationController =
      Get.put(RegistrationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Rider!',
                      style: GoogleFonts.albertSans(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Let\'s get started by creating a new account.',
                      style: GoogleFonts.albertSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonFormField<String>(
                    value: registrationController.selectedRole,
                    decoration: InputDecoration(
                      labelText: "Select Role",
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    items: ['Rider', 'Driver'].map((role) {
                      return DropdownMenuItem(
                        value: role,
                        child: Text(role),
                      );
                    }).toList(),
                    onChanged: (newRole) {
                      registrationController.selectedRole = newRole!;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: registrationController.fullnameController,
                  isPassword: false,
                  textHolder: 'Fullname',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: registrationController.phoneNumberController,
                  isPassword: false,
                  textHolder: 'Phone Number',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: registrationController.passwordController,
                  isPassword: true,
                  textHolder: 'Password',
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(10)),
                  child: DropdownButtonFormField<String>(
                    value: registrationController.selectedGender,
                    decoration: InputDecoration(
                      labelText: 'Select Gender',
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      contentPadding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                    ),
                    items: ['Male', 'Female'].map((role) {
                      return DropdownMenuItem(
                        value: role,
                        child: Text(role),
                      );
                    }).toList(),
                    onChanged: (newRole) {
                      registrationController.selectedGender = newRole!;
                    },
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Obx(
                  () => registrationController.isLoading.value
                      ? Loader()
                      : InkWell(
                          onTap: () => registrationController.userVerify(),
                          child: CustomButton(
                            textHolder: 'Sign Up',
                          ),
                        ),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'OR',
                  style: GoogleFonts.albertSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 5,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Already have an account? ',
                      style: GoogleFonts.albertSans(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed('/rider_login'),
                      child: Text('Log In here',
                          style: GoogleFonts.albertSans(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                              fontStyle: FontStyle.italic,
                              color: Colors.black)),
                    ),
                  ],
                )
              ],
            ),
          ))
        ],
      ),
    );
  }
}

class CustomTextField extends StatelessWidget {
  String? textHolder;
  TextEditingController? controller;
  bool? isPassword;
  CustomTextField({this.textHolder, this.controller, this.isPassword});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.grey[200], borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        controller: controller,
        obscureText: isPassword!,
        decoration: InputDecoration(
            labelText: textHolder,
            border: OutlineInputBorder(
              borderSide: BorderSide.none,
            )),
      ),
    );
  }
}
