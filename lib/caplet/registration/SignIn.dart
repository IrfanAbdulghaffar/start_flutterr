import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:start_flutterr/caplet/Dashbored/Dashbored.dart';
import 'package:start_flutterr/caplet/other/shared_preferences.dart';

import 'ForgetPassword.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading=false,passwordstate=true;
  Icon passwordicon=Icon(Icons.visibility_off);
  var value = false;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Future<http.Response> createAlbum( ){
    setState((){
      isLoading=true;
    });
    return http.post(
      Uri.parse('https://swyft-deliveries.demos-project.info/api/user-login'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Os':'',
        'Device-Name':'',
        'Device-Token':''
      },
      body: <String, String>{
        'phone_or_email':emailController.text,
        'password':passwordController.text,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
      body: isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage("assets/images/sign_in_bg.png"),
                        fit: BoxFit.cover)),
                child:
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Positioned(
                        top: size.height*0.15,
                        child: Container(
                            height: size.height*0.15,
                            child: Image.asset("assets/images/appbar_icon.png")),
                      ),
                      Align(
                        alignment: Alignment.bottomCenter,
                        child: Container(
                          margin: EdgeInsets.only(top: 130),
                          // height: MediaQuery.of(context).size.height*0.8,
                          decoration: BoxDecoration(
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset: Offset(0, 3),
                              )
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25)),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SizedBox(height: 30,),
                              Center(
                                child: const Text(
                                  "Sign In",
                                  style:
                                  TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
                                ),
                              ),
                              SizedBox(height: 15,),
                              Padding(
                                padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 10.0),
                                child:TextField(
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
                                      prefixIcon: Icon(Icons.lock),
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
                                padding: const EdgeInsets.only(left: 10,right: 30,top: 15),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                    Row(
                                      children: [
                                        Checkbox(
                                          activeColor: Colors.indigo,
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
                                          ),)
                                      ],
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(
                                            context,MaterialPageRoute(builder: (context)=> ForgetPassword())
                                        );
                                      },
                                      child: Text("Forgot Password?",
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.indigo
                                        ),),
                                    )
                                  ],
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  if (emailController.text.isEmpty) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Phone Number Must Enter")));
                                  } else
                                  if(passwordController.text.isEmpty){
                                    ScaffoldMessenger.of(context).showSnackBar(
                                        SnackBar(content: Text("Password Must Enter")));
                                    return;
                                  }

                                  createAlbum( ).then((value) {
                                    setState((){
                                      isLoading=false;
                                    });
                                    Map<String,dynamic> response = jsonDecode(value.body);
                                    if(response['status']==true){
                                      ScaffoldMessenger.of(context).showSnackBar(
                                          SnackBar(
                                              content: Text(response['message']),
                                          ));
                                      SharedPreference.instance.setData("Name", response['data']['user_name']);
                                      SharedPreference.instance.setData("phone", response['data']['phone']);
                                      Navigator.push(
                                          context,MaterialPageRoute(builder: (context)=> Dashbored())
                                      );
                                    }
                                  });
                                },
                                child: Padding(
                                  padding:
                                  EdgeInsets.only(left: 20.0, right: 25.0, top: 15.0),
                                  child: Container(
                                    height: 54,
                                    decoration: BoxDecoration(
                                        color: Colors.indigo,
                                        borderRadius: BorderRadius.circular(233)),
                                    child: Center(
                                      child: Text(
                                        "Sign In",
                                        style: TextStyle(color: Colors.white, fontSize: 16),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding:
                                EdgeInsets.only(left: 20.0, right: 25.0, top: 15.0),
                                child: Container(
                                  height: 54,
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Colors.indigo,
                                      ),
                                      borderRadius: BorderRadius.circular(233)),
                                  child: const Center(
                                    child: Text(
                                      "Continue as a Guest",
                                      style: TextStyle(color: Colors.indigo, fontSize: 16),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text("Don't have an account?"),
                                    Padding(
                                      padding: const EdgeInsets.all(5.0),
                                      child: Container(
                                        child: Text(
                                          "Sign Up",
                                          style: TextStyle(
                                            color: Colors.red,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),SizedBox(height: 30,),
                            ],
                          ),
                        ),
                      )
                    ],
                  )

              ),
          ),
    );
  }
}
