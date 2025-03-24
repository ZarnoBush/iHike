
import 'package:flutter/material.dart';
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
      style: AppFonts.poppins_400
    );
  }
}

class CustomRideDetails extends StatelessWidget {
  CustomRideDetails({
    super.key,
    required this.textOne,
    required this.textTwo,
  });

  String? textOne;
  String? textTwo;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          textOne ?? 'ToPlaceHolder',
          style: AppFonts.poppins_700
        ),
        Text(
          textTwo ?? 'FromPlaceHolder',
          style: AppFonts.poppins_400
        ),
      ],
    );
  }
}