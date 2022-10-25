import 'package:flutter/material.dart';
import 'package:start_flutterr/main.dart';

import '../../../other/sqlflite/DBhelper.dart';

class OrderScreen extends StatefulWidget {
  OrderScreen({
    Key? key,
    required this.id,
  }) : super(key: key);
  int id;
  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  DBhelpler? dBhelpler;
  bool isLoading=false;

  List<product> productDetail=[];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dBhelpler=DBhelpler();
    datalode();
  }
  datalode(){
    dBhelpler?.getproductData(widget.id).then((value) => {
      productDetail=value,
      setState((){}),
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Order Detali"),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
                    itemCount: productDetail.length,
                    itemBuilder: (context,index){
                      return
                        GestureDetector(
                          child: Container(
                            color: Colors.white,
                            child: Column(
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
                                              image: "https://caplet.pk/admin/products/${productDetail[index].image}"
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
                                                  "${productDetail[index].title}",
                                                  style: const TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 3,
                                                ),
                                                Text("${productDetail[index].size}",
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
                                                  "Rs${productDetail[index].price}.00",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                                SizedBox(width: 5,),
                                                Text("Rs${productDetail[index].price}.00",
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
        ],
      ),

    );
  }
}


class Order extends StatefulWidget {
  Order({Key? key,
    this.Total=0,
    this.ProductsList=const[]

  }) : super(key: key);
  int Total;
  List<cart> ProductsList=[];

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  DBhelpler? dBhelpler;
  bool isLoading=false;
  int orderTotel=0;
  List<product> productDetail=[];
  List<cart> cartProduct=[];
  List<order> Orders=[];
  late int orderId;
  @override

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dBhelpler=DBhelpler();
    if(widget.Total!=0){
     dBhelpler?.insertorder(order(total: widget.Total));
    }
    dBhelpler?.getorderData().then((value) => {
      orderId=value.length,
      Orders=value,
      setState((){
      })
    });
    if(widget.Total!=0){
      datalode();
    }
    dBhelpler?.clean();
  }
  datalode(){

    dBhelpler!.getCartData().then((value){
      for(int i=0;i<value.length;i++){
        dBhelpler!.insertproduct(product(id: value[i].id, title: value[i].title, image: value[i].image, price: value[i].price, discount: value[i].discount, description: value[i].description, size: value[i].size, qtr: value[i].qtr, orderId: orderId));
      }
      setState((){
        isLoading=false;
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.indigo,
        title: Text("Order"),
        centerTitle: true,
      ),
      body:  Column(
        children: [
          Expanded(
            child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5),
                child: isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
                    itemCount: Orders.length,
                    itemBuilder: (context,index){
                      return
                        GestureDetector(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>OrderScreen(id: Orders[index].id,)));
                          },
                          child: Container(
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: size.width * 0.22,
                                        width: size.width * 0.22,
                                        child: Center(child: Text("${Orders[index].id}")),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Container(
                                        height: size.width * 0.22,
                                        width: size.width * 0.22,
                                        child: Container(
                                          height: double.infinity,
                                          width: double.infinity,
                                          child: Center(child: Text("${Orders[index].total}"))
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap: (){
                                        Navigator.push(context, MaterialPageRoute(builder: (context)=>MapSample()));
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Container(
                                          height: size.width * 0.22,
                                          width: size.width * 0.22,
                                          child: Container(
                                            height: double.infinity,
                                            width: double.infinity,
                                            child: Center(child: Container(
                                              padding: EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                                              decoration: BoxDecoration(
                                                color: Colors.indigo,
                                                borderRadius: BorderRadius.circular(30)
                                              ),
                                              child: Text("Track",
                                              style:TextStyle(
                                                color: Colors.white,
                                                fontSize: 16
                                              ),
                                              ),
                                            ))
                                          ),
                                        ),
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
        ],
      ),

    );
  }
}
