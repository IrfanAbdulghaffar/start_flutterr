import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:start_flutterr/caplet/other/shared_preferences.dart';
import 'package:start_flutterr/caplet/other/customWidget.dart';
import 'package:start_flutterr/wigate/custom_button.dart';
import 'package:http/http.dart' as http;
class orderReview extends StatefulWidget {
  orderReview({Key? key,
  required this.address,
  required this.imageFile,
  }) : super(key: key);
  String address;
  List<File> imageFile;
  @override
  State<orderReview> createState() => _orderReviewState();
}

class _orderReviewState extends State<orderReview> {
  
  final String uploadUrl = 'https://api.imgur.com/3/upload';
  bool loding=false;

  Future<String?> uploadImage(filepath, url) async {
    setState((){
      loding=true;
    });
    var request = http.MultipartRequest('POST', Uri.parse(url));
    request.files.add(await http.MultipartFile.fromPath('image', filepath));
    var res = await request.send();
    setState((){
      loding=false;
    });
    return res.reasonPhrase??'t was null';
  }

  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    double textsize=size.width*0.042;
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: Text(
          "Order review"
        ),
      ),
      body: loding==true?Center(
        child: Lottie.asset('assets/animation/send.json'),
      ):Align(
        alignment:Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            rectangle(
              height: size.height*0.65,
              width: size.width*0.9,
              shadow: false,
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        rectangle(child: Image.file(widget.imageFile[0],),shadow: false,height: size.width*0.12,),
                        SizedBox(width: 10,),
                        Text("Order Review",style: TextStyle(fontWeight: FontWeight.w500,fontSize: size.width*0.05,)),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate((size.width*0.09).toInt(), (index) => Container(margin: EdgeInsets.symmetric(horizontal: 2), height: 1,width: 5,color: Colors.black26
                        ,)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Name",style: TextStyle(
                          color: Colors.black,
                          fontSize: textsize,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text("${SharedPreference.instance.getData("Name")}",style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w300,
                          fontSize: textsize,
                        ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Phone",style: TextStyle(
                          color: Colors.black,
                          fontSize: textsize,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text("${SharedPreference.instance.getData("phone")}",style: TextStyle(
                          color: Colors.black45,
                          fontSize: textsize,
                          fontWeight: FontWeight.w300,
                        ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address",style: TextStyle(
                              color: Colors.black,
                              fontSize: textsize,
                              fontWeight: FontWeight.w400,
                            ),),
                            Container(
                              width: size.width*0.80,
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Text("${widget.address}",
                                      style: TextStyle(
                                      color: Colors.black45,
                                      fontSize: textsize,
                                      fontWeight: FontWeight.w300,
                                    ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Payment Method",style: TextStyle(
                          color: Colors.black,
                          fontSize: textsize,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text("Cash on Delivery",style: TextStyle(
                          color: Colors.black45,
                          fontSize: textsize,
                          fontWeight: FontWeight.w300,
                        ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Order Type",style: TextStyle(
                          color: Colors.black,
                          fontSize: textsize,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text("Assan",style: TextStyle(
                          color: Colors.black45,
                          fontSize: textsize,
                          fontWeight: FontWeight.w300,
                        ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Delivery Charges",style: TextStyle(
                          color: Colors.black,
                          fontSize: textsize,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text("Rs. 90.0",style: TextStyle(
                          color: Colors.black45,
                          fontSize: textsize,
                          fontWeight: FontWeight.w300,
                        ),),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Express Delivery",style: TextStyle(
                              color: Colors.black,
                              fontSize: textsize,
                              fontWeight: FontWeight.w400,
                            ),),
                            Text("Delivery within an hour + Rs.180",style: TextStyle(
                              color: Colors.black45,
                              fontSize: textsize,
                              fontWeight: FontWeight.w300,
                            ),),
                          ],
                        ),
                        Switch(
                          value: false,
                          onChanged: (value) {

                          },
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate((size.width*0.09).toInt(), (index) => Container(margin: EdgeInsets.symmetric(horizontal: 2), height: 1,width: 5,color: Colors.black26
                        ,)),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Total",style: TextStyle(
                          color: Colors.black,
                          fontSize: textsize,
                          fontWeight: FontWeight.w400,
                        ),),
                        Text("Rs.90",style: TextStyle(
                          color: Colors.black45,
                          fontWeight: FontWeight.w300,
                          fontSize: textsize,
                        ),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  children: [
                    Text("Delivery Information",style: TextStyle(
                      fontSize:size.width*0.07,
                      fontWeight: FontWeight.w500,
                    ),),
                    SizedBox(width: 10,),
                    Icon(Icons.info_sharp,color: Colors.indigo,)
                  ],
                ),
              ),
            ),
            GestureDetector(
                onTap: () async {
                  var res = await uploadImage(widget.imageFile[0].path, uploadUrl);
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("$res")));
                },
                child: CustomButton(size: size, buttontext: "PLACE ORDER",height: 55,color: Colors.indigo,))
          ],
        ),
      ),
    );
  }
}
