import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/signup_controller.dart';
import 'package:hike/Controllers/user_profile_controller.dart';
import 'package:hike/UserSide/user_home_page.dart';
import 'package:hike/Widgets/detail_tag_widget.dart';
import 'package:hike/Widgets/mutli_destinations.dart';

class UserProile extends StatelessWidget {
  UserProile({super.key});

   final ProfileController _signupController = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'User Profile',
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 250,
              decoration: BoxDecoration(
                  color: Colors.grey,
                  image: DecorationImage(
                      image: AssetImage('images/swinging.gif'),
                      fit: BoxFit.cover)),
            ),
          ),
          Expanded(
              flex: 2,
              child: Obx(
                () => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailTag(
                              iconData: Icons.person_pin,
                              title: 'Fullname',
                              sub_title: _signupController.userProfile.value.fullname),
                          Row(
                            children: [
                              Icon(Icons.call_rounded),
                              SizedBox(
                                width: 30,
                              ),
                              Icon(Icons.message_rounded),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, borderRadius: BorderRadius.circular(2)),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    'Save Changes',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
