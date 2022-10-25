import 'package:flutter/material.dart';

import '../wigate/custom_text.dart';
class CartView extends StatelessWidget {
  const CartView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)

        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
                margin: EdgeInsets.all(10),
                child: Image.asset("assets/images/taskapp/img.png")
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "Cold Coffee",size: 14,fontWeight: FontWeight.bold,),
                    CustomText(text: "Lime with Coffee",size: 12,color: Colors.grey,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        CustomText(text: "\$24",size: 16,fontWeight: FontWeight.bold,),
                        IconButton(onPressed: (){}, icon: Icon(Icons.favorite_border))
                      ],
                    ),
                    SizedBox(height: 2,),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}