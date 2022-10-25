import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:start_flutterr/caplet/dashbored/pharmacy/screens/home/Cart.dart';
import 'package:start_flutterr/caplet/dashbored/pharmacy/screens/home/SearchScreen.dart';
import 'package:start_flutterr/caplet/dashbored/pharmacy/screens/home/ViewAll.dart';
import 'package:start_flutterr/wigate/wigate.dart';
import '../../../../models/Models.dart';
import '../../../../other/sqlflite/DBhelper.dart';
import 'ProductCetagoryScreen.dart';
import 'ProductDetail.dart';

class Pharmacy extends StatefulWidget {
  const Pharmacy({Key? key}) : super(key: key);

  @override
  State<Pharmacy> createState() => _PharmacyState();
}

class _PharmacyState extends State<Pharmacy> {
  DBhelpler? dBhelpler;
  int _selectedIndex = 0;
  String data = "hiel";
  List<CategoryModel> categoryList = [];
  List<CategoryModel> categoryList2 = [];
  List<Sections> SectionList = [];
  late int cartproductNo=0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    dBhelpler=DBhelpler();
    getApiData();
    datalode();
  }
   datalode(){
    dBhelpler!.getCartData().then((value) => {
      cartproductNo=value.length,
      setState((){})
    });
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.indigo,
        systemOverlayStyle: SystemUiOverlayStyle(
          statusBarColor: Colors.indigo,
          statusBarIconBrightness: Brightness.light,
        ),
        leading: Builder(
          builder: (BuildContext context) {
            return IconButton(
              icon: const Icon(
                Icons.menu,
                size: 30,
              ),
              onPressed: () {
                Scaffold.of(context).openDrawer();
              },
              tooltip: MaterialLocalizations.of(context).openAppDrawerTooltip,
            );
          },
        ),
        title: Text(
          "Capsule Pharmacy",
          style: TextStyle(fontSize: 18),
        ),
        actions: [
          Container(
            padding: EdgeInsets.only(right: 15),
            width: 110,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => Searchproduct()));
                  },
                  child: Icon(
                    Icons.search,
                    size: 26,
                  ),
                ),
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
                Icon(
                  Icons.notifications_outlined,
                  size: 26,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ClipPath(
              clipper: CustomClipPath(),
              child: Container(
                height: 200,
                padding: EdgeInsets.only(left: 20, top: 10, right: 20),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.indigo,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Enhance your pickup experience",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Get a faster ,hassle-free pickup at\n your precise location",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: const [
                            Text(
                              "Torn on Location ",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                              ),
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                        Icon(
                          Icons.location_on_outlined,
                          color: Colors.white,
                          size: 50,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.only(left: 20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Top Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => ViewAll(
                                        categoryList: categoryList2,
                                      )));
                        },
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            "View all",
                            style:
                                TextStyle(color: Colors.black45, fontSize: 16),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                      margin: EdgeInsets.only(top: 5),
                      height: 100,
                      child: ListView.builder(
                          scrollDirection: Axis.horizontal,
                          itemCount: categoryList.length,
                          itemBuilder: (BuildContext context, int index) {
                            return GestureDetector(
                              onTap: (){
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => ProductDetailCategory(id:index, categoryList: categoryList,)));
                              },
                              child: TopCategories(
                                icon: categoryList[index].image,
                                text: categoryList[index].item,
                              ),
                            );
                          })),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Image.asset("assets/images/phome.png"),
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: SectionList.length,
                itemBuilder: (BuildContext context, int index) {
                  return SectionView(
                      SectionList: SectionList, size: size, index: index);
                }),
            // Container(
            //   padding: EdgeInsets.only(left: 20),
            //   child: Column(
            //     children: [
            //       Row(
            //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //         children: [
            //           Text(
            //             "new",
            //             style: TextStyle(
            //                 fontWeight: FontWeight.bold, fontSize: 18),
            //           ),
            //           GestureDetector(
            //             onTap: (){
            //               ViewAllfunction(context);
            //               },
            //             child: Padding(
            //               padding: EdgeInsets.all(15.0),
            //               child: Text(
            //                 "View all",
            //                 style:
            //                     TextStyle(color: Colors.black45, fontSize: 16),
            //               ),
            //             ),
            //           ),
            //         ],
            //       ),
            //       Container(
            //           margin: EdgeInsets.only(top: 5),
            //           height: size.width * 0.5,
            //           child: ListView.builder(
            //               scrollDirection: Axis.horizontal,
            //               itemCount: ProductList.length,
            //               itemBuilder: (BuildContext context, int index) {
            //                 return ProductCard(size: size, NewProduct: ProductList, index: index,);
            //               })),
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 30,
            )
          ],
        ),
      ),
      // bottomNavigationBar: BottomNavigationBar(
      //   items: const <BottomNavigationBarItem>[
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.home_outlined),
      //       label: "Home",
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.calendar_today_outlined),
      //       label: 'My Orders',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Visibility(
      //           visible: false,
      //           child: Icon(
      //             Icons.calendar_today_outlined,
      //             color: Colors.white,
      //           )),
      //       label: '',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.chat_outlined),
      //       label: 'Message',
      //     ),
      //     BottomNavigationBarItem(
      //       icon: Icon(Icons.person_outline_outlined),
      //       label: 'Profile',
      //     ),
      //   ],
      //   type: BottomNavigationBarType.fixed,
      //
      //   currentIndex: _selectedIndex,
      //   selectedItemColor: Colors.indigo,
      //   unselectedItemColor: Colors.black45,
      //   onTap: _onItemTapped,
      //   iconSize: 30,
      //   elevation: 20,
      // ),

      // floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      // floatingActionButton: FloatingActionButton(
      //   backgroundColor: Colors.white,
      //   onPressed: () {},
      //   child: const Icon(
      //     Icons.photo_camera,
      //     color: Colors.black45,
      //   ),
      // ),
    );
  }

  Future<void> getApiData() async {
    var response = await http.get(
      Uri.parse('https://caplet.pk/api/dashboard'),
    );
    Map<dynamic, dynamic> map = jsonDecode(response.body);
    Map<dynamic, dynamic> data = map["data"];
    List categoryJsonList = data["top_categories"];

    categoryList2 = (data["all_categories"] as List)
        .map((e) => CategoryModel.fromJson(e))
        .toList();
    SectionList =
        (data["sections"] as List).map((e) => Sections.fromJson(e)).toList();
    for (int i = 0; i < categoryJsonList.length; i++) {
      CategoryModel categoryModel = CategoryModel.fromJson(categoryJsonList[i]);
      categoryList.add(categoryModel);
    }

    setState(() {});
  }
}

class SectionView extends StatelessWidget {
  const SectionView({
    Key? key,
    required this.SectionList,
    required this.size,
    required this.index,
  }) : super(key: key);

  final List<Sections> SectionList;
  final Size size;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "${SectionList[index].name}",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              ),
              GestureDetector(
                onTap: () {
                  ViewAllfunction(context, SectionList[index].products!);
                },
                child: Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "View all",
                    style: TextStyle(color: Colors.black45, fontSize: 16),
                  ),
                ),
              ),
            ],
          ),
          Container(
              margin: EdgeInsets.only(top: 5),
              height: size.width * 0.55,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: SectionList[index].products!.length,
                  itemBuilder: (BuildContext context, int item) {
                    return ProductCard(
                      size: size,
                      NewProduct: SectionList[index].products!,
                      index: item,
                    );
                  })),
        ],
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  ProductCard({
    Key? key,
    required this.size,
    required this.NewProduct,
    required this.index,
  }) : super(key: key);

  final Size size;
  final List<ProductDetails> NewProduct;
  int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => ProductDetail(
                      productDetails: NewProduct[index],
                    )));
      },
      child: Container(
        margin: EdgeInsets.all(8),
        padding: EdgeInsets.all(20),
        width: size.width * 0.6,
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
              color: Colors.black26,
              blurRadius: 5.0,
              spreadRadius: 1.0,
              offset: Offset(1.0, 1.0), // shadow direction: bottom right
            )
          ],
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: double.infinity,
              height: size.width * 0.5 * 0.5,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: double.infinity,
                    width: size.width * 0.5 * 0.5,
                    child: FadeInImage.assetNetwork(
                        placeholder: "assets/images/catPlaceholder.png",
                        image:
                            "https://caplet.pk/admin/products/${NewProduct[index].image}"),
                  ),
                  Container(
                    height: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "10% 0ff",
                          style: TextStyle(color: Colors.green, fontSize: 16),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              "Rs.${NewProduct[index].price}",
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text("Rs.${NewProduct[index].discount}",
                                style: TextStyle(
                                  fontSize: 15,
                                ))
                          ],
                        ),
                        SizedBox(
                          height: 3,
                        )
                      ],
                    ),
                  )
                ],
              ),
            ),
            Text(
              "${NewProduct[index].title}",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text("${NewProduct[index].size}",
                style: TextStyle(
                  fontSize: 14,
                ))
          ],
        ),
      ),
    );
  }
}

class TopCategories extends StatelessWidget {
  const TopCategories({
    Key? key,
    this.bgcolor = Colors.white,
    required this.icon,
    this.text = "Categories",
  }) : super(key: key);

  final Color bgcolor;
  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      width: 100,
      child: Column(
        children: [
          Container(
            margin: EdgeInsets.all(10),
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              color: bgcolor,
              shape: BoxShape.circle,
            ),
            child: FadeInImage.assetNetwork(
                placeholder: "assets/images/catPlaceholder.png",
                image: "https://caplet.pk/$icon"),
            // child:Center(
            //   child: Image.network("https://caplet.pk/"+icon)
            // ),
          ),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            softWrap: false,
            style: TextStyle(fontSize: 10),
          )
        ],
      ),
    );
  }
}

void ViewAllfunction(context, List<ProductDetails> products) {
  Navigator.push(
      context,
      MaterialPageRoute(
          builder: (context) => ViewAllProduct(
                productDetails: products,
              )));
}
