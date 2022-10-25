import 'dart:async';

import 'package:flutter/cupertino.dart';

class CustomTextFeild extends StatefulWidget {
  const CustomTextFeild({Key? key}) : super(key: key);

  @override
  State<CustomTextFeild> createState() => _CustomTextFeildState();
}

class _CustomTextFeildState extends State<CustomTextFeild> {
   int counter=0;
  @override
  void initState() {
    // TODO: implement initState
    Timer.periodic(Duration(seconds: 3), (timer) {
setState((){

});
    });
    super.initState();
  }


  @override
  Widget build(BuildContext context) {
    return Text(counter.toString());
  }
}
