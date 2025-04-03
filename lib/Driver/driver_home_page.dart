import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hike/Colors/app_colors.dart';
import 'package:hike/Controllers/fetch_travels_controller.dart';
import 'package:hike/Controllers/login_controller.dart';
import 'package:hike/Controllers/travel_post_controller.dart';
import 'package:hike/Pages/driver_information_page.dart';
import 'package:hike/Pages/ride_information_page.dart';
import 'package:hike/Rider/rider_home_page.dart';
import 'package:hike/Pages/schedule_form_page.dart';
import 'package:hike/Widgets/custom_widgets.dart';

class DriverHomePage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  final FetchTravelsController _fetchTravelsController =
      Get.put(FetchTravelsController());
  final TravelPostController travelPostController =
      Get.put(TravelPostController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Driver", style: GoogleFonts.albertSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),)),
      drawer: CustomDrawer(
        loginController: _loginController,
        username: _loginController.fullName.toString(),
        homePage: '/driver_home_page',
        travelPage: '/request_page',
        despatchPage: '/despatch_page',
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () {
          Get.to(ScheduleFormPage());
        },
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchTravelsController
            .fetchTravels("Driver"), // Fetch Driver trips
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No available rides"));
          }

          final travels = snapshot.data!;

          return ListView.builder(
              itemCount: travels.length,
              itemBuilder: (context, index) {
                final travel = travels[index];
                return Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: InkWell(
                    onTap: () {
                      travelPostController.travelId.value =
                          int.tryParse(travel['travel_id'].toString())!;

                      print(
                          'Updated Travel ID : ${travelPostController.travelId.value}');
                      print('Username: ${travel['fullname']}');
                      print("User ID: ${travel['user_id']}");

                      Get.to(DriverInformationPage(
                        username: travel['fullname'],
                        travel_id:
                            travelPostController.travelId.value.toString(),
                        fromText: travel['travel_pick_up'],
                        toText: travel['travel_drop_off'],
                        timeDateText:
                            '${travel['travel_date']} | ${travel['travel_time']}',
                      ));
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColors.secondary,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
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
                                SizedBox(
                                  width: 10,
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(
                                      text: '${travel['travel_pick_up']}',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    CustomText(
                                      text: '${travel['travel_drop_off']}',
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                    CustomText(
                                      text:
                                          '${travel['travel_date']} | ${travel['travel_time']}',
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.safety_divider_rounded, color: Colors.white,),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText(
                                    text: '${travel['travel_passengers']}',
                                    color: Colors.black,
                                    fontSize: 14)
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}
