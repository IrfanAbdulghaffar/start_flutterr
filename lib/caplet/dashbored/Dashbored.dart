import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:start_flutterr/caplet/dashbored/assan_madicine/uploadPriscription.dart';

import 'pharmacy/dashbored_main.dart';
class Dashbored extends StatefulWidget {
  const Dashbored({Key? key}) : super(key: key);

  @override
  State<Dashbored> createState() => _DashboredState();
}

class _DashboredState extends State<Dashbored> {
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(

      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
                width: size.width,
                child: Image.asset("assets/images/selectoption.png",fit: BoxFit.cover,)),
            SizedBox(
              height: 30,
            ),
            Container(
                child: Image.asset("assets/images/selcetoption_dot.png")),
            SizedBox(
              height: 30,
            ),
            Text("View & Buy Medicine online",style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),),
            SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> UplodePriscription()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Container(
                  height: size.width/3.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.lightBlueAccent
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset("assets/images/doc_icon_.png"),
                          ),
                          Text("Assan Madicine",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                            fontFamily: 'assets/fonts/Lato-Black.ttf',
                          ),),

                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
                          SizedBox(width: 20,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=> dashbored_main()));
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 10),
                child: Container(
                  height: size.width/3.5,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.redAccent
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Image.asset("assets/images/Pharmacy_1.png"),
                          ),
                          Text("Pharmacy",style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 20,
                          ),),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.arrow_forward_ios,color: Colors.white,size: 20,),
                          SizedBox(width: 20,)
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}
