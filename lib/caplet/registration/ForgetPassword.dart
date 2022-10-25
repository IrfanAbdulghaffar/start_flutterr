import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:start_flutterr/caplet/registration/Restpassword.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController emailController = TextEditingController();
  bool isLoading=false;
  Future<http.Response> createAlbum( ){
    setState((){
      isLoading=true;
    });
    return http.post(
      Uri.parse('https://swyft-deliveries.demos-project.info/api/forget-password'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Os':'',
        'Device-Name':'',
        'Device-Token':''
      },
      body: <String, String>{
        'email':emailController.text,
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: Builder(
        builder: (BuildContext context) {
          return IconButton(
            icon: const Icon(Icons.keyboard_backspace,color: Colors.black,size: 30,),
            onPressed: () {
             Navigator.pop(context);
            },
            tooltip: MaterialLocalizations
                .of(context)
                .openAppDrawerTooltip,
          );
        }),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Center(
              child: Container(height: 110,
                  child: Image.asset("assets/images/usericon.png")),
            ),
          ),
          const Center(
            child: Text("Type User Email",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
              ),),
          ),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 10.0),
            child:TextField(
              keyboardType: TextInputType.emailAddress,
              textInputAction: TextInputAction.next,
              controller: emailController,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
              ),
              decoration: InputDecoration(
                  fillColor: Colors.white, filled: true,
                  prefixIcon: Icon(Icons.email),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "Email"

              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if (emailController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Email is Empty")));
                return;
              }
              createAlbum( ).then((value){
                setState((){
                  isLoading=false;
                });
                Map<String,dynamic> response = jsonDecode(value.body);
                print(response);
                if(response['status']==true){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['message'])));
                  Navigator.push(
                      context,MaterialPageRoute(builder: (context)=> Reset())
                  );
                }
               });
            },
            child: Padding(
              padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 40.0),
              child: Container(
                height: 54,
                decoration: BoxDecoration(
                    color: Colors.indigo,
                    borderRadius: BorderRadius.circular(233)
                ),
                child: Center(
                  child: Text("Next",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18
                    ),),
                ),
              ),
            ),
          ),
        ],
      ),

    );
  }
}
