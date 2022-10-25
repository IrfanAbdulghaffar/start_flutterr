import 'package:flutter/material.dart';
import 'package:start_flutterr/main.dart';

import '../other/Shose.dart';

class OrderListCard extends StatefulWidget {
  const OrderListCard({Key? key,this.title=''}) : super(key: key);
  final String title;

  @override
  State<OrderListCard> createState() => _OrderListCardState();
}

class _OrderListCardState extends State<OrderListCard> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Shoes()),
        );
      },
      child: Container(
          decoration: BoxDecoration(
            border: Border.all(color: Colors.black)
          ),
          height: size.height*0.1,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.all(12),
          child: Row(

            children: [
              Image.asset("assets/images/a.png",fit: BoxFit.fitHeight,),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text("Madison Moore",
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.red
                  ),),
                  Text("Madison Moore",
                  style: TextStyle(
                    fontSize: 14,

                  ),),

                ],),
              ),
            ],
          ),
       ),
    );
    // child: Padding(
    //   padding: const EdgeInsets.all(25.0),
    //   child: Container(
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         border: Border.all(color: Colors.black),
    //         borderRadius: new BorderRadius.circular(10),
    //       ),
    //       padding: const EdgeInsets.all( 10),
    //       child: Row(
    //         children: [
    //           Column(
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: const [
    //               Text("Order No.#M3DEWX4"),
    //               SizedBox(height: 20,),
    //               Text("11-5-2022\n07:01AM"),
    //               SizedBox(height: 20,),
    //               Text("Rs.131",style: TextStyle(
    //                 fontWeight: FontWeight.bold,
    //               ),),
    //             ],
    //           ),
    //           Column(
    //
    //           )
    //         ],
    //       )
    //   ),
    // ),
  }

}

