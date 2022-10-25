import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:start_flutterr/other/CustomColor.dart';
import 'package:start_flutterr/wigate/colors.dart';
import 'package:start_flutterr/wigate/dimens.dart';

import '../wigate/custom_text.dart';

class TaskHome extends StatefulWidget {
  const TaskHome({Key? key}) : super(key: key);

  @override
  State<TaskHome> createState() => _TaskHomeState();
}

class _TaskHomeState extends State<TaskHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Mycolor.appback,
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
          icon: Icon(Icons.workspaces),
          color: Colors.black,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.shopping_cart_outlined),
            color: Colors.black,
          ),
          SizedBox(width: 5)
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 25,),

            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: CustomText(text: 'Fresh Taste of',size: 24,fontWeight: FontWeight.w900,),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20),
              child: CustomText(text: 'Designer Cakes',size: 28,fontWeight: FontWeight.w300,color: Colors.black45,),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.cake_outlined,),),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.icecream_outlined)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: IconButton(onPressed: (){}, icon: Icon(Icons.wine_bar_outlined)),
                ),
                Container(
                  height: 50,
                  width: 50,
                  decoration: BoxDecoration(
                    color: Mycolor.appColor,
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.1),
                        blurRadius: 3,
                        offset: Offset(0, 2), // changes position of shadow
                      ),
                    ],
                  ),
                  child: Center(child: CustomText(text: "All",color: Colors.white,size: 16,))
                ),
              ],
            ),
            SizedBox(height: 20),
            GridView.builder(
              padding: EdgeInsets.all(20),
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20.0,
                mainAxisSpacing: 20,
                childAspectRatio: 0.6
              ),
              itemCount: 10,
              itemBuilder: (context, index) {
                return Container(

                  child:  Card(),
                );
              },
            )

          ],
        ),
      ),
    );
  }


}


