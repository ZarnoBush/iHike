import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AvailableRideList extends StatelessWidget {
  AvailableRideList(
      {super.key,
      required this.iconData,
      required this.text_one,
      required this.text_two,
      required this.text_three,
      this.seats_left,
      // required this.onTap
      });

  IconData? iconData;
  String? text_one, text_two, text_three, seats_left;
  // Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            GestureDetector(
              // onTap: onTap,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  iconData,
                  size: 30,
                  color: Colors.black,
                ),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text_one!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
                Text(
                  text_two!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  text_three!,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
              ],
            ),
          ],
        ),
        Row(
          children: [
            Row(
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.airline_seat_recline_normal_rounded,
                      color: Colors.black,
                    ),
                  ],
                ),
                Text(
                  seats_left!,
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
