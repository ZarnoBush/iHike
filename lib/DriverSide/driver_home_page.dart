import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Widgets/available_ride_list.dart';
import 'package:hike/Widgets/detail_tag_widget.dart';
import 'package:hike/Widgets/mutli_destinations.dart';

class DriverHomePage extends StatelessWidget {
  const DriverHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
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
                            labelStyle: TextStyle(fontStyle: FontStyle.italic),
                            suffixIcon: Icon(
                              Icons.emoji_people_rounded,
                              color: Colors.black,
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          left: 8.0, right: 8.0, bottom: 8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Available Hikes:',
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
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => Get.defaultDialog(
                        title: 'Confirm Ride',
                        titleStyle: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w400),
                        content: Column(
                          children: [
                            DetailTag(
                              iconData: Icons.emoji_people_rounded,
                              title: 'Pickup From',
                              sub_title: 'Cape Town',
                            ),
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
                                sub_title: '2'),
                            SizedBox(
                              height: 10,
                            ),
                            DetailTag(
                              iconData: Icons.timer_rounded,
                              title: 'Pickup Time',
                              sub_title: '14h00 | Today',
                            ),
                          ],
                        ),
                        textCancel: 'Cancel',
                        cancelTextColor: Colors.black,
                        textConfirm: 'Confirm',
                        buttonColor: Colors.black),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 8.0, top: 4.0),
                      child: Container(
                        // elevation: 4,
                        color: Colors.grey.shade200,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: AvailableRideList(
                            // onTap: () => Get.toNamed('/driver_user_profile'),
                            iconData: Icons.emoji_people_rounded,
                            text_one: 'Cape Town',
                            text_two: 'Worcester',
                            text_three: '14h00 | Today',
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// class UserLocations extends StatelessWidget {
//   UserLocations(
//       {super.key,
//       required this.iconData,
//       required this.locationTag,
//       required this.location});

//   IconData? iconData;
//   String? locationTag;
//   String? location;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         Row(
//           children: [
//             Icon(
//               iconData,
//               color: Colors.black,
//             ),
//             SizedBox(
//               width: 10,
//             ),
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(
//                   locationTag!,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 10,
//                       fontWeight: FontWeight.w600),
//                 ),
//                 Text(
//                   location!,
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 12,
//                       fontWeight: FontWeight.w600),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ],
//     );
//   }
// }

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
