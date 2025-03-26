import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hike/Colors/app_colors.dart';
import 'package:hike/Controllers/date_time_controller.dart';
import 'package:hike/Controllers/fetch_travels_controller.dart';
import 'package:hike/Controllers/login_controller.dart';
import 'package:hike/Controllers/travel_post_controller.dart';
import 'package:hike/Pages/ride_information_page.dart';
import 'package:hike/Pages/schedule_form_page.dart';
import 'package:hike/Widgets/custom_button.dart';
import 'package:hike/Widgets/custom_widgets.dart';

class RiderHomePage extends StatelessWidget {
  final LoginController _loginController = Get.put(LoginController());
  final FetchTravelsController _fetchTravelsController =
      Get.put(FetchTravelsController());
  final DateTimeController controller = Get.put(DateTimeController());
  final TravelPostController travelPostController =
      Get.put(TravelPostController());
  final storage = FlutterSecureStorage();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rider", style: GoogleFonts.albertSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),),
      ),
      drawer: CustomDrawer(
        loginController: _loginController,
        username: _loginController.fullName.toString(),
        homePage: '/rider_home_page',
        travelPage: '/request_page',
      ),
      floatingActionButton: FloatingActionButton(
        mini: true,
        onPressed: () => Get.to(ScheduleFormPage()),
        child: Icon(Icons.add),
      ),
      body: FutureBuilder<List<Map<String, dynamic>>>(
        future: _fetchTravelsController
            .fetchTravels("Rider"), // Fetch Rider requests
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return Center(child: Text("No rider requests"));
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
                          int.parse(travel['travel_id'].toString());
                      print(
                          'Updated Travel ID : ${travelPostController.travelId.value}');
                      print("Full Name: ${travel['fullname']}");
                      print("User ID: ${travel['user_id']}");
                      Get.to(RideInformationPage(
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
                                      color: AppColors.text,
                                      fontSize: 14,
                                    ),
                                    CustomText(
                                      text: '${travel['travel_drop_off']}',
                                      color: AppColors.text,
                                      fontSize: 14,
                                    ),
                                    CustomText(
                                      text:
                                          '${travel['travel_date']} | ${travel['travel_time']}',
                                      color: AppColors.text,
                                      fontSize: 12,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Icon(Icons.safety_divider_rounded, color: AppColors.text,),
                                SizedBox(
                                  width: 5,
                                ),
                                CustomText(
                                    text: '${travel['travel_passengers']}',
                                    color:AppColors.text,
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

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
    super.key,
    required LoginController loginController,
    this.username,
    required this.homePage,
    this.travelPage,
    this.profilePage,
  }) : _loginController = loginController;

  final LoginController _loginController;
  String? username;
  String? homePage;
  String? travelPage;
  String? profilePage;
  Color color = AppColors.text;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.primary,
      shape: Border(),
      elevation: 4,
      child: ListView(
        children: [
          Container(
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/swinging.gif"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    username!,
                    style: GoogleFonts.albertSans(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(Icons.home, color: color),
            title: Text("Home", style: GoogleFonts.albertSans(color: color),),
            onTap: () {
              Get.back();
              Get.toNamed(homePage!);
            },
          ),
          ListTile(
            leading: Icon(Icons.list_alt_rounded, color: color),
            title: Text("Requests", style: GoogleFonts.albertSans(color: color),),
            onTap: () {
              Get.back();
              Get.toNamed(travelPage!);
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: color),
            title: Text("Profile", style: GoogleFonts.albertSans(color: color)),
            onTap: () {
              Get.back();
              Get.toNamed(profilePage!);
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.logout, color: color,),
            title: Text("Logout", style: GoogleFonts.albertSans(color: color)),
            onTap: _loginController.logout,
          ),
        ],
      ),
    );
  }
}
