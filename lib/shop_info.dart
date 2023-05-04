import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';

import 'book.dart';
import 'booking.dart';

class shop_info extends StatefulWidget {


  String workshopname;
  shop_info({required this.workshopname});

  @override
  State<shop_info> createState() => _shop_infoState();
}



final List<String> servicesimg = [
  "assets/engineservice.jpg",
  "assets/caroil.jpg",
  "assets/mirrorservice.jpg",
  "assets/gasservice.jpg",
];
Widget getVehicleIcon(String vehicleType) {
  switch (vehicleType) {
    case "Cars":
      return Icon(Icons.directions_car);
    case "Bikes":
      return Icon(Icons.directions_bike);
    default:
      return SizedBox(); // Return an empty SizedBox if the vehicle type is not recognized
  }
}

class _shop_infoState extends State<shop_info> {

String name =  "";
  String place = "";
  String phone = "";
  String descrip="";
  List<String> servicess = [];
  List<String> vehicles=[];



  @override
  void initState() {
    super.initState();
    _getWorkshopDetails(widget.workshopname);
  }

  void _getWorkshopDetails(String workshopName) async {
    var docSnapshot = await FirebaseFirestore.instance
        .collection('workshop')
        .doc(workshopName)
        .get();
    if (docSnapshot.exists) {
      setState(() {
        name=docSnapshot["name"];
        place=docSnapshot["place"];
        phone=docSnapshot["phone"];
        descrip= docSnapshot["descrip"];
        servicess = List<String>.from(docSnapshot["services"]);
        vehicles = List<String>.from(docSnapshot["vehicles"]);
        // String name = docSnapshot["name"]?.toString() ?? "";

        //  String place = docSnapshot["place"]?.toString() ?? "";
        //    String phone = docSnapshot["phone"]?.toString() ?? "";

      });
    } else {
      print('Document does not exist on the database');
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(
                image: DecorationImage(image:  AssetImage( "assets/engineservice.jpg",),
                
                fit:BoxFit.cover,
                 ),
               borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20),
               )
              ),
            
            ),
            SizedBox(
              height: 10,
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(name,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.w500,
                  color:Colors.blueAccent
                ) ,),
                SizedBox(
                  height: 5,
                ),
                 Row(
                                    children: [
                                      Icon(Icons.star,
                                      color: Colors.amber,),
                                      SizedBox(width: 5,),
                                      Text("4.9",style: TextStyle(
                                        fontSize: 16,
                                        color:Colors.black
                                      ),)
                                    ],
                                  ),
                Row(
                                    children: [
                                      Icon(Icons.phone),
                                       SizedBox(
                                        width: 5,
                                      ),
                                      Text(phone,
                                      // snapshot.data!.docs[index]["phone"]!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 16, 17, 17),
                                    ),
                                  ),
                                  
                                              
                                    ],
                                  ),
                                    Row(
                                    children: [
                                      Icon(Icons.location_city),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(place,
                                      //  snapshot.data!.docs[index]["place"]!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 16, 17, 17),
                                    ),
                                  ),
                                  
                                  
                                              
                                    ],
                                  ),
                                  SizedBox(
                                    height: 15,
                                  ),
                                 Row(
                                 
  children: [
    Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Services",
            style: TextStyle(
              fontSize: 18,
              color: Colors.blue,
            ),
          ),
          for (var ser in servicess)
            Text(
              ser,
              style: TextStyle(
                fontSize: 15,
                color: Color.fromARGB(255, 16, 17, 17),
              ),
            ),
        ],
      ),
    ),
     
    Expanded(
      child: Column(
       
        children: [
          Text(
                "For",
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.blue,
                ),
              ),
          
        Column(
  children: vehicles.map((ver) => 
    Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(width: 70),
        getVehicleIcon(ver),
        SizedBox(width: 5),
        Text(
          ver,
          style: TextStyle(
            fontSize: 15,
            color: Color.fromARGB(255, 16, 17, 17),
          ),
        ),
      ],
    ),
  ).toList(),
)

        ],
      ),
    ),
  ],
),

                          
                          
                              //       for (var ver in vehicles)
                                  
                              //  Row(
                              //       children: [
                              //        getVehicleIcon(ver),
                              //         SizedBox(
                              //           width: 5,
                              //         ),
                              //         Text(
                              //        ver,
                              //       style: TextStyle(
                              //         fontSize: 15,
                              //         color: Color.fromARGB(255, 16, 17, 17),
                              //       ),
                              //     ),
                                  
                                              
                              //       ],
                              //     ),
                                  Text(
                                    descrip,
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Colors.black.withOpacity(0.6)
                                    ),
                                    textAlign: TextAlign.justify,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(Icons.location_on, size: 25.0),
                                    SizedBox(width: 5.0),
                                    Text(
                                       "10"+ " " + "KM Away",
                                      style: TextStyle(
                                        fontSize: 15,
                                      ),
                                    ),                                      
                                  ],
                                ),
                                  Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [SizedBox(height: 5,),
                Container(
                  width: MediaQuery.of(context).size.width*0.40,
                    height: MediaQuery.of(context).size.width*0.10,
                  child: ElevatedButton(
                          onPressed: () {  FlutterPhoneDirectCaller.callNumber(phone);},
                          
                          child: Text('Call',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),),
                        ),
                ),
                     
                  Container(
                  width: MediaQuery.of(context).size.width*0.40,
                    height: MediaQuery.of(context).size.width*0.10,
                  child: ElevatedButton(
                          onPressed: () { Navigator.of(context).push(MaterialPageRoute(builder: (context)=>book())); },
                          
                          child: Text('Book',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 1.2,
                          ),),
                        ),
                ),SizedBox(
                  height: 5,
                )
                ],
              ),
              ],
            ),
            
            )
          ],
        ),
      ),



    );
  }
}