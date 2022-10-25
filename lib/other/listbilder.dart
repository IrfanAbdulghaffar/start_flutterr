import 'package:flutter/material.dart';
import 'package:start_flutterr/TaskOne/TaskCart.dart';
class ListBild extends StatefulWidget {
  const ListBild({Key? key}) : super(key: key);

  @override
  State<ListBild> createState() => _ListBildState();
}

class _ListBildState extends State<ListBild> {
  List<String?> list = ["1","2","3","4","5","6"];
  @override
  Widget build(BuildContext context) {
    Size size=MediaQuery.of(context).size;
    return Scaffold(
      body: ListView.builder(
        itemCount: list.length,
        itemBuilder: (BuildContext context,int index){
          return Cart(size: size, text: list[index],);
        },
      ),
    );
  }
}

class Cart extends StatelessWidget {
  var text;

  Cart({
    Key? key,
    required this.size,
    required this.text
  }) : super(key: key);

  final Size size;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: size.width,
      color: Colors.black,
      child: Center(
        child: Text(
          "$text",
          style: TextStyle(
            color: Colors.white,
            fontSize: 40
          ),
        ),
      ),
    );
  }
}
