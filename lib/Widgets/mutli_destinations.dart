import 'package:flutter/material.dart';

class MultiDestinations extends StatelessWidget {
  MultiDestinations({
    super.key, required this.iconData, required this.title, required this.sub_title, required this.subbtitle 
  });

  IconData? iconData;
  String? title;
  String? sub_title;
  String? subbtitle;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(iconData),
        SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 10,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              sub_title!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              subbtitle!,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
      ],
    );
  }
}