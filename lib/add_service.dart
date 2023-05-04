

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
// import 'package:flutter_geocoder/geocoder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geolocator/geolocator.dart';
import 'package:multi_select_flutter/dialog/multi_select_dialog_field.dart';
import 'package:multi_select_flutter/util/multi_select_item.dart';
import 'package:multiselect/multiselect.dart';
import 'package:test/home_service.dart';
import 'package:test/service.dart';
import 'package:test/service_home.dart';
import 'package:flutter_custom_selector/flutter_custom_selector.dart';
// import 'package:geocoder2/geocoder2.dart';




class Service {
  final int id;
  final String name;

  Service({
    required this.id,
    required this.name,
  });
}



class Vehicle{
  final int id;
  final String name;

  Vehicle({
    required this.id,
    required this.name,
  });
}

class addservice extends StatefulWidget {
  const addservice({super.key});

  @override
  State<addservice> createState() => _addserviceState();
}

class _addserviceState extends State<addservice> {


 


   Position? _position = null;

  Future<Position?> fetchCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // serviceEnabled = await Geolocator.isLocationServiceEnabled();
    // if (!serviceEnabled) {
    //   Fluttertoast.showToast(msg: "Location service is disabled");
    //   return null;
    // }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Fluttertoast.showToast(msg: "You denied the permission");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Fluttertoast.showToast(msg: "You denied the permission forever");
      return null;
    }

    Position currentPosition =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    return currentPosition;
  }

  void _fetchPosition() async {
    Position? position = await fetchCurrentLocation();
    setState(() {
      _position = position!;
    });
  }

  static List<Service> services = [
    Service(id: 1, name: 'Oil'),
    Service(id: 2, name: "Engine"),
    Service(id: 3, name: "Mirror"),
    Service(id: 4, name: "Wheel"),
    Service(id: 5, name: "Brake"),
    Service(id: 6, name: "Gas"),
      
   
  ];



  static List<Vehicle> vehicles = [
    Vehicle(id: 1, name: 'Cars'),
    Vehicle(id: 2, name: "Bikes"),
   
   
  ];


 void _onServiceSelectionComplete(value) {
  print(value.runtimeType);
  print(selectedDataString.runtimeType);
  selectedDataString=[];
  value.forEach((element) => selectedDataString!.add(element));
  print(selectedDataString);
 

  }




  void _onVehicleSelectionComplete(value) {
  print(value.runtimeType);
  print(selectedDataStringvehicle.runtimeType);
  selectedDataStringvehicle=[];
  value.forEach((element) => selectedDataStringvehicle!.add(element));
  print(selectedDataStringvehicle);
 

  }



  List<String> dataStringVehicle = [
    "Cars",
    "Bikes",
  ];

  List<String> dataString = [
    "Wheel",
    "Mirror",
    "Engine",
    "Oil",
    "Gas",
    "Brake"
    
  ];
  String? selectedString;
  List<String>? selectedDataString;


  String? selectedStringvehicle;
  List<String>? selectedDataStringvehicle;



List<String> service = ['Oil', 'Engine', 'Mirror', 'Wheel'];
List<String> selectedservice = [];
List<String> selectedvehicle = [];
 final _items = services
      .map((service) => MultiSelectItem<Service>(service, service.name))
      .toList();
final _vehicleitems = vehicles
      .map((vehicle) => MultiSelectItem<Vehicle>(vehicle, vehicle.name))
      .toList();
 final nameEditingController = new TextEditingController();
 final phoneEditingController = new TextEditingController();
 final placeEditingController = new TextEditingController();
final addressEditingController = new TextEditingController();
final descripEditingController = new TextEditingController();

User? currentUser = FirebaseAuth.instance.currentUser;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
       body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(12),
              height: MediaQuery.of(context).size.height*0.35,
              width:MediaQuery.of(context).size.width,
              child: Center(
                child: Text('Add Details',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue.withOpacity(1),
                  fontWeight: FontWeight.w600

                ),
                ),
              ),
            ), 
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                controller: nameEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nameEditingController.text = value!;
                  },
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Name',
                  
                  hintStyle: TextStyle(
                    color:Color.fromARGB(255, 14, 14, 14).withOpacity(1),
                    fontSize: 16,
                  ),
                ),
              ),


            ),
            SizedBox(
              height: 20,

            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                controller: phoneEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Phone Number";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneEditingController.text = value!;
                  },
                 
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: TextStyle(
                    color: Color.fromARGB(255, 14, 14, 14).withOpacity(1),
                    fontSize: 16,
                  ),
                ),
              ),


            ),
            SizedBox(
              height: 20,
            ),
              Container(
               width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
               child: CustomMultiSelectField<String>(
                title: "Select the vehicles",
              //   onSelectionDone: (value) {
              // //   selectedString = value;
              // //   setState(() {});
              // // },
                items: dataStringVehicle,
                enableAllOptionSelect: true,
                onSelectionDone: _onVehicleSelectionComplete,

                itemAsString: (item) => item.toString(),
                
              ), 
              // MultiSelectDialogField(
                
              //     items: _vehicleitems,
              //     title: Text("Vehicles"),
              //     selectedColor: Color.fromARGB(255, 20, 21, 21),
              //     decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 16, 16, 16).withOpacity(0.1),
              //       borderRadius: BorderRadius.all(Radius.circular(40)),
              //       border: Border.all(
              //         color: Color.fromARGB(255, 16, 17, 17),
              //         width: 2,
              //       ),
              //     ),
              //     buttonIcon: Icon(
              //       Icons.add,
              //       color: Color.fromARGB(255, 15, 15, 15),
              //     ),
              //     buttonText: Text(
              //       "Select vehicles",
              //       style: TextStyle(
              //         color: Color.fromARGB(255, 9, 9, 9),
              //         fontSize: 16,
              //       ),
              //     ),
              //     onConfirm: (results) {
              //       selectedvehicle = results.cast<String>();
              //       print(selectedvehicle);
              //     },
              //   ),
             ),
            SizedBox(
              height: 20,

            ),

             Container(
               width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),

               child: CustomMultiSelectField<String>(
                title: "Add the services available",
              //   onSelectionDone: (value) {
              // //   selectedString = value;
              // //   setState(() {});
              // // },
                items: dataString,
                enableAllOptionSelect: true,
                onSelectionDone: _onServiceSelectionComplete,

                itemAsString: (item) => item.toString(),
                
              ),
              //  child: MultiSelectDialogField(
                
              //     items: _items,
              //     title: Text("Services"),
              //     selectedColor: Color.fromARGB(255, 20, 21, 21),
              //     decoration: BoxDecoration(
              //       color: Color.fromARGB(255, 16, 16, 16).withOpacity(0.1),
              //       borderRadius: BorderRadius.all(Radius.circular(40)),
              //       border: Border.all(
              //         color: Color.fromARGB(255, 16, 17, 17),
              //         width: 2,
              //       ),
              //     ),
              //     buttonIcon: Icon(
              //       Icons.add,
              //       color: Color.fromARGB(255, 15, 15, 15),
              //     ),
              //     buttonText: Text(
              //       "Add available services",
              //       style: TextStyle(
              //         color: Color.fromARGB(255, 9, 9, 9),
              //         fontSize: 16,
              //       ),
              //     ),
              //     onConfirm: (results) {
              //       selectedservice = results.cast<String>();
              //     },
              //   ),
             ),
            
            SizedBox(
              height: 20,

            ), 
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Container(
                     width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
                  child: Text( 'Latitude: ${_position?.latitude}, Longitude: ${_position?.longitude}',
                  style:TextStyle(fontSize: 16) ,),
                ),
                ElevatedButton(onPressed: (){
                 _fetchPosition();
                }, child: Text("Add current location"))
                ],
              ),
            ),

             SizedBox(
              height: 20,

            ), 



            

            Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                controller: placeEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Place";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    placeEditingController.text = value!;
                  },
                obscureText: false,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Place',
                  hintStyle: TextStyle(
                    color:Color.fromARGB(255, 14, 14, 14).withOpacity(1),
                    fontSize: 16,
                  ),
                ),
              ),


            ),
            
            SizedBox(
              height: 20,

            ),
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                controller: addressEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Address";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    addressEditingController.text = value!;
                  },
                
                obscureText: false,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Address',
                  hintStyle: TextStyle(
                    color:Color.fromARGB(255, 14, 14, 14).withOpacity(1),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
              Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                controller: descripEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Description";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    descripEditingController.text = value!;
                  },
                
                obscureText: false,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Description',
                  hintStyle: TextStyle(
                    color:Color.fromARGB(255, 14, 14, 14).withOpacity(1),
                    fontSize: 16,
                  ),
                ),
              ),
            ),
           
                  Container(
                    child: Center(child:ElevatedButton(
                      onPressed: () async{

                      var name = nameEditingController.text.trim();
                      var phone = phoneEditingController.text.trim();
                      var place = placeEditingController.text.trim();
                      var address = addressEditingController.text.trim();
                       var descrip = descripEditingController.text.trim();

                        await FirebaseFirestore.instance
                          .collection("workshop")
                          .doc(name)
                          .set({
                        'name': name,
                        'phone': phone,
                        'place': place,
                        'address': address,
                        'workshopid': currentUser!.email,
                        'vehicles': selectedDataStringvehicle,
                        'services': selectedDataString,
                        'location':[_position!.latitude,_position!.longitude],
                        "descrip":descrip
                      });
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => home_service()));

                        },
                      child: Text('Add',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.2,
                      ),),
                    ),
                    ),
                  ),
              
            
          ],
        ),
      ),
    );
  }
}