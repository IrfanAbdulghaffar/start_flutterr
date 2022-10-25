import 'package:flutter/material.dart';

import '../wigate/custom_button.dart';
import 'LogInScreen.dart';

class LearningSecondScreen extends StatefulWidget {
  const LearningSecondScreen({Key? key}) : super(key: key);

  @override
  State<LearningSecondScreen> createState() => _LearningSecondScreenState();
}

class _LearningSecondScreenState extends State<LearningSecondScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(
            "assets/images/second_screen_image.png",
            height: size.width * 0.6,
            width: size.width,
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            "Online learning platform",
            style: TextStyle(
              color: Colors.deepPurple,
              fontSize: size.width * 0.06,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 16,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.10),
            child: const Text(
              "Lorem Ipsum is simply dummy text of the printing and typesettng industruy. Lorem Ipsum has",
              style: TextStyle(color: Colors.black, fontSize: 17.5),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LogInScreen()),
              );
            },
            child: CustomButton(size: size, buttontext: 'Start Learning',),
          )
        ],
      ),
    );
  }
}


