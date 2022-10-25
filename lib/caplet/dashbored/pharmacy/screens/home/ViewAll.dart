import 'package:flutter/material.dart';
import 'package:start_flutterr/caplet/dashbored/pharmacy/screens/home/ProductCetagoryScreen.dart';

import '../../../../models/Models.dart';
import 'ProductDetail.dart';
import 'Pharmacy.dart';

class ViewAll extends StatelessWidget {
  ViewAll({Key? key, this.categoryList=const [],}) : super(key: key);
  List<CategoryModel> categoryList=[];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("View All"),
        centerTitle: true,
      ),
      body:  GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,


          ),
          itemCount: categoryList.length,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: (){
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ProductDetailCategory(id:index, categoryList: categoryList,)));
              },
              child: Container(
                margin: EdgeInsets.all(10),
                child: TopCategories(icon: categoryList[index].image,text:categoryList[index].item,),
              ),
            );
          }),
    );
  }
}
class ViewAllProduct extends StatelessWidget {
  ViewAllProduct({Key? key,
     required this.productDetails
     }) : super(key: key);
  List<ProductDetails> productDetails=[];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo,
        title: Text("New"),
        centerTitle: true,
      ),
      body:  GridView.builder(

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
    );
  }
}


