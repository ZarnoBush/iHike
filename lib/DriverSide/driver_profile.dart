import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/signup_controller.dart';
import 'package:hike/UserSide/user_home_page.dart';
import 'package:hike/Widgets/detail_tag_widget.dart';
import 'package:hike/Widgets/mutli_destinations.dart';

class DriverProfile extends StatelessWidget {
  DriverProfile({super.key});

   final SignupController signupController = Get.find();

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
              child: Align(
                alignment: Alignment.bottomRight,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Icon(Icons.call_rounded),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(Icons.message_rounded),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Obx(
                () =>  Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ListView(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          DetailTag(
                              iconData: Icons.person_pin,
                              title: 'Fullname',
                              sub_title: 'Zarno Bushula'),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DetailTag(
                          iconData: Icons.local_taxi_rounded,
                          title: 'Car Model',
                          sub_title: 'Toyota - Starlet | Silva Grey'),
                      SizedBox(
                        height: 10,
                      ),
                      DetailTag(
                          iconData: Icons.local_taxi_rounded,
                          title: 'Licence Plate',
                          sub_title: 'CA 100 - 001'),
                      SizedBox(
                        height: 10,
                      ),
                      DetailTag(
                          iconData: Icons.airline_seat_recline_normal_rounded,
                          title: 'Passanger Seats',
                          sub_title: '4'),
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
