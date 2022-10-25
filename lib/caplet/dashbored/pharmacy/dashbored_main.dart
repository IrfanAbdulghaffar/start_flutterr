import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:start_flutterr/caplet/dashbored/pharmacy/screens/Order.dart';
import 'package:start_flutterr/caplet/dashbored/pharmacy/screens/home/Pharmacy.dart';
import '../../../Learning App/Account.dart';
import '../../../Learning App/Home.dart';
import '../../../Learning App/MyClasses.dart';
class dashbored_main extends StatefulWidget {
  const dashbored_main({Key? key}) : super(key: key);

  @override
  State<dashbored_main> createState() => _dashbored_mainState();
}

class _dashbored_mainState extends State<dashbored_main> {
  int _selectedIndex = 0;
  final List<Widget> _widgetOptions = <Widget>[
    const Pharmacy(),
    Order(),
    const Home(),
    const MyClasses(),
    const AccountScreen(),
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: ImageIcon(AssetImage("assets/images/navigation_bar_icon/home.png")),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'My Orders',
          ),
          BottomNavigationBarItem(
            icon: Visibility(
                visible: false,
                child: Icon(
                  Icons.calendar_today_outlined,
                  color: Colors.white,
                )),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_outlined),
            label: 'Message',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_outlined),
            label: 'Profile',
          ),
        ],

        currentIndex: _selectedIndex,
        selectedItemColor: Colors.indigo,
        unselectedItemColor: Colors.black45,
        onTap: _onItemTapped,
        iconSize: 30,
        elevation: 20,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white,
        onPressed: () {},
        child: const Icon(
          Icons.photo_camera,
          color: Colors.black45,
        ),
      ),
    );
  }
}
