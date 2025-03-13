import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/display_schedule_controller.dart';
import 'package:hike/Controllers/preview_controller.dart';
import 'package:hike/UserSide/user_home_page.dart';
import 'package:hike/Widgets/detail_tag_widget.dart';
import 'package:hike/Widgets/mutli_destinations.dart';

class UserDriverProfilePage extends StatelessWidget {
  UserDriverProfilePage({
    super.key,
    required this.postId,
  });

  final int postId;

  PreviewController _previewController = Get.put(PreviewController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Driver Profile',
        ),
        centerTitle: true,
      ),
      body: FutureBuilder<Map<String, dynamic>>(
          future: _previewController.fetchPostWithUser(postId),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text('No data found'),
              );
            }
            var post = snapshot.data!;
            return Column(
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
                      child: Container(
                        child: ListView(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DetailTag(
                                    iconData: Icons.person_pin,
                                    title: 'Fullname',
                                    sub_title: post['fullname']),
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
                                iconData:
                                    Icons.airline_seat_recline_normal_rounded,
                                title: 'Passanger Seats',
                                sub_title: '4'),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: Column(
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
                                      iconData: Icons.local_taxi_rounded,
                                      title: 'From',
                                      sub_title: post['sch_from']),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  MultiDestinations(
                                    iconData: Icons.location_pin,
                                    title: 'Destination',
                                    sub_title: post['sch_to'],
                                    subbtitle: post['sch_to'],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      DetailTag(
                                          iconData: Icons
                                              .airline_seat_recline_normal_rounded,
                                          title: 'Seats Left',
                                          sub_title: post['sch_seats']),
                                     
                                    ],
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DetailTag(
                                      iconData: Icons.timer_rounded,
                                      title: 'Pickup Time',
                                      sub_title: post['post_time']),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DetailTag(
                                      iconData: Icons.description_rounded,
                                      title: 'Description',
                                      sub_title: 'Ride Discription thought and write here'),
                                      SizedBox(
                                    height: 10,
                                  ),
                                  // DetailTag(
                                  //     iconData: Icons.description_rounded,
                                  //     title: 'Description',
                                  //     sub_title:
                                  //         'Write a password generator in Dart. Be creative with how you generate passwords - strong passwords have a mix of lowercase letters, uppercase letters, numbers, and symbols. The passwords should be random, generating a new password every time the user asks for a new password. Include your run-time code in a main method'),
                                ],
                              ),
                            )
                          ],
                        ),
                      )),
                ),
                // Padding(
                //   padding: const EdgeInsets.all(8.0),
                //   child: Container(
                //     decoration: BoxDecoration(
                //         color: Colors.black,
                //         borderRadius: BorderRadius.circular(2)),
                //     child: Padding(
                //       padding: const EdgeInsets.all(8.0),
                //       child: Center(
                //         child: Text(
                //           'Request Ride',
                //           style: TextStyle(color: Colors.white),
                //         ),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            );
          }),
    );
  }
}
