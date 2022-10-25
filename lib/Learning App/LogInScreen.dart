import 'package:flutter/material.dart';

import '../wigate/custom_button.dart';
import 'SelectLevel.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({Key? key}) : super(key: key);

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var value = true;


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "LOG IN",
          style: TextStyle(
            color: Colors.deepPurple,
            fontSize: size.width * 0.048,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
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
      body: SingleChildScrollView(
        child: Column(
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
              height: 55,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: size.width * 0.15),
              child: const Text(
                "Enter your long in details to access your account",
                style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                iconButton(size, "Facebook", Icons.facebook, Colors.indigoAccent),
                // SizedBox(width: 20,),
                iconButton(
                    size, "Google", Icons.g_mobiledata_outlined, Colors.red),
              ],
            ),
            SizedBox(height: 20,),
            customTextField("Email", emailController),
            customTextField("Password", passwordController),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10,right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [

                  Row(
                    children: [
                      Checkbox(
                        value: this.value,
                        onChanged: (var value) {
                          setState(() {
                            this.value = value!;
                          });
                        },
                      ),
                      Text("Remember Me?",
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.deepPurple
                      ),)
                    ],
                  ),
                  Text("Remember Me?",
                    style: TextStyle(
                        fontSize: 14,
                        color: Colors.red
                    ),)
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            GestureDetector(
                onTap: () {
                  String email = emailController.text;
                  String password = passwordController.text;
                  if (email.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email feild is required ")));
                  } else if (password.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Password feild is required ")));
                  } else {
                    // api callling
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const SelectLevelScreen()),
                    );
                  }
                },
                child: CustomButton(
                  size: size,
                  buttontext: 'Log in with your account',
                )),
            SizedBox(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an Account?  ",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.deepPurple
                  ),),
                Text("Create account?",
                  style: TextStyle(
                      fontSize: 14,
                      color: Colors.blue
                  ),),
              ],
            ),

          ],
        ),
      ),

    );
  }

  Widget customTextField(
      String hintText, TextEditingController textEditingController) {
    return Padding(
      padding: EdgeInsets.only(left: 20.0, right: 25.0, top: 20.0),
      child: TextField(
        controller: textEditingController,
        style: TextStyle(color: Colors.black, fontSize: 16.0),
        decoration: InputDecoration(
           focusedBorder: OutlineInputBorder(
             borderSide: BorderSide(color: Colors.deepPurple,width: 1),
               borderRadius: BorderRadius.circular(10)
           ),
            enabledBorder: OutlineInputBorder(
              borderSide:BorderSide(color: Colors.deepPurple,width: 1.5),
              borderRadius: BorderRadius.circular(10)
            ),
            hintText: hintText),
      ),
    );
  }

  Widget iconButton(
      Size size, String lable, IconData iconData, Color iconColor) {
    return Expanded(
      child: Container(
        alignment: Alignment.center,
        height: size.width * 0.12,
        margin: EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 5,
              offset: Offset(2, 4),
            ),
          ],
          borderRadius: BorderRadius.circular(10),
          color: iconColor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              color: Colors.white,
              size: 32,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              lable,
              style: TextStyle(
                color: Colors.white,
                fontSize: size.width * 0.04,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
