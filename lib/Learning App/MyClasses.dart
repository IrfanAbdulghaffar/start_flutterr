import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
class MyClasses extends StatefulWidget {
  const MyClasses({Key? key}) : super(key: key);

  @override
  State<MyClasses> createState() => _MyClassesState();
}

class _MyClassesState extends State<MyClasses> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
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
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: size.width/2.9,
              width: size.width,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black45,
                    blurRadius: 5,
                    offset: Offset(2, 4),
                  ),
                ],
                borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/lastclasses.png",
                    height: size.width/2.9,
                    width: size.width/2.9,fit:BoxFit.cover,

                  ),
                  Container(

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                    ),
                    padding: EdgeInsets.all(0),
                    height: size.width/2.9,
                    width: size.width-(size.width/2.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.width/40,),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Arts & Humanities',
                            style: TextStyle(
                                fontSize: size.width/20,
                                color: Colors.deepPurple
                            ),
                          ),
                        ),
                        SizedBox(height: size.width/35,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Arts & Humanities',
                            style: TextStyle(
                                fontSize: size.width/27,
                                color: Colors.deepPurple
                            ),
                          ),
                        ),
                        SizedBox(height: size.width/35,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '70% Complete',
                            style: TextStyle(
                                fontSize: size.width/30,
                                color: Colors.deepPurple
                            ),
                          ),
                        ),
                        LinearPercentIndicator(
                          barRadius: Radius.circular(10),
                          width: size.width-(size.width/2.05),
                          lineHeight: 7.0,
                          percent: 0.7,
                          backgroundColor: Colors.black12,
                          progressColor: Colors.deepPurple,
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              height: size.width/2.9,
              width: size.width,
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black45,
                      blurRadius: 5,
                      offset: Offset(2, 4),
                    ),
                  ],
                  borderRadius: BorderRadius.circular(5)
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/lastclasses.png",
                    height: size.width/2.9,
                    width: size.width/2.9,fit:BoxFit.cover,

                  ),
                  Container(

                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topRight: Radius.circular(5),bottomRight: Radius.circular(5))
                    ),
                    padding: EdgeInsets.all(0),
                    height: size.width/2.9,
                    width: size.width-(size.width/2.3),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: size.width/40,),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Arts & Humanities',
                            style: TextStyle(
                                fontSize: size.width/20,
                                color: Colors.deepPurple
                            ),
                          ),
                        ),
                        SizedBox(height: size.width/35,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            'Arts & Humanities',
                            style: TextStyle(
                                fontSize: size.width/27,
                                color: Colors.deepPurple
                            ),
                          ),
                        ),
                        SizedBox(height: size.width/35,),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text(
                            '70% Complete',
                            style: TextStyle(
                                fontSize: size.width/30,
                                color: Colors.deepPurple
                            ),
                          ),
                        ),
                        LinearPercentIndicator(
                          barRadius: Radius.circular(10),
                          width: size.width-(size.width/2.05),
                          lineHeight: 7.0,
                          percent: 0.7,
                          backgroundColor: Colors.black12,
                          progressColor: Colors.deepPurple,
                        ),

                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
