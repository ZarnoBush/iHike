import 'package:flutter/material.dart';
import 'package:hike/UserSide/user_home_page.dart';
import 'package:hike/Widgets/available_ride_list.dart';
import 'package:hike/Widgets/detail_tag_widget.dart';
import 'package:hike/Widgets/mutli_destinations.dart';

class UserTicketPage extends StatelessWidget {
  UserTicketPage({super.key});  

  


  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
             UserAppBar(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                        Text(
                            'Ticket Status: Waiting...',
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                          
                      ],),
                      SizedBox(height: 10,),
                      DetailTag(
                          iconData: Icons.local_taxi_rounded,
                          title: 'Car Model',
                          sub_title: 'Toyota - Starlet | Silva Grey'),
                      SizedBox(
                        height: 10,
                      ),
                      UserLocations(
                        iconData: Icons.emoji_people_rounded,
                        locationTag: 'Current Location',
                        location: 'Cape Town',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      UserLocations(
                        iconData: Icons.location_pin,
                        locationTag: 'Destination',
                        location: 'Worcester',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      UserLocations(
                        iconData: Icons.airline_seat_recline_normal_rounded,
                        locationTag: 'Passangers',
                        location: '2',
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      DetailTag(
                        iconData: Icons.timer_rounded,
                        title: 'Pickup Time',
                        sub_title: '14h00 | Today',
                      ),
                      SizedBox(height: 20,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                        child: Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: Colors.red, fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ),
                      ),
                      Container(
                        child: Center(
                          child: Text(
                            'Update',
                            style: TextStyle(
                                color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
                          ),
                        ),
                      ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
