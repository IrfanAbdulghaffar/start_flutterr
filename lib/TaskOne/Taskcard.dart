import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:start_flutterr/wigate/custom_text.dart';

class TaskCard extends StatefulWidget {
  const TaskCard({Key? key}) : super(key: key);

  @override
  State<TaskCard> createState() => _TaskCardState();
}

class _TaskCardState extends State<TaskCard> {
  int currentIndex = 0;
  List<String> imagesList=["assets/images/taskapp/img.png", "assets/images/taskapp/img.png","assets/images/taskapp/img.png", "assets/images/taskapp/img.png","assets/images/app_icon.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
          // Status bar brightness (optional)
          statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
          statusBarBrightness: Brightness.light, // For iOS (dark icons)
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back_ios),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_vert),
            color: Colors.black,
          ),
          SizedBox(width: 5)
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
          child: CarouselSlider(

            options: CarouselOptions(
                height: 350,
              enlargeCenterPage: true,

            ),
            items: List.generate(imagesList.length, (index) {

              return Container(
                  width: MediaQuery.of(context).size.width,
              margin: EdgeInsets.symmetric(horizontal: 5),
              decoration: BoxDecoration(),
              child: Image.asset(imagesList[index]),
              );
            }),
          )),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(5, (index) => Icon(Icons.fiber_manual_record)),
          ),
          Container(
            margin: EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomText(
                  text: "Blueberry Cake",
                  size: 22,
                  fontWeight: FontWeight.bold,
                ),
                Text(
                  "A cake is a sweet food made by baking a mixture of flour, eggs, sugar, and fat in an oven. Cakes may be large and cut into slices or small and intended for one person only.",
                  style: TextStyle(
                    height: 2,
                    fontSize: 13,
                  ),
                  textAlign: TextAlign.justify,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
