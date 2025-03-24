import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/login_controller.dart';
import 'package:hike/Widgets/custom_button.dart';

import 'signup_page.dart';

class RiderLoginPage extends StatelessWidget {
  RiderLoginPage({super.key});

  LoginController loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all()),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.emoji_people_rounded,
                      size: 60,
                    ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Column(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Welcome Rider!',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    Text(
                      'Continue by Login to your account.',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: loginController.phoneNumberController,
                  isPassword: false,
                  textHolder: 'Phone Number',
                ),
                SizedBox(
                  height: 10,
                ),
                CustomTextField(
                  controller: loginController.passwordController,
                  isPassword: true,
                  textHolder: 'Password',
                ),
                SizedBox(
                  height: 10,
                ),
                InkWell(
                    onTap: () => loginController.login(),
                    child: CustomButton(
                      textHolder: 'Log In',
                    ),
                  ),
                
                SizedBox(
                  height: 20,
                ),
                Text(
                  'OR',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w200,
                      ),
                    ),
                    InkWell(
                      onTap: () => Get.toNamed('/rider_signup'),
                      child: Text(
                        'Sign Up here',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
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
