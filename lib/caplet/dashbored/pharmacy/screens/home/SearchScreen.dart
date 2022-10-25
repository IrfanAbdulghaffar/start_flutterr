import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../../models/Models.dart';
import 'ProductDetail.dart';
class Searchproduct extends StatefulWidget {
  const Searchproduct({Key? key}) : super(key: key);

  @override
  State<Searchproduct> createState() => _SearchproductState();
}

class _SearchproductState extends State<Searchproduct> {
  bool isLoading=false;
  String searchtext="a";
  List<ProductDetails> productDetails=[];
  Future<http.Response> createAlbum( ){
    setState((){
      isLoading=true;
    });
    return http.post(
      Uri.parse('https://caplet.pk/api/keyword-search'),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded',
        'Os':'',
        'Device-Name':'',
        'Device-Token':''
      },
      body: <String, String>{
        'search': searchtext,
        'per_page':'10',
        'page':'1',
      },
    );
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        automaticallyImplyLeading: false,
        title: TextField(
          onChanged: (text){
            searchtext=text;
            createAlbum().then((value){
              Map<String,dynamic> response = jsonDecode(value.body);
              productDetails=((response["data"] as Map)["data"] as List).map((e) => ProductDetails.fromJson(e)).toList();
              setState((){
                isLoading=false;
              });
            });
          },
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.black, fontSize: 16.0),
          decoration: InputDecoration(
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
              fillColor: Colors.white,
              filled: true,
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              hintText: "Search"),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Cancel",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: isLoading?Center(child: CircularProgressIndicator(),):ListView.builder(
                  itemCount: productDetails.length,
                  itemBuilder: (context,index){
                    return  GestureDetector(
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ProductDetail(productDetails: productDetails[index],)));
                      },
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
                                          image: "https://caplet.pk/admin/products/${productDetails[index].image}"),
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
                                              style: TextStyle(
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
                                          ],
                                        ),

                                        Container(
                                          width: size.width*0.7,
                                          child: Row(
                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                            children: [
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
                                              Padding(
                                                padding: const EdgeInsets.only(right: 14,top: 12,bottom: 12),
                                                child: Text(
                                                  "Add to cart",
                                                  style: TextStyle(
                                                    color: Colors.green,
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.bold,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    )
                                )
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

