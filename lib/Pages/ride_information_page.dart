import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/bookings_controller.dart';
import 'package:hike/Controllers/travel_post_controller.dart';
import 'package:hike/Fonts/app_Fonts.dart';
import 'package:hike/Pages/ride_requests_page.dart';
import 'package:hike/Pages/signup_page.dart';
import 'package:hike/Widgets/custom_button.dart';
import 'package:hike/Widgets/custom_image.dart';
import 'package:hike/Widgets/custom_widgets.dart';

class RideInformationPage extends StatelessWidget {
  String? travel_id, username, fromText, toText, timeDateText, descriptionText;
  RideInformationPage(
      {super.key,
      this.travel_id,
      this.username,
      required this.fromText,
      required this.toText,
      required this.timeDateText,
      this.descriptionText});
  final TravelPostController travelPostController =
      Get.put(TravelPostController());
  final BookingsController bookingsController = Get.put(BookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ride Information"),
      ),
      body:  Column(
          children: [
            Expanded(
              child: CustomImageInfo(username: username,),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: ListView(
                  children: [
                    Text(
                      'Ride Information',
                      style: AppFonts.poppins_w700
                    ),
                    Text(
                      'See Ride information below. User $travel_id',
                      style: AppFonts.poppins_w400
                    ),
                    SizedBox(height: 10),
                    CustomRideDetails(
                      textOne: 'Current Location:',
                      textTwo: fromText,
                    ),
                    SizedBox(height: 10),
                    CustomRideDetails(
                      textOne: 'Destination:',
                      textTwo: toText,
                    ),
                    SizedBox(height: 10),
                    CustomRideDetails(
                      textOne: 'Date and Time:',
                      textTwo: timeDateText,
                    ),
                    SizedBox(height: 10),
                    CustomRideDetails(
                      textOne: 'Description:',
                      textTwo: 'DescriptionPlaceHolder',
                    ),
                    SizedBox(height: 20),
                    Text(
                      'Enter Your Information',
                      style: AppFonts.poppins_w700
                    ),
                    Text(
                      'Please enter your information below.',
                      style: AppFonts.poppins_w400
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: bookingsController.pickupController,
                      isPassword: false,
                      textHolder: 'Enter Pick-up Location',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: bookingsController.dropoffController,
                      isPassword: false,
                      textHolder: 'Enter Drop-off Location',
                    ),
                    SizedBox(height: 20),
                    CustomTextField(
                      controller: bookingsController.passengersController,
                      isPassword: false,
                      textHolder: 'Enter Number of Passengers',
                    ),
                    SizedBox(height: 20),
                    // CustomTextField(
                    //   controller: travelPostController.dropoffController,
                    //   isPassword: false,
                    //   textHolder: 'Enter Description',
                    // ),
                    InkWell(
                      onTap: () => bookingsController.createBooking(travel_id),
                      child: CustomButton(
                        textHolder: 'Book Ride',
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
      ),
    );
  }
}




