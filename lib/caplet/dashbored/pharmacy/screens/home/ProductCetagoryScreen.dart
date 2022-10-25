import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../../../models/Models.dart';
import 'ProductDetail.dart';
import 'Pharmacy.dart';

class ProductDetailCategory extends StatefulWidget {
  ProductDetailCategory({Key? key,
    required this.id,
    required this.categoryList
  }) : super(key: key);
  int id=0;

  List<CategoryModel> categoryList=[];

  @override
  State<ProductDetailCategory> createState() => _ProductDetailCategoryState();
}

class _ProductDetailCategoryState extends State<ProductDetailCategory> {
  bool isLoading=false;
  Future<http.Response> createAlbum( ){
    setState((){
      isLoading=true;
    });
    return http.post(
      Uri.parse('https://caplet.pk/api/products-by-category'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Os':'',
        'Device-Name':'',
        'Device-Token':''
      },
      body: <String, String>{
        'id': '${widget.id}',
        'per_page':'10',
        'page':'1',
      },
    );
  }
  double scrole=0;
  List<ProductDetails> productDetails=[];
   int selected=0;
  @override
  void initState() {
    print('id s ${widget.id}');
    super.initState();
    scrole=120.0*(widget.id);
    createAlbum().then((value){
      Map<String,dynamic> response = jsonDecode(value.body);
      productDetails=((response["data"] as Map)["data"] as List).map((e) => ProductDetails.fromJson(e)).toList();
      selected=widget.id;
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
        backgroundColor: Colors.indigo,
        title: Text("Product Cetagory"),
        centerTitle: true,
        actions: [
          Stack(
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
                child: Text("1",style: TextStyle(
                  fontSize: 10
                ),),
              )
            ],
          ),
          SizedBox(width: 5,),
        ],
      ),
      body:Column(
            children: [
              Container(

                decoration: const BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                     color: Colors.black26,
                      blurRadius: 7,
                      spreadRadius: 0.0,

                    )
                  ]
                ),
                  margin: EdgeInsets.only(bottom:7),
                  padding: EdgeInsets.symmetric(vertical: 10),
                  height: 120,
                  child: ListView.builder(
                      controller: ScrollController(
                      initialScrollOffset: scrole,
                    ),
                      scrollDirection: Axis.horizontal,
                      itemCount: widget.categoryList.length,
                      itemBuilder: (BuildContext context, int index) {
                       // print('length is ${widget.categoryList.length}');
                        return GestureDetector(
                          onTap: (){
                            setState((){
                              selected=index;
                            });
                            setState((){
                              createAlbum().then((value){
                                Map<String,dynamic> response = jsonDecode(value.body);
                                productDetails=((response["data"] as Map)["data"] as List).map((e) => ProductDetails.fromJson(e)).toList();
                                setState((){
                                  isLoading=false;
                                });
                              });
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.symmetric(horizontal: 5),
                            decoration: BoxDecoration(
                              color: selected==index?Colors.indigo.shade50:Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              //border: Border.all(color: selected==index?Colors.indigo:Colors.white,width: 2)
                            ),
                            child: TopCategories(
                              icon: widget.categoryList[index].image,
                              text: widget.categoryList[index].item,
                            ),
                          ),
                        );
                      })
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 5),
                  child: isLoading?Center(child: CircularProgressIndicator(),):GridView.builder(

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio:0.7,
                        crossAxisCount: 2,
                      ),
                      itemCount: productDetails.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: (){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProductDetail(productDetails: productDetails[index],)));
                          },
                          child: Container(
                            margin: EdgeInsets.all(5),
                            padding: EdgeInsets.all(15),
                            width: size.width * 0.4,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(4),
                                border: Border.all(color: Colors.black26)
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  width: double.infinity,
                                  height: size.width * 0.3,
                                  child: Container(
                                    height:double.infinity,
                                    width: double.infinity,
                                    child: FadeInImage.assetNetwork(
                                        placeholder: "assets/images/catPlaceholder.png",
                                        image: "https://caplet.pk/admin/products/${productDetails[index].image}"
                                    ),
                                  ),
                                ),
                                Container(
                                    child:
                                    Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "${productDetails[index].title}",
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text("${productDetails[index].size}",
                                            style: TextStyle(
                                              fontSize: 14,
                                            )),
                                      ],
                                    )

                                ),
                                Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Rs.${productDetails[index].discount}",
                                            style: TextStyle(
                                              fontSize: 22,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                          Text("Rs.${productDetails[index].price}",
                                              style: TextStyle(
                                                fontSize: 15,
                                              ))
                                        ],
                                      ),
                                      Text("10% 0ff",style: TextStyle(
                                          color: Colors.green,
                                          fontSize: 16
                                      ),),

                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      }),
                ),
              ),
            ],
          )

    );
  }
}

