import 'package:flutter/material.dart';
import 'package:start_flutterr/wigate/custom_button.dart';
import '../../../../other/sqlflite/DBhelper.dart';
import 'Cart.dart';
import '../../../../models/Models.dart';

class ProductDetail extends StatefulWidget {
  ProductDetail({Key? key,
    required this.productDetails
  }) : super(key: key);
  ProductDetails productDetails;
  @override
  State<ProductDetail> createState() => _ProductDetailsState();
}
class _ProductDetailsState extends State<ProductDetail> {
  DBhelpler? dBhelpler;
  int qtr=1;
  late int cartproductNo=0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dBhelpler=DBhelpler();
   datalode();
  }
  datalode(){
    dBhelpler!.getCartData().then((value) => {
      cartproductNo=value.length,
      setState((){})
    });
  }
  void qtrfun(int state){
    if(state==1) {
      qtr++;
    } else {
      if(qtr>1)
      qtr--;
    }
  }
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("Product Details"),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => CartScreen()));
            },
            child: Stack(
              alignment: Alignment.topRight,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Center(child: Icon(Icons.shopping_cart_outlined)),
                ),
                Container(
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.red,
                      border: Border.all(color: Colors.white,width: 1)
                  ),
                  child: Text("$cartproductNo",style: TextStyle(
                      fontSize: 10
                  ),),
                )
              ],
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Container(
        margin: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: size.width*.7,
              child: Container(
                height:double.infinity,
                width: double.infinity,
                child: FadeInImage.assetNetwork(
                    placeholder: "assets/images/catPlaceholder.png",
                    image: "https://caplet.pk/admin/products/${widget.productDetails.image}"
                ),
              ),
            ),
            Text(
              "Redoxon Double Action Tables",
              style: TextStyle(
                fontSize: size.width*0.055,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Details",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    )),
                Text("Available in Stock",
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.black45,
                    )),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
               Row(
                 children: [
                   Text(
                     "Rs.3375",
                     style: TextStyle(
                       fontSize: 22,
                       fontWeight: FontWeight.w500,
                     ),
                   ),
                   SizedBox(
                     width: 5,
                   ),
                   Text("Rs.3759",
                       style: TextStyle(
                         fontSize: 20,
                         color: Colors.black45
                       )),
                 ],
               ),
                Text("10% OFF",style: TextStyle(
                    color: Colors.green,
                    fontSize: 17
                ),),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Select Quantity",
                  style: TextStyle(
                    fontSize: 18
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    qtrfun(0);
                    setState((){
                    });
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        shape: BoxShape.circle
                    ),
                    child:  Icon(Icons.remove),
                  ),
                ),
                SizedBox(width: 10,),
                Text(
                  "$qtr",
                  style: TextStyle(
                      fontSize: 20
                  ),
                ),
                SizedBox(width: 10,),
                GestureDetector(
                  onTap: (){
                    qtrfun(1);
                    setState((){});
                  },
                  child: Container(
                    height: 35,
                    width: 35,
                    decoration: BoxDecoration(
                        border: Border.all(),
                        shape: BoxShape.circle
                    ),
                    child:Icon(Icons.add),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 40,
            ),
            Align(
              alignment: Alignment.center,
                child: GestureDetector(
                  onTap: (){
                    dBhelpler?.insertcart(
                        cart(id: widget.productDetails.id, title: widget.productDetails.title, image: widget.productDetails.image, price: widget.productDetails.price, discount: widget.productDetails.price, description: widget.productDetails.description, size:widget.productDetails.size, qtr: qtr)
                    ).then((value){
                      print("Data added");
                    }).onError((error, stackTrace){
                      print(error.toString());
                    });
                    datalode();
                  },
                    child: CustomButton(size: size, buttontext: "Add To Cart",color: Colors.indigo,height:50,))
            )

          ],
        ),
      ),
    );
  }
}