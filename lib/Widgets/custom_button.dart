import 'package:flutter/material.dart';
import 'package:hike/Fonts/app_Fonts.dart';

class CustomButton extends StatelessWidget {
  String? textHolder;
  CustomButton({this.textHolder});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.black, borderRadius: BorderRadius.circular(4)),
      child: Center(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          textHolder!,
          style: AppFonts.poppins_700
        ),
      )),
    );
  }
}
