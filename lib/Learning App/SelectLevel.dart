import 'package:flutter/material.dart';
import 'package:start_flutterr/Learning%20App/HomeScreen.dart';
import '../wigate/custom_button.dart';

class SelectLevelScreen extends StatefulWidget {
  const SelectLevelScreen({Key? key}) : super(key: key);

  @override
  State<SelectLevelScreen> createState() => _SelectLevelScreenState();
}
class _SelectLevelScreenState extends State<SelectLevelScreen> {
  var value = false;
  Color onebg=Colors.deepPurple;
  Color onetext=Colors.white;
  Color twobg=Colors.white;
  Color twotext=Colors.deepPurple;
  Color threebg=Colors.white;
  Color threetext=Colors.deepPurple;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: new IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios_new_sharp,
              color: Colors.deepPurple,
            )),
      ),
      body: ListView(
        children: [Column(
          children: [
            Center(
              child: Text(
                "Learning App",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: size.width * 0.07,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Image.asset(
              "assets/images/Splash.png",
              height: size.width * 0.6,
              width: size.width,
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.only(left: 30),
              width: size.width,
              child: Text(
                "Select your course level",
                style: TextStyle(
                  color: Colors.deepPurple,
                  fontSize: size.width * 0.05,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        onebg=Colors.deepPurple;
                        onetext=Colors.white;
                        twobg=Colors.white;
                        twotext=Colors.deepPurple;
                        threebg=Colors.white;
                        threetext=Colors.deepPurple;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: size.width / 16,
                      width: size.width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.deepPurple, width: 1.2),
                        color: onebg,
                      ),
                      child: Text(
                        "Beginner",
                        style: TextStyle(
                          color: onetext,
                          fontSize: size.width / 28,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        onebg=Colors.white;
                        onetext=Colors.deepPurple;
                        twobg=Colors.deepPurple;
                        twotext=Colors.white;
                        threebg=Colors.white;
                        threetext=Colors.deepPurple;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: size.width / 16,
                      width: size.width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.deepPurple, width: 1.2),
                        color: twobg,
                      ),
                      child: Text(
                        "Intermidate",
                        style: TextStyle(
                          color: twotext,
                          fontSize: size.width / 28,
                        ),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        onebg=Colors.white;
                        onetext=Colors.deepPurple;
                        twobg=Colors.white;
                        twotext=Colors.deepPurple;
                        threebg=Colors.deepPurple;
                        threetext=Colors.white;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: size.width / 16,
                      width: size.width / 4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        border: Border.all(color: Colors.deepPurple, width: 1.2),
                        color: threebg,
                      ),
                      child: Text(
                        "Expert",
                        style: TextStyle(
                          color: threetext,
                          fontSize: size.width / 28,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60,
            ),
            Padding(
              padding: EdgeInsets.only(left: size.width * .12),
              child: Row(
                children: [
                  Checkbox(
                    activeColor: Colors.deepPurple,
                    value: this.value,
                    onChanged: (var value) {
                      setState(() {
                        this.value = value!;
                      });
                    },
                  ),
                  Text(
                    "Are you sure?",
                    style: TextStyle(fontSize: 14, color: Colors.deepPurple),
                  )
                ],
              ),
            ),
            GestureDetector(
                onTap: () {
                  // api callling
                  if(value==true)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()),
                  );
                },
                child: CustomButton(
                  size: size,
                  buttontext: 'Continue',
                )),
          ],
        ),]
      ),
    );
  }
}
