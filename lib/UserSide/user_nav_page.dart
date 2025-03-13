import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hike/Controllers/schedule_controller.dart';
import 'package:hike/DriverSide/driver_home_page.dart';
import 'package:hike/UserSide/user_home_page.dart';
import 'package:hike/UserSide/user_proile.dart';
import 'package:hike/UserSide/user_ticket_page.dart';
import 'package:hike/Widgets/detail_tag_widget.dart';

class UserNavPage extends StatefulWidget {
  const UserNavPage({super.key});

  @override
  State<UserNavPage> createState() => _UserNavPageState();
}

class _UserNavPageState extends State<UserNavPage> {
  ScheduleController _scheduleController = Get.put(ScheduleController());
  int _currentIndex = 0;
  final List<Widget> _children = [
    UserHomePage(),
    UserTicketPage(),
    UserProile(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.bottomSheet(Container(
            height: 400,
            width: MediaQuery.of(context).size.width,
            color: Colors.white,
            child: GetBuilder<ScheduleController>(builder: (controller) {
              return ListView(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Schedule Hike:',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller:
                                _scheduleController.currentLocationController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'current location',
                                suffixIcon: Icon(
                                  Icons.emoji_people_rounded,
                                  color: Colors.black,
                                )),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Icon(
                            Icons.keyboard_double_arrow_down_sharp,
                            color: Colors.black,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          TextFormField(
                            controller:
                                _scheduleController.destinationController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'destination',
                                suffixIcon: Icon(
                                  Icons.location_on,
                                  color: Colors.black,
                                )),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Passangers:',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            Row(
                              children: [
                                Icon(
                                  Icons.arrow_circle_down_rounded,
                                  color: Colors.black,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  '${_scheduleController.passengers}',
                                  style: TextStyle(
                                      fontSize: 18, color: Colors.black),
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Icon(
                                  Icons.arrow_circle_up_rounded,
                                  color: Colors.black,
                                ),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Pickup Time:',
                                style: TextStyle(
                                    fontSize: 14, color: Colors.black)),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () =>
                                      _scheduleController.pickTime(context),
                                  child: Obx(() => Text(
                                      _scheduleController.selectedTime.value)),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        GestureDetector(
                          onTap: () => Get.defaultDialog(
                              title: 'Confirm Request',
                              titleStyle: TextStyle(
                                  fontSize: 16, fontWeight: FontWeight.w400),
                              content: Column(
                                children: [
                                  DetailTag(
                                    iconData: Icons.emoji_people_rounded,
                                    title: 'Current Location',
                                    sub_title: 'Cape Town',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DetailTag(
                                    iconData: Icons.location_pin,
                                    title: 'Destination',
                                    sub_title: 'Worcester',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DetailTag(
                                    iconData: Icons
                                        .airline_seat_recline_normal_rounded,
                                    title: 'Passangers',
                                    sub_title: '2',
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  DetailTag(
                                    iconData: Icons.timer_rounded,
                                    title: 'Pickup Time',
                                    sub_title: '12h00 | Today',
                                  ),
                                ],
                              ),
                              textCancel: 'Cancel',
                              cancelTextColor: Colors.black,
                              textConfirm: 'Confirm',
                              buttonColor: Colors.black),
                          child: GestureDetector(
                            onTap: () {
                              _scheduleController.checkSchedule();
                              _scheduleController.clear();
                              Get.back();
                              print('Submit Clicked');
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(2))),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              );
            }))),
        mini: true,
        shape: CircleBorder(),
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
        child: Icon(Icons.local_taxi_rounded),
      ),
      bottomNavigationBar: BottomAppBar(
        notchMargin: 5.0,
        shape: CircularNotchedRectangle(),
        color: Colors.black,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          mainAxisSize: MainAxisSize.max,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.home),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 0;
                    });
                  },
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.list_alt_rounded),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 1;
                    });
                  },
                ),
              ],
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                IconButton(
                  icon: Icon(Icons.person_pin),
                  color: Colors.white,
                  onPressed: () {
                    setState(() {
                      _currentIndex = 2;
                    });
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
