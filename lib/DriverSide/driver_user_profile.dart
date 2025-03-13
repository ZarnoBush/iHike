import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/UserSide/user_home_page.dart';
import 'package:hike/Widgets/detail_tag_widget.dart';
import 'package:hike/Widgets/mutli_destinations.dart';

class DriverUserProfile extends StatelessWidget {
  const DriverUserProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hiker Profile',
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
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Icon(
                      Icons.call_rounded,
                      color: Colors.black,
                    ),
                    SizedBox(
                      width: 30,
                    ),
                    Icon(
                      Icons.message_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              flex: 2,
              child: Padding(
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
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Travelling Details:',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 14,
                              fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        DetailTag(
                            iconData: Icons.emoji_people_rounded,
                            title: 'Pickup From',
                            sub_title: 'Cape Town'),
                        SizedBox(
                          height: 10,
                        ),
                        DetailTag(
                            iconData: Icons.location_pin,
                            title: 'Destination',
                            sub_title: 'Worcester'),
                        SizedBox(
                          height: 10,
                        ),
                        DetailTag(
                            iconData: Icons.airline_seat_recline_normal_rounded,
                            title: 'Passangers',
                            sub_title: '4'),
                        SizedBox(
                          height: 10,
                        ),
                        DetailTag(
                            iconData: Icons.timer_rounded,
                            title: 'Pickup Time',
                            sub_title: '14h00 | Today'),
                        SizedBox(
                          height: 10,
                        ),
                      //   DetailTag(
                      //       iconData: Icons.description_rounded,
                      //       title: 'Description',
                      //       sub_title:
                      //           'Write a password generator in Dart. Be creative with how you generate passwords - strong passwords have a mix of lowercase letters, uppercase letters, numbers, and symbols. The passwords should be random, generating a new password every time the user asks for a new password. Include your run-time code in a main method'),
                      // 
                      ],
                    )
                  ],
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
                    'Accept Request',
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
