import 'package:flutter/material.dart';
class circle extends StatelessWidget {
  circle({
    Key? key,
    this.radias=100,
    this.color=Colors.white,
    this.child=const Text("Child"),
  }) : super(key: key);

  double? radias;
  Color? color;
  Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: radias,
      width: radias,
      decoration: BoxDecoration(
        color:color,
        shape: BoxShape.circle,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}
class rectangle extends StatelessWidget {
  rectangle({
    Key? key,
    this.height=100,
    this.width,
    this.color=Colors.white,
    this.shadow=true,
    this.child=const Text("Child"),
  }) : super(key: key);

  double? height;
  double? width;
  Color? color;
  bool shadow;
  Widget child;




  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width??height,
      decoration: BoxDecoration(
        color:color,
        shape: BoxShape.rectangle,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color:shadow==true?Colors.grey.withOpacity(0.5):Colors.transparent,
            spreadRadius: 1,
            blurRadius: 4,
            offset: Offset(0, 3), // changes position of shadow
          ),
        ],
      ),
      child: child,
    );
  }
}