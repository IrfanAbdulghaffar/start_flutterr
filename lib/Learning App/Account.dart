import'package:flutter/material.dart';
import 'package:start_flutterr/wigate/custom_button.dart';
class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  void onclick(){}
  var account="Account";
  @override
  Widget build(BuildContext context) {
     var size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "MY CLASSES",
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
            SizedBox(
              height: 20,
            ),
            Container(
              color: Colors.deepPurple,
              height: size.width/2.3,
              width: size.width,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.all(size.width/15),
                    child: Container(
                      height: size.width/4.8,
                      width: size.width/4.8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(300),
                          image: const DecorationImage(
                              image: AssetImage("assets/images/food.jpg"), fit: BoxFit.cover)
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "John Doe",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                          fontSize: size.width/15                        ),
                      ),
                      Text(
                        "johndoe@gmail.com",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width/28                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    accountCell(size,"Account Setting"),
                    accountCell(size,"Download options"),
                    accountCell(size,"Notification Setting"),
                    SizedBox(height: 30,),
                    accountCell(size,"Privacy & Policy"),
                    accountCell(size,"Help Center"),
                    accountCell(size,"Abount Us"),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Detete Account",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: size.width/19,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomButton(size: size, buttontext: "Log Out"),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget accountCell(Size size,var account) {
    return GestureDetector(
                  onTap:onclick,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "$account",
                          style: TextStyle(
                            color: Colors.deepPurple,
                            fontSize: size.width/19,
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          color: Colors.deepPurple,
                          size: size.width/19,
                        )
                      ],
                    ),
                  ),
                );
  }
}
