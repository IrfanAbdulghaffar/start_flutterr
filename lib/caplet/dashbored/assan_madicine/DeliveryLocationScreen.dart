import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:start_flutterr/caplet/dashbored/assan_madicine/orderReview.dart';
import 'package:start_flutterr/wigate/custom_button.dart';

class confirmDeliveryLocaton extends StatefulWidget {
  confirmDeliveryLocaton({Key? key,
  required this.imageFile,
  }) : super(key: key);
  List<File> imageFile=[];
  @override
  State<confirmDeliveryLocaton> createState() => _confirmDeliveryLocatonState();
}
String address="Lahore";
late List<File> filelist;
class _confirmDeliveryLocatonState extends State<confirmDeliveryLocaton> {


  Completer<GoogleMapController> _controller = Completer();
  static final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(31.5204, 74.3587),
    zoom: 14.4746,
  );
  List<Marker> markers=[];
  var lat,long;
  bool bottomsheetstatus=false;
  @override
  void initState() {
    super.initState();
    setState((){
      filelist=widget.imageFile;
    });
  }
  Future<String> getAddressFromLatLng(context, double lat, double lng) async {
    String _host = 'https://maps.google.com/maps/api/geocode/json';
    if(lat != null && lng != null){
      var response = await http.get(Uri.parse('$_host?key=AIzaSyBh9tXWtaxIsAxanxbACVuOG1jl7fugR4s&language=en&latlng=31.4,74.28'));
      if(response.statusCode == 200) {
        Map data = jsonDecode(response.body);
        String _formattedAddress = data["results"][0]["formatted_address"];
        print("response ==== $_formattedAddress");
        return _formattedAddress;
      } else return 'No';
    } else return "null";
  }
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: this._scaffoldKey,
      appBar: AppBar(
        title: Text("Confirm Delvery Location"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          GoogleMap(
            onCameraMove: (loc){
              print("Anwner:$loc");
              lat=loc.target.latitude;
              long=loc.target.longitude;
            },
            onCameraIdle: () async {
              String _host = 'https://maps.google.com/maps/api/geocode/json';
              String Api = 'AIzaSyBh9tXWtaxIsAxanxbACVuOG1jl7fugR4s';
              var response = await http.get(Uri.parse('https://maps.google.com/maps/api/geocode/json?key=AIzaSyC43PysofOwkIvw1YEnC1LOwEUeDtnUjbo&language=en&latlng=$lat,$long'));
              Map data = jsonDecode(response.body);
              String _formattedAddress = data["results"][0]["formatted_address"];
              print("response ==== $_formattedAddress");
              setState((){
                address=_formattedAddress;
              });
            },
            mapType: MapType.normal,
            myLocationButtonEnabled: true,
            myLocationEnabled: true,
            mapToolbarEnabled: true,
            initialCameraPosition: _kGooglePlex,
            markers: Set.from(markers),
            onMapCreated: (GoogleMapController controller) {
              _controller.complete(controller);
            },
          ),
          Center(
            child: Icon(Icons.location_on_sharp,color: Colors.indigo,size: 40,)
          ),

          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: GestureDetector(
                  onTap: (){
                    setState((){
                      bottomsheetstatus=true;
                    });
                    modelBottomSheet();

                  },
                  child: CustomButton(size: MediaQuery.of(context).size,buttontext: 'CONTINUE',color: Colors.indigo,height: 55,width: 200,)),
            ),
          ),
          Visibility(
            visible:bottomsheetstatus,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: GestureDetector(
                  onTap: (){
                   modelBottomSheet();
                    // showModalBottomSheet(
                    //     context: context,
                    //     isScrollControlled: true,
                    //     shape: RoundedRectangleBorder(
                    //       borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                    //     ),
                    //     builder: (ctx)=> DraggableScrollableSheet(
                    //       expand: false,
                    //       builder: (context,scrollController){
                    //         return _buildBottomSheet(ctx);
                    //       },
                    //   ),
                    // );

                  },
                  child: Container(
                    height: 70,
                    padding: EdgeInsets.only(top: 20,left: 20,right: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                        borderRadius: BorderRadius.vertical(top: Radius.circular(30))
                    ),
                    child: const ListTile(title: Text('Additional Notes For Rider')),
                  ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color:Colors.indigo,
                  shape: BoxShape.rectangle,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 1,
                      blurRadius: 4,
                      offset: Offset(0, 3), // changes position of shadow
                    ),
                  ],
                ),
                child: Flexible(child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Center(
                    child: Text("$address",style: TextStyle(
                      color: Colors.white
                    ),

                    ),
                  ),
                )),
              ),
            ),
          )
        ],
      )
    );
  }

  void bottomsheet() {
    showModalBottomSheet(
      enableDrag: true,
      context: context,
      isScrollControlled: true,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
      ),
      builder: (ctx)=> DraggableScrollableSheet(
        initialChildSize: 0.5,
        maxChildSize: 0.6,
        minChildSize: 0.5,
        expand: false,
        builder: (context,scrollController){
          return _buildBottomSheet(ctx);
        },
      ),
    );
  }
  void modelBottomSheet() {
    this._scaffoldKey
        .currentState
        ?.showBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(30))
      ),
          (ctx) => DraggableScrollableSheet(
        initialChildSize: 0.54,
        maxChildSize: 0.54,
        expand: false,
        builder: (context,scrollController){
          return SingleChildScrollView(
              controller: scrollController,
              child: _buildBottomSheet(ctx));
        },
      ),
    );
  }
}
class additionalNotes{
  static String forrider='';
  static String forPharmacy='';
}

Container _buildBottomSheet(BuildContext context) {
  return Container(

    padding: const EdgeInsets.all(20.0),
    child: Column(
      children: [
        const ListTile(title: Text('Additional Notes For Rider')),
          TextField(
          controller: TextEditingController(text: additionalNotes.forrider),
          onChanged: (value){
            additionalNotes.forrider=value;
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Type here..',
          ),
        ),
        const ListTile(title: Text('Additional Notes For Pharmacy')),
        TextField(
          controller: TextEditingController(text: additionalNotes.forPharmacy),
          onChanged: (value){
            additionalNotes.forPharmacy=value;
          },
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Type here..',
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(30.0),
          child: GestureDetector(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>orderReview( address:address, imageFile: filelist,)));
              },
              child: CustomButton(size: MediaQuery.of(context).size, buttontext: "SAVE & CONTINUE",color: Colors.indigo,height: 60)),
        )
      ],
    ),
  );
}

