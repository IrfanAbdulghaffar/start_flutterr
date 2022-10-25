import 'package:flutter/material.dart';
class CustomText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight fontWeight;
  final Color color;
  final double wordSpacing;
  final Function()? onClick;

  void click(void param0) {}

  const CustomText({
    required this.text,
    this.size = 20,
    this.fontWeight = FontWeight.normal,
    this.color = Colors.black,
    this.wordSpacing = 2,
    this.onClick,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (onClick != null) {
          onClick!();
        } else {
          click(
            print("click")
          );
        }
      },
      child: Container(

        child: Text(

          text,
          style: TextStyle(
            fontSize: size,
            fontWeight: fontWeight,
            color: color,
            wordSpacing: wordSpacing,
          ),
        ),
      ),
    );
  }
}
