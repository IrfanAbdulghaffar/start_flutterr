import 'package:flutter/material.dart';
import 'package:start_flutterr/Learning%20App/HomeScreen.dart';

import '../wigate/custom_button.dart';
class BookYourClass extends StatefulWidget {
  const BookYourClass({Key? key}) : super(key: key);

  @override
  State<BookYourClass> createState() => _BookYourClassState();
}

class _BookYourClassState extends State<BookYourClass> {
  var value=false;

  String? dropdownValue;
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
          Container(
            margin: EdgeInsets.only(left: 10,top: 10,bottom: 30),
            height: size.width/2.268,
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
                          height: (size.width)/5.1,
                          width: size.width/2.8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10),
                          height: (size.width)/5,
                          width: size.width/2.8,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arts & Humanities',
                                style: TextStyle(
                                    fontSize: size.width/30,
                                    color: Colors.deepPurple
                                ),
                              ),
                              SizedBox(height: size.width/30,),
                              Text(
                                '12 Courses',
                                style: TextStyle(
                                    fontSize: size.width/30,
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
                          height: (size.width)/5.1,
                          width: size.width/2.8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10),
                          height: (size.width)/5,
                          width: size.width/2.8,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arts & Humanities',
                                style: TextStyle(
                                    fontSize: size.width/30,
                                    color: Colors.deepPurple
                                ),
                              ),
                              SizedBox(height: size.width/30,),
                              Text(
                                '12 Courses',
                                style: TextStyle(
                                    fontSize: size.width/30,
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
                          height: (size.width)/5.1,
                          width: size.width/2.8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10),
                          height: (size.width)/5,
                          width: size.width/2.8,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arts & Humanities',
                                style: TextStyle(
                                    fontSize: size.width/30,
                                    color: Colors.deepPurple
                                ),
                              ),
                              SizedBox(height: size.width/30,),
                              Text(
                                '12 Courses',
                                style: TextStyle(
                                    fontSize: size.width/30,
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
                          height: (size.width)/5.1,
                          width: size.width/2.8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10),
                          height: (size.width)/5,
                          width: size.width/2.8,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arts & Humanities',
                                style: TextStyle(
                                    fontSize: size.width/30,
                                    color: Colors.deepPurple
                                ),
                              ),
                              SizedBox(height: size.width/30,),
                              Text(
                                '12 Courses',
                                style: TextStyle(
                                    fontSize: size.width/30,
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
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20.0),
            child: Row(
              children: [
                Column(
                  children: [
                    Text(
                      "Select Class",
                      style: TextStyle(
                        fontSize: size.width/20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,

                      ),

                    ),
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
                      child: DropdownButton<String>(

                        hint:   Text(
                          "Book Class",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: size.width/20,
                          ),
                        ),
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_drop_down,color: Colors.white,),
                        iconSize: 24,
                        elevation: 16,
                        style: const TextStyle(
                            color: Colors.deepPurple
                        ),
                        underline: Container(
                          height: 2,
                          color: Colors.deepPurple,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['One', 'Two', 'Free', 'Four']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        })
                            .toList(),
                      ),

                    ),
                  ],
                ),
                SizedBox(width: 20,),
                Column(
                  children: [
                    Text(
                      "Select Class",
                      style: TextStyle(
                        fontSize: size.width/20,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,

                      ),

                    ),
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
                        "Book Class",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: size.width/20,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,top: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "Arts & Humanities",
                  style: TextStyle(
                      fontSize: size.width/24,
                      fontWeight: FontWeight.bold,
                      color: Colors.deepPurple,

                  ),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 10),
            height: size.width/2.268,
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
                          height: (size.width)/5.1,
                          width: size.width/2.8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10),
                          height: (size.width)/5,
                          width: size.width/2.8,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arts & Humanities',
                                style: TextStyle(
                                    fontSize: size.width/30,
                                    color: Colors.deepPurple
                                ),
                              ),
                              SizedBox(height: size.width/30,),
                              Text(
                                '12 Courses',
                                style: TextStyle(
                                    fontSize: size.width/30,
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
                          height: (size.width)/5.1,
                          width: size.width/2.8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10),
                          height: (size.width)/5,
                          width: size.width/2.8,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arts & Humanities',
                                style: TextStyle(
                                    fontSize: size.width/30,
                                    color: Colors.deepPurple
                                ),
                              ),
                              SizedBox(height: size.width/30,),
                              Text(
                                '12 Courses',
                                style: TextStyle(
                                    fontSize: size.width/30,
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
                          height: (size.width)/5.1,
                          width: size.width/2.8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10),
                          height: (size.width)/5,
                          width: size.width/2.8,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arts & Humanities',
                                style: TextStyle(
                                    fontSize: size.width/30,
                                    color: Colors.deepPurple
                                ),
                              ),
                              SizedBox(height: size.width/30,),
                              Text(
                                '12 Courses',
                                style: TextStyle(
                                    fontSize: size.width/30,
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
                          height: (size.width)/5.1,
                          width: size.width/2.8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          padding: EdgeInsets.all(10),
                          height: (size.width)/5,
                          width: size.width/2.8,

                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Arts & Humanities',
                                style: TextStyle(
                                    fontSize: size.width/30,
                                    color: Colors.deepPurple
                                ),
                              ),
                              SizedBox(height: size.width/30,),
                              Text(
                                '12 Courses',
                                style: TextStyle(
                                    fontSize: size.width/30,
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
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: EdgeInsets.only(left: size.width * .12),
            child: Row(
              children: [
                Checkbox(
                  activeColor: Colors.deepPurple,
                  value: this.value,
                  onChanged: (var value) {
                    setState(() {
                      this.value = value!;
                    });
                  },
                ),
                Text(
                  "Are you sure with selected Class ?",
                  style: TextStyle(fontSize: 14, color: Colors.deepPurple),
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                // api callling
                if(value==true)
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const HomeScreen()),
                  );
              },
              child: CustomButton(
                size: size,
                buttontext: 'Book Class Now',
              )),
        ],
      ),
    );
  }
}
