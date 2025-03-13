import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/display_schedule_controller.dart';
import 'package:hike/UserSide/user_driver_profile_page.dart';
import 'package:hike/Utils/loader.dart';
import 'package:hike/Widgets/available_ride_list.dart';
import 'package:hike/Widgets/detail_tag_widget.dart';
import 'package:hike/Widgets/mutli_destinations.dart';

class UserHomePage extends StatelessWidget {
  UserHomePage({super.key});

  final _display_schedule = Get.put(DisplayScheduleController());

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      UserAppBar(),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              labelText: 'where to?',
                              labelStyle:
                                  TextStyle(fontStyle: FontStyle.italic),
                              suffixIcon: Icon(
                                Icons.local_taxi,
                                color: Colors.black,
                              )),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                            left: 8.0, right: 8.0, top: 8.0, bottom: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Available Rides:',
                              style: TextStyle(
                                  fontWeight: FontWeight.w500, fontSize: 16),
                            ),
                          ],
                        ),
                      )
                    ],
                  )),
              Expanded(
                flex: 3,
                child: FutureBuilder<List<dynamic>>(
                    future: _display_schedule.displaySchedule(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Loader();
                      } else if (snapshot.hasError) {
                        return Center(child: Text('Error: ${snapshot.error}'));
                      } else if (!snapshot.hasData) {
                        return Center(child: Text('No data found'));
                      }

                      // Data is available, display posts in a ListView
                      var posts = snapshot.data!;
                      return ListView.builder(
                        itemCount: posts.length,
                        itemBuilder: (context, index) {
                          var post = posts[index];
                          return GestureDetector(
                            onTap: () {
                              if (post['sch_id'] != null) {
                                int postId =
                                    int.tryParse(post['sch_id'].toString()) ??
                                        0; // Convert safely to int
                                Get.to(() => UserDriverProfilePage(
                                      postId: postId,
                                    ));
                              } else {
                                Get.snackbar(
                                    'Driver not found', 'Driver not found');
                              }
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(
                                  left: 8.0, right: 8.0, top: 4.0),
                              child: Container(
                                color: Colors.grey.shade200,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: AvailableRideList(
                                    iconData: Icons.local_taxi_rounded,
                                    text_one:
                                        post['sch_from'] ?? 'Location not set',
                                    text_two:
                                        post['sch_to'] ?? 'Destination not set',
                                    text_three:
                                        post['post_time'] ?? 'Time not set',
                                    seats_left: post['sch_seats'] ??
                                        'Passengers not set',
                                  ),
                                ),
                              ),
                            ),
                          );
                        },
                      );
                    }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class UserLocations extends StatelessWidget {
  UserLocations(
      {super.key,
      required this.iconData,
      required this.locationTag,
      required this.location});

  IconData? iconData;
  String? locationTag;
  String? location;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              iconData,
              color: Colors.black,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  locationTag!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 10,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  location!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w600),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}

class UserAppBar extends StatelessWidget {
  const UserAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'iHike',
            style: TextStyle(
                color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold),
          ),
          Icon(
            Icons.emoji_people_rounded,
            color: Colors.black,
            size: 20,
          ),
        ],
      ),
    );
  }
}
