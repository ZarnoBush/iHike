import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hike/Controllers/bookings_controller.dart';
import 'package:hike/Controllers/travel_post_controller.dart';
import 'package:hike/Fonts/app_Fonts.dart';
import 'package:hike/Pages/ride_requests_page.dart';
import 'package:hike/Pages/signup_page.dart';
import 'package:hike/Widgets/custom_button.dart';
import 'package:hike/Widgets/custom_image.dart';
import 'package:hike/Widgets/custom_widgets.dart';

class DriverInformationPage extends StatelessWidget {
  String? travel_id, username, fromText, toText, passengers, timeDateText, descriptionText;
  DriverInformationPage(
      {super.key,
      this.travel_id,
      this.username,
      required this.fromText,
      required this.toText,
      required this.passengers,
      required this.timeDateText,
      this.descriptionText});
  final TravelPostController travelPostController =
      Get.put(TravelPostController());
  final BookingsController bookingsController = Get.put(BookingsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Ride Information",
          style: GoogleFonts.albertSans(
            fontSize: 18,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: CustomImageInfo(
              username: username,
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Text('Ride Information', style: GoogleFonts.albertSans(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  )),
                  Text('See Ride information below. User $travel_id',
                      style: GoogleFonts.albertSans(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                  )),
                  SizedBox(height: 10),
                  Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          CustomRideDetails(
                            iconData: Icons.person_pin,
                            textOne: 'Current Location:',
                            textTwo: fromText,
                          ),
                          SizedBox(height: 10),
                          CustomRideDetails(
                            iconData: Icons.location_pin,
                            textOne: 'Destination:',
                            textTwo: toText,
                          ),
                          SizedBox(height: 10),
                          CustomRideDetails(
                            iconData: Icons.access_time,
                            textOne: 'Passengers:',
                            textTwo: passengers,
                          ),
                          SizedBox(height: 10),
                          CustomRideDetails(
                            iconData: Icons.access_time,
                            textOne: 'Date and Time:',
                            textTwo: timeDateText,
                          ),
                          SizedBox(height: 10),
                          CustomRideDetails(
                            iconData: Icons.description_rounded,
                            textOne: 'Description:',
                            textTwo: 'DescriptionPlaceHolder',
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  // CustomTextField(
                  //   controller: travelPostController.dropoffController,
                  //   isPassword: false,
                  //   textHolder: 'Enter Description',
                  // ),
                  InkWell(
                    onTap: () => bookingsController.createBooking(travel_id, 
                        fromText, toText, passengers),
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
