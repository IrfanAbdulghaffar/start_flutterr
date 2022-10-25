
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:start_flutterr/Learning%20App/BookYourClass.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
        title: Text(
          "HOME",
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
          child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              SizedBox(
                height: 40,
              ),
              Text(
                'Welcome Back \nJohn De',
                style: TextStyle(
                    fontSize: size.width/10,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => const BookYourClass()),
                      );
                    },
                    child: Container(
                      alignment: Alignment.center,
                      height: size.width/8.5,
                      width: size.width /3,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black45,
                            blurRadius: 5,
                            offset: Offset(2, 4),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.deepPurple,
                      ),
                      child: Text(
                        "Book Class",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width/20,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: size.width/20,),
                  Container(
                    alignment: Alignment.center,
                    height: size.width/8.5,
                    width: size.width /3,
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          blurRadius: 5,
                          offset: Offset(2, 4),
                        ),
                      ],
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.deepPurple,
                    ),
                    child: Text(
                      "My Courses",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: size.width/20,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                  height: 40,
                ),
              Text(
                  'Last Classes',
                  style: TextStyle(
                      fontSize: 30,
                      color: Colors.deepPurple
                  ),
                ),

              Container(
                height: size.width/1.40,
                child: ListView(
                    scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/lastclasses.png",
                                height: (size.width/1.4)/2,
                                width: size.width/1.5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              height: (size.width/1.07)/3,
                              width: size.width/1.5,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Arts & Humanities',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    'Draw and paint Arts',
                                    style: TextStyle(
                                        fontSize: size.width/20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    '2h 25min',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/lastclasses.png",
                              height: (size.width/1.4)/2,
                              width: size.width/1.5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              height: (size.width/1.07)/3,
                              width: size.width/1.5,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Arts & Humanities',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    'Draw and paint Arts',
                                    style: TextStyle(
                                        fontSize: size.width/20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    '2h 25min',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/lastclasses.png",
                              height: (size.width/1.4)/2,
                              width: size.width/1.5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              height: (size.width/1.07)/3,
                              width: size.width/1.5,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Arts & Humanities',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    'Draw and paint Arts',
                                    style: TextStyle(
                                        fontSize: size.width/20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    '2h 25min',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/lastclasses.png",
                              height: (size.width/1.4)/2,
                              width: size.width/1.5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              height: (size.width/1.07)/3,
                              width: size.width/1.5,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Arts & Humanities',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    'Draw and paint Arts',
                                    style: TextStyle(
                                        fontSize: size.width/20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    '2h 25min',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black45,
                              blurRadius: 5,
                              offset: Offset(2, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          children: [
                            Image.asset("assets/images/lastclasses.png",
                              height: (size.width/1.4)/2,
                              width: size.width/1.5,
                            ),
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),
                              padding: EdgeInsets.all(10),
                              height: (size.width/1.07)/3,
                              width: size.width/1.5,

                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Arts & Humanities',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    'Draw and paint Arts',
                                    style: TextStyle(
                                        fontSize: size.width/20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.deepPurple
                                    ),
                                  ),
                                  SizedBox(height: size.width/24,),
                                  Text(
                                    '2h 25min',
                                    style: TextStyle(
                                        fontSize: size.width/23,
                                        color: Colors.deepPurple
                                    ),
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
              )
            ],
          ),
      ),
        ),
    );
  }
}

