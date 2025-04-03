import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hike/Colors/app_colors.dart';
import 'package:hike/Controllers/login_controller.dart';
import 'package:hike/Rider/rider_home_page.dart';
import 'package:hike/Widgets/custom_widgets.dart';

class DepatchPage extends StatelessWidget {
  DepatchPage({super.key});

  final LoginController _loginController = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Despatch',
            style: GoogleFonts.albertSans(
              fontSize: 18,
              fontWeight: FontWeight.w400,
            )),
      ),
      drawer: CustomDrawer(
        loginController: _loginController,
        username: _loginController.fullName.toString(),
        homePage: '/driver_home_page',
        travelPage: '/request_page',
        despatchPage: '/despatch_page',
      ),
      body: Center(
        child: Column(
          children: [
            Card(
              child: Container(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text('Pending...',
                          style: GoogleFonts.albertSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w400,
                            color: Colors.black
                          )),
                          Icon(Icons.cancel, color: Colors.red,)
                      ],),
                      SizedBox(height: 15,),
                      Container(
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
                                        text: '${'travel_pick_up'}',
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      CustomText(
                                        text: '${'travel_drop_off'}',
                                        color: Colors.black,
                                        fontSize: 14,
                                      ),
                                      CustomText(
                                        text:
                                            '${'travel_date'} | ${'travel_time'}',
                                        color: Colors.black,
                                        fontSize: 12,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Icon(
                                    Icons.safety_divider_rounded,
                                    color: Colors.white,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  CustomText(
                                      text: '0',
                                      color: Colors.black,
                                      fontSize: 14)
                                ],
                              )
                            ],
                          ),
                        ),
                      ),

                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
