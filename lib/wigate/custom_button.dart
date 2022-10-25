import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.size,
    required this.buttontext,
    this.color=Colors.deepPurple,
    this.height=40,
    this.width
  }) : super(key: key);

  final Size size;
  final String buttontext;
  Color color;
  double height;
  double? width;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: height,
      width: width??size.width*0.7,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 5,
            offset: Offset(2, 4),
          ),
        ],
        borderRadius: BorderRadius.circular(50),
        color: color,
      ),
      child: Text(
        "$buttontext",
        style: TextStyle(
          color: Colors.white,
          fontSize: size.width * 0.045,
        ),
      ),
    );
  }
}