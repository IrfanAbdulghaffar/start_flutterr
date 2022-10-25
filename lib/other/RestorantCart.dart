import 'package:flutter/material.dart';

int qty=1,CartItem=0;
double Tprice=6.99,OneItem=6.99;

class CardsApp extends StatefulWidget {
  const CardsApp({Key? key}) : super(key: key);

  @override
  State<CardsApp> createState() => _CardsState();
}

class _CardsState extends State<CardsApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardScreen(),
    );
  }
}

class CardScreen extends StatefulWidget {
  CardScreen({
    Key? key,
  }) : super(key: key);

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/food.jpg",fit:BoxFit.fitWidth,),
          Padding(
            padding: const EdgeInsets.only(top: 300),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(topRight:Radius.circular(30.0),topLeft: Radius.circular(30))
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 25,right: 25,top: 30),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:  [
                            SizedBox(
                              width: size.width*0.6,
                              child: const Text("Salmon and Zucchini",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 24
                                ),),
                            ),
                            Text("Italian cusine",
                              style: TextStyle(
                                  fontSize: 18
                              ),),
                          ],
                        ),
                        Column(
                          children: const [
                            Icon(
                              Icons.star,
                              color: Colors.amber,
                              size: 40,
                            ),
                            Text(
                              "4.5",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16
                              ),),
                          ],
                        )
                      ],
                    ),
                    PriceQty(),
                    Padding(
                      padding: EdgeInsets.only(top: 15),
                      child: const Text("Description",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18

                      ),),
                    ),
                     Padding(
                       padding: const EdgeInsets.only(top: 8.0),
                       child: Text(" You wouldn't call delicious that what is tasteless or unpleasant.",
                        textAlign: TextAlign.justify,
                          style: TextStyle(
                              fontSize: 16
                          )),
                     ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Flexible(
                            child: Text("Maria and 35 other liked this",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16

                              ),),
                          ),
                          SizedBox(width: 8,),
                          Text("4.5 of 5",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16

                            ),),
                        ],
                      ),
                    ),
                    Container(
                      height: 60,
                      margin: EdgeInsets.only(top: 6),
                      width: size.width,
                      decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: List.generate(4, (index) =>                               imageContaner(),),
                          ),
                          Row(
                            children: const [
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star,color: Colors.amber,),
                              Icon(Icons.star_border),
                              SizedBox(
                                width: 15,
                              ),
                            ],
                          )
                        ],
                      )
                    ),
                  ],
                ),

              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20,right: 20,top: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),
                  child: Icon(Icons.chevron_left),
                ),
                Container(
                  height: 40,
                  width: 40,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10)
                  ),

                  child:Stack(
                    alignment: Alignment.topRight,
                    children: [
                      Center(child: Icon(Icons.shopping_cart)),
                      Container(
                        padding: EdgeInsets.all(2),
                        margin: const EdgeInsets.all(5.0),
                        decoration: BoxDecoration(
                            color: Colors.red,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Cart(),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(left: 25,bottom: 25),
              child: Row(
                children: [
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: Colors.red[100],
                        borderRadius: BorderRadius.circular(10)
                    ),
                    child: Icon(Icons.favorite,color: Colors.red,
                    size: 30,),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: GestureDetector(
                      onTap: (){
                        setState((){
                          CartItem++;
                        });
                      },
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.redAccent,
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(50),bottomLeft: Radius.circular(50))
                        ),
                        child: Center(
                          child: Text("Add to  Cart",style: TextStyle(
                            color: Colors.white,
                            fontSize: 18
                          ),),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget imageContaner() {
    return Container(
      height: 32,
      width: 32,
      margin: EdgeInsets.only(left: 8),
      decoration: BoxDecoration(
          shape:BoxShape.circle,
        border: Border.all(
          color: Colors.black,
        ),
        image: DecorationImage(
            image: AssetImage('assets/images/a.png'))
      ),
    );
  }
}

class Cart extends StatefulWidget {
  const Cart({
    Key? key,
  }) : super(key: key);

  @override
  State<Cart> createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Text("$CartItem",
      style: TextStyle(
          color: Colors.white,
        fontSize: 10
      ),

    );
  }
}

class PriceQty extends StatefulWidget {
  const PriceQty({Key? key}) : super(key: key);

  @override
  State<PriceQty> createState() => _PriceQtyState();
}

class _PriceQtyState extends State<PriceQty> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          addQuantity(Icons.add,(){
            setState((){
              qty++;
              Tprice=OneItem*qty;
            });
          }),
          Padding(
            padding: EdgeInsets.all(15.0),
            child: Text("$qty",
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24
              ),
            ),
          ),
          addQuantity(Icons.remove,(){
            setState((){
              if(qty>1){
                qty--;
                Tprice=OneItem*qty;
              }

            });
          }),
          Spacer(),
          Text("\$${Tprice.toStringAsFixed(2)}",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
            ),)
        ],
      ),
    );
  }

  Widget addQuantity(IconData icon,Function()? onTap ) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
            color: Colors.red[100],
            borderRadius: BorderRadius.circular(10)
        ),
        child: Icon(icon),
      ),
    );
  }
}
