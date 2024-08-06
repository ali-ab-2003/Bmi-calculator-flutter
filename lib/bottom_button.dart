import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  BottomButton({required this.onTap, required this.ButtonTitle});

  final Function onTap;
  final String ButtonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        color: Color(0xFFEB1555),
        margin: EdgeInsets.only(top: 10.0),
        width: double.infinity,
        height: 70.0,
        child: Center(
          child: Text(
            ButtonTitle,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25.0),
          ),
        ),
        padding: EdgeInsets.only(bottom: 5.0),
      ),
    );
  }
}
