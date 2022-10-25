import 'dart:async';

import 'package:flutter/material.dart';
import 'package:start_flutterr/TaskOne/Taskcard.dart';

import '../other/CustomColor.dart';
class TaskSplash extends StatefulWidget {
  const TaskSplash({Key? key}) : super(key: key);

  @override
  State<TaskSplash> createState() => _TaskSplashState();
}

class _TaskSplashState extends State<TaskSplash> {
  @override
  void initState() {
    super.initState();
    debugPrint("start");
    Future.delayed(const Duration(seconds: 3),moveNextScreen);
  }
  void moveNextScreen(){
    debugPrint("Finish");
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => const TaskCard()),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: CustomColor.fromHex('5cac87'),
        child: Center(
          child:Image.asset("assets/images/taskapp/Splash.png")
        ),
      ),
    );
  }
}



