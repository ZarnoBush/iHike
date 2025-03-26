import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomImageInfo extends StatelessWidget {
  String? username;
  CustomImageInfo({super.key, this.username});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/swinging.gif'),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 2.0, right: 2.0, bottom: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  username!,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.albertSans(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [ 
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.blue, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.message,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(width: 20),
              Container(
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.green, width: 2),
                  shape: BoxShape.circle,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.call,
                    color: Colors.green,
                  ),
                ),
              ),
              SizedBox(width: 10),
            ],
          ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
