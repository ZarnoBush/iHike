import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hike/Controllers/date_time_controller.dart';
import 'package:hike/Controllers/travel_post_controller.dart';
import 'package:hike/Fonts/app_Fonts.dart';
import 'package:hike/Pages/signup_page.dart';
import 'package:hike/Widgets/custom_button.dart';

class ScheduleFormPage extends StatelessWidget {
  ScheduleFormPage({super.key});
  final TravelPostController travelPostController =
      Get.put(TravelPostController());
  final DateTimeController controller = Get.put(DateTimeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Schedule Form',
          style: GoogleFonts.albertSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView(
          children: [
            SizedBox(height: 10),
            // Container(
            //   decoration: BoxDecoration(
            //       color: Colors.white,
            //       shape: BoxShape.circle,
            //       border: Border.all()),
            //   child: Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: Icon(
            //       Icons.emoji_people_rounded,
            //       size: 60,
            //     ),
            //   ),
            // ),
            SizedBox(height: 10),
            Text(
              'Enter Ride Information',
              style: GoogleFonts.albertSans(
                fontSize: 20,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              'Please enter the ride information below.',
              style: GoogleFonts.albertSans(
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(height: 30),
            CustomTextField(
              controller: travelPostController.pickupController,
              isPassword: false,
              textHolder: 'Enter Pick-up Location',
            ),
            SizedBox(height: 15),
            CustomTextField(
              controller: travelPostController.dropoffController,
              isPassword: false,
              textHolder: 'Enter Drop-off Location',
            ),
            // CustomTextField(
            //     controller: travelPostController.dropoffController,
            //     text: 'Drop-off Location',
            //     textfield: 'Enter Drop-off Location',
            //     icon: Icon(
            //       Icons.location_on,
            //       color: Colors.black,
            //     )),
            SizedBox(height: 15),
            CustomTextField(
              controller: travelPostController.passengersController,
              isPassword: false,
              textHolder: 'Enter Number of Passengers',
            ),
            // CustomTextField(
            //     controller: travelPostController.passengersController,
            //     text: 'Number of Passengers',
            //     textfield: 'Enter Number of Passengers',
            //     icon: Icon(
            //       Icons.people,
            //       color: Colors.black,
            //     )),
            // SizedBox(height: 15),
            // CustomTextField(
            //       controller: travelPostController.dropoffController,
            //       isPassword: false,
            //       textHolder: 'Enter Ride Description',
            //     ),
            // CustomTextField(
            //   text: 'Ride Description (Optional)',
            //   textfield: 'Enter Ride Description',
            //   icon: Icon(
            //     Icons.description,
            //     color: Colors.black,
            //   ),
            // ),
            SizedBox(height: 15),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                        "${controller.selectedDate.value.toLocal()}"
                            .split(' ')[0]
                            .toString(),
                        style: GoogleFonts.albertSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Icon(
                          Icons.calendar_month_sharp,
                          color: Colors.white,
                        ),
                      ),
                    ),
                    onTap: () {
                      controller.pickDate(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Obx(() => Text(
                        "${controller.selectedTime.value}"
                            .split(' ')[0]
                            .toString(),
                        style: GoogleFonts.albertSans(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                        ),
                      )),
                  InkWell(
                    child: CircleAvatar(
                      backgroundColor: Colors.black,
                      child: Icon(
                        Icons.access_time,
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      controller.pickTime(context);
                    },
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            InkWell(
              onTap: () {
                Get.back();
                travelPostController.createTravelPost();
              },
              child: CustomButton(
                textHolder: 'Submit',
              ),
            ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
