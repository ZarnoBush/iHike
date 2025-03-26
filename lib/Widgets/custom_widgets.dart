import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hike/Fonts/app_Fonts.dart';

class CustomText extends StatelessWidget {
  CustomText({
    required this.text,
    required this.color,
    required this.fontSize,
  });
  String? text;
  Color? color;
  double? fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text!,
      style: GoogleFonts.albertSans(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    );
  }
}

class CustomRideDetails extends StatelessWidget {
  CustomRideDetails({
    super.key,
    required this.textOne,
    required this.textTwo,
    this.iconData
  });

  String? textOne;
  String? textTwo;
  IconData? iconData;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Icon(iconData, color: Colors.black,),
          SizedBox(width: 10,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(textOne ?? 'ToPlaceHolder', style: GoogleFonts.albertSans(fontSize: 14, fontWeight: FontWeight.w700, color: Colors.black)),
              Text(textTwo ?? 'FromPlaceHolder', style: GoogleFonts.albertSans(fontSize: 14, color: Colors.black)),
            ],
          ),
        ],
      ),
    );
  }
}
