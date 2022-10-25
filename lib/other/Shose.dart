import 'package:flutter/material.dart';
import 'package:start_flutterr/wigate/dimens.dart';

class Shoes extends StatefulWidget {
  const Shoes({Key? key}) : super(key: key);
  @override
  State<Shoes> createState() => _ShoesState();
}

class _ShoesState extends State<Shoes> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 1: Business',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
    Text(
      'Index 2: School',
      style: optionStyle,
    ),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 220,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(bottomLeft: Radius.circular(dimens.corner.toDouble()),bottomRight:  Radius.circular(dimens.corner.toDouble())),
                       color: Colors.deepPurpleAccent
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 200),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(dimens.corner.toDouble()),topRight:  Radius.circular(dimens.corner.toDouble())),
                        color: Colors.black12
                    ),
                    child:Center(
                      child: _widgetOptions.elementAt(_selectedIndex),
                    ),
                  ),
                )
              ],
            )
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.home_outlined,
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.feed_outlined,),
              label: 'Feed',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_outlined),
              label: 'Cart',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.message_outlined),
              label: 'Message',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.person_outline_outlined),
              label: 'User',
            ),
          ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
        ),
    );
  }
}
// import 'package:flutter/material.dart';
//
// void main() => runApp(const MyApp());
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   static const String _title = 'Flutter Code Sample';
//
//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: _title,
//       home: MyStatefulWidget(),
//     );
//   }
// }
//
// class MyStatefulWidget extends StatefulWidget {
//   const MyStatefulWidget({Key? key}) : super(key: key);
//
//   @override
//   State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
// }
//
// class _MyStatefulWidgetState extends State<MyStatefulWidget> {
//   int _selectedIndex = 0;
//   static const TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Business',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: School',
//       style: optionStyle,
//     ),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('BottomNavigationBar Sample'),
//       ),
//       body: Center(
//         child: _widgetOptions.elementAt(_selectedIndex),
//       ),
//       bottomNavigationBar: BottomNavigationBar(
//         items: const <BottomNavigationBarItem>[
//           BottomNavigationBarItem(
//             icon: Icon(Icons.home),
//             label: 'Home',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.business),
//             label: 'Business',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.school),
//             label: 'School',
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         selectedItemColor: Colors.amber[800],
//         onTap: _onItemTapped,
//       ),
//     );
//   }
// }
