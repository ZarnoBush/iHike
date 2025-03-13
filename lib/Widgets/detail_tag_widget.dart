import 'package:flutter/material.dart';

class DetailTag extends StatelessWidget {
  DetailTag(
      {super.key,
      required this.iconData,
      required this.title,
      required this.sub_title});

  IconData? iconData;
  String? title;
  String? sub_title;

  @override
  Widget build(BuildContext context) {
    return Row(
      // spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          iconData,
          color: Colors.black,
        ),
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
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.justify,
              maxLines: 3,
              softWrap: true,
              
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
