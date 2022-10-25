import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:start_flutterr/caplet/Dashbored/Dashbored.dart';
import 'package:start_flutterr/caplet/registration/SignIn.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  void callSignupAPI(
      String username,
      String email,
      String phone,
      String password,
      String confirmPassword,
      )
  {

    isLoading = true;
    Map<String, dynamic> body = <String, dynamic>{};
    Map<String, String> header = <String, String>{};

    body['user_name'] = username;
    body['email'] = email;
    body['phone'] = phone;
    body['password'] = password;
    body['confirm_password'] = confirmPassword;

  }

  bool isLoading=false,passwordstate=true;
  Icon passwordicon=Icon(Icons.visibility_off);
  TextEditingController usernameController=TextEditingController();
  TextEditingController emailController=TextEditingController();
  TextEditingController phoneController=TextEditingController();
  TextEditingController passwordController=TextEditingController();
  TextEditingController password2Controller=TextEditingController();
  Future<http.Response> createAlbum( ){
    setState((){
      isLoading=true;
    });
    return http.post(
      Uri.parse('https://swyft-deliveries.demos-project.info/api/signup'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Os':'',
        'Device-Name':'',
        'Device-Token':''
      },
      body: <String, String>{
        'user_name': usernameController.text,
        'email':emailController.text,
        'phone':phoneController.text,
        'password':passwordController.text,
        'confirm_password':password2Controller.text,
      },
    );
  }
  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: Colors.white,
        body: isLoading?Center(child: CircularProgressIndicator(),): Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/sign_in_bg.png"), fit: BoxFit.cover)),
          child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Center(
                child: Container(height: 110,
                    child: Image.asset("assets/images/appbar_icon.png")),
              ),
            ),
            Center(
              child: const Text("Sign Up",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 30.0),
              child:TextField(

                textInputAction: TextInputAction.next,
                controller: usernameController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
                ),
                decoration: InputDecoration(
                  fillColor: Colors.white, filled: true,
                  prefixIcon: Icon(Icons.person),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "User Name"
                ),
              ),
            ),
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
              padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 10.0),
              child:TextField(
                textInputAction: TextInputAction.next,
                controller: phoneController,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  fillColor: Colors.white, filled: true,
                  prefixIcon: Padding(
                      padding:EdgeInsets.all(8),
                      child: Image.asset('assets/images/callcode.png',width: 100.0)
                  ),
                  // prefixIconConstraints: BoxConstraints.tight(MediaQuery.of(context).size),
                  suffixIcon: const Icon(Icons.call),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10)
                  ),
                  hintText: "Phone",
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 10.0),
              child:TextField(
                textInputAction: TextInputAction.next,
                controller: passwordController,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
                ),
                obscureText: true,
                decoration: InputDecoration(
                    fillColor: Colors.white, filled: true,
                  prefixIcon: Icon(Icons.lock),
                  suffixIcon: Icon(Icons.visibility_off),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  hintText: "Password"
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 10.0),
              child:TextField(
                textInputAction: TextInputAction.next,
                controller: password2Controller,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0
                ),
                obscureText: passwordstate,
                decoration: InputDecoration(

                  fillColor: Colors.white, filled: true,
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
                  prefixIcon: Icon(Icons.lock),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10)
                    ),
                  hintText: "Confirm Password"
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                if(usernameController.text.isEmpty||emailController.text.isEmpty||phoneController.text.isEmpty)
                 {
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill all context")));
                   return;
                 }
                if(password2Controller.text.isEmpty||passwordController.text.isEmpty){
                   ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fill Password")));
                }else{
                  if(passwordController.text!=password2Controller.text){
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password must be simlar")));
                    // ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(content: Text("Password must be simlar"), actions: [IconButton(onPressed: (){
                    //   ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                    //
                    // }, icon: Icon(Icons.cancel),)]));
                    return;
                  }
                }
                createAlbum( ).then((value) {
                  setState((){
                    isLoading=false;
                  });
                  Map<String,dynamic> response = jsonDecode(value.body);
                  print(response);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(response['message'])));
                });
              },
              child: Padding(
                padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 30.0),
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                      color: Colors.indigo,
                      borderRadius: BorderRadius.circular(233)
                  ),
                  child: Center(
                    child: Text("Sign Up",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16
                    ),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 15.0),
              child: GestureDetector(
                onTap: (){
                  Navigator.push(
                      context,MaterialPageRoute(builder: (context)=> Dashbored())
                  );
                },
                child: Container(
                  height: 54,
                  decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.indigo,
                      ),
                      borderRadius: BorderRadius.circular(233)
                  ),
                  child: const Center(
                    child: Text("Continue as a Guest",
                    style: TextStyle(
                      color: Colors.indigo,
                      fontSize: 16
                    ),),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("Already have account?"),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Container(
                      child: GestureDetector(
                        onTap: (){
                          Navigator.push(
                            context,MaterialPageRoute(builder: (context)=> SignIn())
                          );
                        },
                        child: Text("Sign In",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 16,
                        ),),
                      ),
                    ),
                  )
                ],
              ),
            )

          ],
          ),
        ),
    );
  }
}
