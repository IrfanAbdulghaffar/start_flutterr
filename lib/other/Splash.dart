import 'package:flutter/material.dart';

class Splash extends StatelessWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          margin: const EdgeInsets.only(top: 25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Image.asset('assets/images/splash_map.png',
              ),
              Image.asset('assets/images/app_icon.png',
                height: 200,
              ),
              Image.asset('assets/images/splash_hospital.png'),
            ],
          ),
        ),
      ),
    );
  }
}
