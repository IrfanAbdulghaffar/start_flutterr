import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:start_flutterr/caplet/dashbored/assan_madicine/DeliveryLocationScreen.dart';
import 'package:start_flutterr/caplet/other/customWidget.dart';
import 'package:start_flutterr/wigate/custom_button.dart';

class UplodePriscription extends StatefulWidget {
  const UplodePriscription({Key? key}) : super(key: key);

  @override
  State<UplodePriscription> createState() => _UplodePriscriptionState();
}

class _UplodePriscriptionState extends State<UplodePriscription> {
   List<File> imageFile=[];
  final _picker = ImagePicker();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Upload Prisctiption"),
        centerTitle: true,
        backgroundColor: Colors.indigo,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GestureDetector(
                onTap: (){
                  setState((){

                  });
                },
                child: Text(
                  "How pharmacy Works?",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Stack(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 60,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                            (size.width * 0.07).toInt(),
                                (index) => Container(
                              margin: EdgeInsets.symmetric(horizontal: 2),
                              height: 2,
                              width: 7,
                              color: Colors.black26,
                            )),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              circle(
                                radias: 65,
                                child:  Image.asset("assets/images/doc_icon.png"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "STEP 1",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Uploaded\n Prescription",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              circle(
                                radias: 65,
                                child: Image.asset("assets/images/pack_icon.png"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "STEP 2",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Pharmacist packs\nthe Medicines",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              circle(
                                radias: 65,
                                child: Image.asset("assets/images/delivery_icon.png"),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Text(
                                "STEP 3",
                                style: TextStyle(
                                  color: Colors.indigo,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                "Uploaded\n Prescription",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 10,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Text(
                "Valid Prescription Gide",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w500,
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 2),
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                    ),
                  ),
                  Text(
                    "  Don't Crop out any part of the image",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 2),
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                    ),
                  ),
                  Text(
                    "  Avoid blurred image",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 2),
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                    ),
                  ),
                  Flexible(
                    child: Text(
                      "  Inclutde details of doctor and dpatient + clinic visit date",
                      style: TextStyle(fontSize: 13, color: Colors.black54),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Transform.translate(
                    offset: const Offset(0, 2),
                    child: Icon(
                      Icons.fiber_manual_record,
                      size: 10,
                    ),
                  ),
                  Text(
                    "  Medicines will be dispensed as per prescripton",
                    style: TextStyle(fontSize: 13, color: Colors.black54),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              if (imageFile.isEmpty)
                Container(
                  margin: EdgeInsets.all(10),
                  height: 200,
                  child: Center(
                    child: Image.asset("assets/images/doc_icon_.png"),
                  ),
                )
              else
                Container(
                  height: 200,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: imageFile.length+1,
                      itemBuilder: (context,index){
                        return index!=imageFile.length?Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Stack(
                            children: [
                              rectangle(height: 150,child:  Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.file(imageFile[index],),
                              )),
                            ],
                          ),
                        ):GestureDetector(
                          onTap: () {
                            Dialog errorDialog = Dialog(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(12.0)),
                              //this right here
                              child: Container(
                                height: 300.0,
                                width: 300.0,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children:[
                                    const Icon(Icons.file_upload_outlined,size: 30,),
                                    const Padding(
                                      padding: EdgeInsets.all(15.0),
                                      child: Text(
                                        'How Do You Want To Upload Prescriptons?',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontWeight: FontWeight.w400,
                                            fontSize: 18
                                        ),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      children: [
                                        GestureDetector(
                                          onTap:(){
                                            _pickImageFromCamera();
                                          },
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    rectangle(
                                                      height: 65,
                                                    ),
                                                    Image.asset("assets/images/camera_2x.png")
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "Camera",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        GestureDetector(
                                          onTap:() async => _pickImageFromGallery(),
                                          child: Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.center,
                                              children: [
                                                Stack(
                                                  alignment: Alignment.center,
                                                  children: [
                                                    rectangle(
                                                      height: 65,
                                                    ),
                                                    Image.asset("assets/images/gallery_2x.png")
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "Gallery",
                                                  style: TextStyle(
                                                    fontSize: 16,
                                                    fontWeight: FontWeight.w500,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),


                                  ],
                                ),
                              ),
                            );
                            showDialog(
                                context: context,
                                builder: (BuildContext context) => errorDialog);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Stack(
                              children: [
                                rectangle(height: 150,child: Container(),),
                                Container(
                                    padding: EdgeInsets.all(10),
                                    height: 150,
                                    width: 150,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.add_circle_outline,size: 35,color: Colors.indigo,),
                                        Text("Add Image",style: TextStyle(
                                            color: Colors.indigo,
                                            fontSize: 16
                                        ),)
                                      ],
                                    )

                                )

                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              SizedBox(
                height: 20,
              ),
              Align(
                  alignment: Alignment.center,
                  child: imageFile.isEmpty?GestureDetector(
                      onTap: () {
                        Dialog errorDialog = Dialog(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12.0)),
                          //this right here
                          child: Container(
                            height: 300.0,
                            width: 300.0,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children:[
                                const Icon(Icons.file_upload_outlined,size: 30,),
                                const Padding(
                                  padding: EdgeInsets.all(15.0),
                                  child: Text(
                                    'How Do You Want To Upload Prescriptons?',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 18
                                    ),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    GestureDetector(
                                      onTap:(){
                                        _pickImageFromCamera();
                                      },
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            rectangle(
                                              height: 65,
                                              child: Image.asset("assets/images/camera_2x.png"),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Camera",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    GestureDetector(
                                      onTap:() async => _pickImageFromGallery(),
                                      child: Padding(
                                        padding: const EdgeInsets.all(5.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          children: [
                                            rectangle(
                                              height: 65,
                                              child:  Image.asset("assets/images/gallery_2x.png"),
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Text(
                                              "Gallery",
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),


                              ],
                            ),
                          ),
                        );
                        showDialog(
                            context: context,
                            builder: (BuildContext context) => errorDialog);
                      },
                      child: CustomButton(
                        size: size,
                        buttontext: "UPLOAD PRESCRIPTION",
                        color: Colors.indigo,
                        height: 48,
                      )):GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>confirmDeliveryLocaton(imageFile: imageFile)));
                      },
                      child: CustomButton(size: size, buttontext: "SUBMIT",color: Colors.indigo,height: 55,))
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _pickImageFromGallery() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => imageFile.add(File(pickedFile.path)));
      Navigator.pop(context);
    }
  }

  Future<void> _pickImageFromCamera() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      setState(() => this.imageFile.add(File(pickedFile.path)));
      Navigator.pop(context);
    }
  }

}



