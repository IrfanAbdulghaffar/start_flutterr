import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:start_flutterr/wigate/custom_button.dart';

import '../../../../other/sqlflite/DBhelper.dart';
import '../Order.dart';


class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  DBhelpler? dBhelpler;
  bool isLoading=false;
  int orderTotel=0;
  List<cart> productDetails=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dBhelpler=DBhelpler();
    datalode();
  }
  datalode(){
    dBhelpler!.getCartData().then((value) {
      productDetails=value;
      orderTotel=0;
      for(int i=0;i<productDetails.length;i++){
        orderTotel=orderTotel+(int.parse('${productDetails[i].price}'))*(int.parse('${productDetails[i].qtr}'));
      }
      setState((){
        isLoading=false;
      });
    }
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Your Cart"),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
                    itemCount: productDetails.length,
                    itemBuilder: (context,index){
                      return
                        GestureDetector(
                        child: Container(
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                 Row(
                                   children: [
                                     Padding(
                                       padding: const EdgeInsets.all(8.0),
                                       child: Container(
                                         height: size.width * 0.22,
                                         width: size.width * 0.22,
                                         child: Container(
                                           height: double.infinity,
                                           width: double.infinity,
                                           child: FadeInImage.assetNetwork(
                                               placeholder: "assets/images/catPlaceholder.png",
                                               image: "https://caplet.pk/admin/products/${productDetails[index].image}"
                                           ),
                                         ),
                                       ),
                                     ),
                                     Container(
                                         child: Column(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           children: [
                                             Column(
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                               children: [
                                                 Text(
                                                   "${productDetails[index].title}",
                                                   style: const TextStyle(
                                                     fontSize: 16,
                                                     fontWeight: FontWeight.w400,
                                                   ),
                                                 ),
                                                 SizedBox(
                                                   height: 3,
                                                 ),
                                                 Text("${productDetails[index].size}",
                                                     style: TextStyle(
                                                         fontSize: 12,
                                                         color: Colors.black45
                                                     )),
                                                 SizedBox(
                                                   height: 8,
                                                 ),
                                               ],
                                             ),
                                             Row(
                                               children: [
                                                 Text(
                                                   "Rs${productDetails[index].price}.00",
                                                   style: TextStyle(
                                                     fontSize: 16,
                                                     fontWeight: FontWeight.w500,
                                                   ),
                                                 ),
                                                 SizedBox(width: 5,),
                                                 Text("Rs${productDetails[index].price}.00",
                                                     style: TextStyle(
                                                       color: Colors.black45,
                                                       decoration: TextDecoration.lineThrough,
                                                       fontSize: 12,
                                                     )),
                                               ],
                                             ),
                                           ],
                                         )
                                     ),
                                   ],
                                 ),
                                 Padding(
                                   padding: const EdgeInsets.only(right: 10),
                                   child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        GestureDetector(
                                          onTap:(){
                                            dBhelpler!.deletecart(productDetails[index].id);
                                            setState((){
                                              datalode();
                                            });
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(2.0),
                                            child: Container(
                                              height: size.width * 0.06,
                                              width: size.width * 0.06,
                                              child: Container(
                                                height: double.infinity,
                                                width: double.infinity,
                                                child: Image.asset('assets/images/delete_icon.png')
                                              ),
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.only(top: 10),
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              GestureDetector(
                                                onTap: (){
                                                  productDetails[index].qtr=productDetails[index].qtr!+1;
                                                  dBhelpler!.updatecart(productDetails[index]);
                                                  setState((){
                                                    datalode();
                                                  });
                                                },
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(),
                                                      shape: BoxShape.circle
                                                  ),
                                                  child:Icon(Icons.add,size: 14,),
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              Text(
                                                "${productDetails[index].qtr}",
                                                style: TextStyle(
                                                    fontSize: 14
                                                ),
                                              ),
                                              SizedBox(width: 5,),
                                              GestureDetector(
                                                onTap: (){
                                                  if( productDetails[index].qtr!>1)
                                                  productDetails[index].qtr=productDetails[index].qtr!-1;
                                                  dBhelpler!.updatecart(productDetails[index]);
                                                  setState((){
                                                    datalode();
                                                  });
                                                },
                                                child: Container(
                                                  height: 20,
                                                  width: 20,
                                                  decoration: BoxDecoration(
                                                      border: Border.all(),
                                                      shape: BoxShape.circle
                                                  ),
                                                  child:  Icon(Icons.remove,size: 14,),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                 ),
                                ],
                              ),
                              Container(
                                margin: EdgeInsets.symmetric(horizontal: 10),
                                height: 1,
                                width: double.infinity,
                                color: Colors.black26,
                              ),

                            ],
                          ),
                        ),
                      );
                    }
                )
            ),
          ),
          Container(
            padding: EdgeInsets.all(15),
            height: size.width*0.8,
            width: size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text("PAYMENT SUMMARY",style: TextStyle(color: Colors.indigo,fontWeight: FontWeight.w600),),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Order Total",style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                    ),),
                    Text("Rs$orderTotel.00",style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Itmes Discount",style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                    ),),
                    Text("-Rs190.00",style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Shipping",style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                    ),),
                    Text("Free",style: TextStyle(
                        color: Colors.black45,
                        fontSize: 15,
                    ),),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate((size.width*0.1).toInt(), (index) => Container(margin: EdgeInsets.symmetric(horizontal: 2), height: 1,width: 5,color: Colors.black26
                    ,)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("TOTAL",
                      style: TextStyle(
                      color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                    Text("Rs$orderTotel.00",
                      style: TextStyle(
                      color: Colors.red,
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                      ),
                    ),
                  ],
                ),
                GestureDetector(
                  onTap: (){
                   if(productDetails.length!=0) {
                     showDialog(context: context, builder: (context) {
                       return AlertDialog(
                         title: Text("Confirm"),
                         content: Text("Are you showr to post this Order"),
                         actions: [
                           CupertinoButton(child: Text("No"), onPressed: () {
                             Navigator.pop(context);
                           }),
                           CupertinoButton(
                               child: Text("Confirm"), onPressed: () {
                             Navigator.pushReplacement(context, MaterialPageRoute(
                               builder: (context) =>
                                   Order(ProductsList: productDetails,Total: orderTotel),
                             ),
                             );
                           }),
                         ],
                       );
                     });
                   }
                   },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: CustomButton(size: size, buttontext: "CHECKOUT",height: 50,color: Colors.indigo,),
                  ),
                ),
              ],
            ),

          )
        ],
      ),

    );
  }
}

