import 'package:flutter/material.dart';

class cardChildContent extends StatelessWidget {
  cardChildContent({required this.buttonIcon, required this.buttonText});
  final IconData buttonIcon;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          buttonIcon,
          size: 80.0,
          color: Colors.white,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          buttonText,
          style: TextStyle(
            fontSize: 18.0,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }
}
