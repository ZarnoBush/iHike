
import 'package:flutter/material.dart';
class CustomLogo extends StatelessWidget {
  const CustomLogo({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text.rich(
          TextSpan(
              text: 'i',
              style: TextStyle(
                fontSize: 28,
                color: Colors.black,
                fontWeight: FontWeight.w500,
              ),
              children: [
                TextSpan(
                    text: 'Hike',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 40)),
              ]),
        ),
        Icon(
          Icons.emoji_people_rounded,
          color: Colors.black,
          size: 40,
        ),
      ],
    );
  }
}
