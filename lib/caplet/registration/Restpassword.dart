import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:start_flutterr/caplet/registration/SignIn.dart';
class Reset extends StatefulWidget {
  const Reset({Key? key}) : super(key: key);

  @override
  State<Reset> createState() => _ResetState();
}

class _ResetState extends State<Reset> {
  TextEditingController CodeController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController password2Controller = TextEditingController();
  bool isLoading=false,passwordstate=true;
  Icon passwordicon=Icon(Icons.visibility_off);
  Future<http.Response> createAlbum( ){
    setState((){
      isLoading=true;
    });
    return http.post(
      Uri.parse('https://swyft-deliveries.demos-project.info/api/reset-password'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Os':'',
        'Device-Name':'',
        'Device-Token':''
      },
      body: <String, String>{
        'reset_code':CodeController.text,
        'password':passwordController.text,
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
            child: Text("Change Password",
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
              keyboardType: TextInputType.number,
              textInputAction: TextInputAction.next,
              controller: CodeController,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
              ),
              decoration: InputDecoration(
                  fillColor: Colors.white, filled: true,
                  prefixIcon: Icon(Icons.verified_user),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "Code"

              ),
            ),
          ),
          Padding(
            padding:
            EdgeInsets.only(left: 20.0, right: 25.0, top: 10.0),
            child: TextField(
              textInputAction: TextInputAction.next,
              controller: passwordController,
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              obscureText: passwordstate,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(onPressed: () {
                    setState((){
                      if(passwordstate==true){
                        passwordstate=false;
                        passwordicon=Icon(Icons.visibility);
                      }else{
                        passwordstate=true;
                        passwordicon=Icon(Icons.visibility_off);
                      }
                    });
                  },icon: passwordicon,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Password"),
            ),
          ),
          Padding(
            padding:
            EdgeInsets.only(left: 20.0, right: 25.0, top: 10.0),
            child: TextField(
              textInputAction: TextInputAction.next,
              controller: password2Controller,
              style: TextStyle(color: Colors.black, fontSize: 16.0),
              obscureText: passwordstate,
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  filled: true,
                  prefixIcon: Icon(Icons.password),
                  suffixIcon: IconButton(onPressed: () {
                    setState((){
                      if(passwordstate==true){
                        passwordstate=false;
                        passwordicon=Icon(Icons.visibility);
                      }else{
                        passwordstate=true;
                        passwordicon=Icon(Icons.visibility_off);
                      }
                    });
                  },icon: passwordicon,),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)),
                  hintText: "Confirm Password"),
            ),
          ),
          GestureDetector(
            onTap: (){
              if (CodeController.text.isEmpty) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Code is Empty")));
                return;
              }
              if(password2Controller.text.isEmpty||passwordController.text.isEmpty){
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill Password")));
                return;
              }else if(passwordController.text!=password2Controller.text){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password must be simlar")));
                  return;
                }
              createAlbum( ).then((value) {
                Map<String,dynamic> response = jsonDecode(value.body);
                if(response['status']==true){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['message'])));
                  Navigator.push(
                      context,MaterialPageRoute(builder: (context)=> const SignIn(),)
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

    );;
  }
}
