import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Colors/app_colors.dart';
import 'package:hike/Controllers/bookings_controller.dart';
import 'package:hike/Controllers/login_controller.dart';
import 'package:hike/Controllers/travel_post_controller.dart';
import 'package:hike/Pages/ride_information_page.dart';
import 'package:hike/Rider/rider_home_page.dart';
import 'package:hike/Widgets/custom_button.dart';
import 'package:hike/Widgets/custom_widgets.dart';

class RideRequestsPage extends StatelessWidget {
  RideRequestsPage({super.key});
  final TravelPostController travelPostController =
      Get.put(TravelPostController());
  final LoginController loginController = Get.put(LoginController());
  final BookingsController bookingsController = Get.put(BookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Ride Requests")),
      drawer: CustomDrawer(
        loginController: loginController,
        username: loginController.fullName.toString(),
        homePage: '/driver_home_page',
        travelPage: '/request_page',
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: bookingsController.fetchBookingsForScheduler(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          }

          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No bookings found"));
          }

          List<Map<String, dynamic>> groupedBookings = snapshot.data!;

          return ListView.builder(
            itemCount: groupedBookings.length,
            itemBuilder: (context, index) {
              var group = groupedBookings[index];

              return Padding(
                padding: const EdgeInsets.all(2.0),
                child: ExpansionTile(
                  backgroundColor: AppColors.primary,
                  collapsedIconColor: AppColors.text,
                  title: Text(
                    "${group["drop_off_location"]}",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: AppColors.text),
                  ),
                  children: group["bookings"].map<Widget>((booking) {
                    return InkWell(
                      onTap: () => Get.defaultDialog(
                        title: 'Accept Request',
                        titleStyle: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
                        content: Column(
                          children: [
                            CustomDialogContent(
                              titleText: 'Current Location',
                              subText: '${booking['pick_up_location']}',
                              iconData: Icons.person_pin,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomDialogContent(
                              titleText: 'Destination Location',
                              subText: '${booking['drop_off_location']}',
                              iconData: Icons.location_pin,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomDialogContent(
                              titleText: 'Number of Passengers',
                              subText: '${booking['number_of_passengers']}',
                              iconData: Icons.safety_divider_outlined,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            CustomDialogContent(
                              titleText: 'Description',
                              subText: 'No Description...',
                              iconData: Icons.description,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                          ],
                        ),
                        cancel: Padding(
                          padding:
                              const EdgeInsets.only(right: 12.0, bottom: 8.0),
                          child: Text(
                            'Cancel',
                            style: TextStyle(color: Colors.red),
                          ),
                        ),
                        confirm: Padding(
                          padding:
                              const EdgeInsets.only(left: 12.0, bottom: 8.0),
                          child: Text('Accept',
                              style: TextStyle(color: Colors.green)),
                        ),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(10),
                        ),
                        margin: EdgeInsets.symmetric(
                            vertical: 4.0, horizontal: 8.0),
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: 30,
                                  backgroundImage:
                                      AssetImage("images/swinging.gif"),
                                ),
                                SizedBox(width: 10),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Text(
                                    //   '${booking['booker_name']}',
                                    //   style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                                    // ),
                                    Text('${booking['pick_up_location']}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text('${booking['drop_off_location']}',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.safety_divider_rounded),
                                SizedBox(width: 5),
                                Text('${booking['number_of_passengers']}',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black))
                              ],
                            )
                          ],
                        ),
                      ),
                    );
                  }).toList(),
                ),
              );
            },
          );
        },
      ),
    );
  }
}

class CustomDialogContent extends StatelessWidget {
  String? titleText, subText;
  IconData? iconData;
  CustomDialogContent({
    super.key,
    required this.titleText,
    required this.subText,
    required this.iconData,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(iconData),
          SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '$titleText :',
                style: TextStyle(color: Colors.black),
              ),
              Text(subText!, style: TextStyle(color: Colors.black)),
            ],
          )
        ],
      ),
    );
  }
}
