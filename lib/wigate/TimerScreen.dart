import 'package:flutter/material.dart';
class Timers extends StatelessWidget {
  const Timers({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          
        ),
         body: Container(
          color: Colors.blue,
          alignment: Alignment.center,
          width: double.infinity,
          height: double.infinity,
          child: AspectRatio(
            aspectRatio:1 ,
            child: Container(
              color: Colors.green,
            ),
          ),
        ),
      ),
    );
  }
}


