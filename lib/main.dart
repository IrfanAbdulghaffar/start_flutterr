import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:start_flutterr/caplet/Dashbored/Dashbored.dart';
import 'package:start_flutterr/caplet/registration/SignUpScreen.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:start_flutterr/caplet/other/shared_preferences.dart';


main()async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreference.instance.init();
 // bool Status=SharedPreference.instance.getData("Name")==null?true:false;
  runApp(MyApp());
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
    statusBarBrightness: Brightness.dark,
  ));
}


class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);
  // List<String> entries = ['A', 'B', 'C'];
  // List<int> colorCodes = [600, 500, 100];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          primarySwatch: Colors.indigo
      ),
      home: SharedPreference.instance.getData("Name")!=null?Dashbored():SignUpScreen(),
    );
  }
}

class MapSample extends StatefulWidget {
  @override
  State<MapSample> createState() => MapSampleState();
}

class MapSampleState extends State<MapSample> {
  Completer<GoogleMapController> _controller = Completer();

  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.5204, 74.3587),
    zoom: 14.4746,
  );
  late Marker _origin;
  late Marker _destination;
  List<Marker> markers=[];
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414
  );

  @override
  void initState() {
    super.initState();
    BitmapDescriptor.fromAssetImage(ImageConfiguration(), 'assets/images/a.png').then((icon){
      setState((){
        markers.add(Marker(markerId: MarkerId('destination'),
          infoWindow: InfoWindow(title: 'Destination'),
          icon: icon,
          position: LatLng(31.5204, 74.3587),
        ));
        markers.add(Marker(markerId: MarkerId('orintino'),
          infoWindow: InfoWindow(title: 'onition'),
          icon: icon,
          position: LatLng(32.1877, 74.1945),
        ));
      });
    },
    );

  }
  static final Polyline _kpolylne=Polyline(polylineId: PolylineId('_kpolyline'),
  points: [
    LatLng(31.5204, 74.3587),
    LatLng(31.1877, 74.1922),
    LatLng(32.1877, 74.1945),
  ]
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GoogleMap(
        myLocationEnabled: true,
        polylines: {
          _kpolylne
        },
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        markers: Set.from(markers),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
      ),
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: Text('To the lake!'),
      //   icon: Icon(Icons.directions_boat),
      // ),
    );
  }
}











// class Lastscreen extends StatelessWidget {
//   // const Lastscreen({Key? key}) : super(key: key);
//
//   final List<String> dataList=[
//     "Title 1",
//     "Title 2",
//     "Title 3",
//     "Title 4",
//     "Title 5",
//   ];
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         primarySwatch: Colors.red,
//       ),
//       home: Scaffold(
//         appBar: AppBar(),
//         body:Container(
//           height: 600,
//           margin: const EdgeInsets.symmetric(vertical: 0.0),
//           child: ListView.builder(
//             padding: EdgeInsets.zero,
//             itemCount: dataList.length,
//             itemBuilder: (context,index){
//               return OrderListCard(title: dataList[index],);}
//             // This next line does the trick.
//
//           ),
//         ),
//         ),
//     );
//   }
// }


// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: "Home",
//       theme: ThemeData(
//         primarySwatch: Colors.blue
//       ),
//       home: MyHomePage(),
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key}) : super(key: key);
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   Widget custombutton(String i,{void Function()? onPressed,int flex = 1,double? height}){
//     return Expanded(
//       flex: flex,
//         child:Padding(
//           padding: const EdgeInsets.all(2.0),
//           child: MaterialButton(
//             color: Colors.blue,
//             padding: EdgeInsets.all(25.0),
//             onPressed: onPressed??(){},
//             child: Text('$i',
//             style: const TextStyle(
//                 fontSize:20,
//                 fontWeight:FontWeight.bold,
//               color: Colors.white
//             ),
//             ),
//     ),
//         )
//     );
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//
//         body:
//         Container(
//           decoration: const BoxDecoration(
//             image: DecorationImage(
//               image: AssetImage("assets/images/sign_in_bg.png"),
//               fit: BoxFit.cover,
//             ),
//           ),
//           child: Row(
//             children: [
//               Column(
//                 // mainAxisSize: MainAxisSize.min,
//                 children: [
//                   custombutton("/"),
//                   custombutton("*"),
//                   custombutton("+"),
//                   custombutton("+"),
//                 ],
//               ),
//               Column(
//                 mainAxisSize: MainAxisSize.min,
//                 children: [
//                   custombutton("/"),
//                   custombutton("*"),
//                   custombutton("+",flex: 2),
//                 ],
//               )
//             ],
//           ),
//         ),
//
//       ),
//     );
//   }
// }



// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "Edit text",
//       theme: ThemeData(
//         primarySwatch: Colors.blue
//       ),
//       home: Scaffold(
//         resizeToAvoidBottomInset: false,
//         appBar: AppBar(
//           title: Text("Edit Text"),
//         ),
//         body: Column(
//           children: [
//             Padding(
//               padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 30.0),
//               child:TextField(
//                 maxLength: 30,
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 16.0
//                 ),
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.person),
//                   border: OutlineInputBorder(),
//                   hintText: "User Name"
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 10.0),
//               child:TextField(
//                 maxLength: 30,
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 16.0
//                 ),
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.email),
//                   border: OutlineInputBorder(),
//                   hintText: "Email"
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 10.0),
//               child:TextField(
//
//                 maxLength: 30,
//                 style: const TextStyle(
//                   color: Colors.blue,
//                   fontSize: 16.0,
//                 ),
//                 decoration: InputDecoration(
//
//                   prefixIcon: Padding(
//                       padding:EdgeInsets.all(8),
//                       child: Image.asset('assets/images/callcode.png',width: 100.0)
//                   ),
//                   // prefixIconConstraints: BoxConstraints.tight(MediaQuery.of(context).size),
//                   suffixIcon: const Icon(Icons.call),
//                   border: const OutlineInputBorder(),
//                   hintText: "Phone",
//                 ),
//               ),
//             ),
//             Padding(
//               padding: EdgeInsets.only(left: 20.0,right: 25.0,top: 10.0),
//               child:TextField(
//                 maxLength: 30,
//                 style: TextStyle(
//                   color: Colors.blue,
//                   fontSize: 16.0
//                 ),
//                 decoration: InputDecoration(
//                   prefixIcon: Icon(Icons.lock),
//                   border: OutlineInputBorder(),
//                   hintText: "Password"
//                 ),
//               ),
//             ),
//
//
//           ],
//         ),
//       ),
//     );
//   }
// }


// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   void change(){
//     setState((){
//       count++;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: "first",
//       theme: ThemeData(
//         primarySwatch: Colors.deepOrange
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text("Counter"),
//         ),
//         body:
//             Center(
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('$count'),
//                   ElevatedButton(
//
//                       onPressed: change,
//                       child: Text(
//                         "Click",
//                         style: TextStyle(
//                           color: Colors.white,
//                         ),
//                       ),
//
//
//                   )
//                 ],
//               ),
//             )
//
//       ),
//     );
//   }
// }