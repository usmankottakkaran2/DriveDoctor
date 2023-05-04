import 'package:carousel_slider/carousel_slider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:test/service_view.dart';
import 'package:test/shop_info.dart';

class view_service extends StatefulWidget {
  String serviceselected;

 view_service({required this.serviceselected});





  @override
  State<view_service> createState() => _view_serviceState();
}
final List<String> services =["OIL","WHEEL","BRAKE","ENGINE","GAS","MIRROR"];


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


// Widget getServiceIcon(String serviceType) {
//   switch (serviceType) {
//     case "Oil Service":
//       return Icon(Icons.local_gas_station);
//     case "Engine Service":
//       return Icon(Icons.build);
//     case "Brake Service":
//       return Icon(Icons.settings_ethernet);
//     case "Mirror Service":
//       return Icon(Icons.remove_red_eye);
//     case "Gas Service":
//       return Icon(Icons.ev_station);
//     case "Wheel Service":
//       return Icon(Icons.directions_car);
//     default:
//       return SizedBox(); // Return an empty SizedBox if the service type is not recognized
//   }
// }




class _view_serviceState extends State<view_service> {

  Future<String> loc(double lat, double long) async{
  Position? _currentUserPosition;
double? distanceInMeter;
double? distanceInKiloMeter;

 _currentUserPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  distanceInMeter =  Geolocator.distanceBetween(_currentUserPosition.latitude, _currentUserPosition.longitude, lat, long);
distanceInKiloMeter = (distanceInMeter / 1000)*1.41;
return distanceInKiloMeter.toStringAsFixed(1);
 
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              
              Center(
                child: CarouselSlider(items: [ClipRRect(
                  borderRadius: BorderRadius.circular(7),child: Image.asset(servicesimg[0],fit:BoxFit.contain),
                  
                ),ClipRRect(
                  borderRadius: BorderRadius.circular(7),child: Image.asset(servicesimg[1],fit:BoxFit.contain),
                  
                ),ClipRRect(
                  borderRadius: BorderRadius.circular(7),child: Image.asset(servicesimg[2],fit:BoxFit.contain),
                  
                ),ClipRRect(
                  borderRadius: BorderRadius.circular(7),child: Image.asset(servicesimg[3],fit:BoxFit.contain),
                  
                ),],
                 options: CarouselOptions(
                  aspectRatio: 1,
                  reverse: true,
                  autoPlay: true,
                  viewportFraction: 0.7,
                  enlargeCenterPage: true,
                  autoPlayInterval: Duration(seconds: 2),
                  
                 )
                 
                 )
                 ,
              ),
              Column(
                children: [
                  Padding(
                    padding:EdgeInsets.only(right: 250), 
                    child: Text("Cars",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w500,
                    color: Colors.black
                  ),
                    ),
                  
                  ),
                ],
              ),
             
              Container(
                height: 500,
                child:StreamBuilder(
                   stream:  FirebaseFirestore.instance
      .collection("workshop")
      .where("services", arrayContainsAny: [widget.serviceselected])
      .snapshots(),
                  builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) { 
                      if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }
         






           return ListView.builder(
                    
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: 
                  (context, index) {
           
           
                
                     
                     
                    return GestureDetector(
                       onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => shop_info(workshopname: snapshot.data!.docs[index]["name"]!)));
                },
                      child: Column(
                      children: [
                        Expanded(
                          child: Container(
                            height: 500,
                            width: 200,
                            margin: EdgeInsets.symmetric(horizontal: 15,vertical: 20),
                            decoration: BoxDecoration(
                                 color: Color(0xFFF2F8FF),
                                 borderRadius: BorderRadius.circular(15),
                                 boxShadow: [
                                  BoxShadow(
                                    color: Colors.white54,
                                    blurRadius: 4,
                                    spreadRadius: 2
                                  )
                                 ]
                            
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Stack(
                                  children: [
                                    InkWell(
                                      onTap: (){},
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(15),
                                          topRight: Radius.circular(15),
                                        ),
                                        child: Image.asset(servicesimg[0]
                                        ,height: 125,
                                        width: 200,fit: BoxFit.cover ,),
                                        
                                      ),
                                    ),
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Container(
                                        margin: EdgeInsets.all(8),
                                        height: 45,
                                        width: 45,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFF2F8FF),
                                          shape: BoxShape.circle,
                                          boxShadow: [
                                        BoxShadow(
                                                      color: Colors.white54,
                                                       blurRadius: 4,
                                                            spreadRadius: 2
                                                    )
                                    
                                          ]
                                        ),
                                        child: Center(
                                          child: Icon(
                                            Icons.favorite_outline,
                                            color: Colors.blueAccent,
                                            size: 28,
                                            
                                          ),
                                        ),
                                      ),
                                    
                                    )
                                  ],
                                ),SizedBox(
                                  height: 5,
                                  
                                ),
                                Padding(padding: EdgeInsets.symmetric(horizontal: 5),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [Text(
                                      snapshot.data!.docs[index]["name"]!,
                                    style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue,
                                    ),
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
                                
                          //         RatingBar.builder(
                          //  initialRating: 3,
                          //  itemSize: 25,
                           
                          //  minRating: 1,
                          //  direction: Axis.horizontal,
                          //  allowHalfRating: true,
                          //  itemCount: 5,
                          //  itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                          //  itemBuilder: (context, _) => Icon(
                          //    Icons.star,
                          //    color: Colors.amber,
                          //  ),
                          //  onRatingUpdate: (rating) {
                          //    print(rating);
                          //  },
                          // ),
                                  Row(
                                    children: [
                                      Icon(Icons.location_city),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                       snapshot.data!.docs[index]["place"]!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 16, 17, 17),
                                    ),
                                  ),
                                  
                                  
                                              
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      Icon(Icons.phone),
                                       SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                      snapshot.data!.docs[index]["phone"]!,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 16, 17, 17),
                                    ),
                                  ),
                                  
                                              
                                    ],
                                  ),
                                  SizedBox(
                                    height: 5,
                                  ),
                          
                                  Text(
                                     "Services",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                    ),
                                  ),
                                     for (var ser in snapshot.data!.docs[index]["services"])
                                  
                               Row(
                                    children: [
                                    //   getServiceIcon(ser),
                                    //  SizedBox(
                                    //     width: 5,
                                    //   ),
                                      Text(
                                     ser,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 16, 17, 17),
                                    ),
                                  ),
                          
                          
                          
                                  
                                              
                                    ],
                                  ),
                                  SizedBox(
                                      height: 5,
                                  ),
                                  Text(
                                     "For",
                                    style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.blue,
                                    ),
                                  ),
                          
                          
                                    for (var ver in snapshot.data!.docs[index]["vehicles"])
                                  
                               Row(
                                    children: [
                                     getVehicleIcon(ver),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                     ver,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Color.fromARGB(255, 16, 17, 17),
                                    ),
                                  ),
                                  
                                              
                                    ],
                                  ),
                                  SizedBox(
                                      height: 10,
                                  ),
                                  FutureBuilder<String>(
                          future: loc(
                            snapshot.data!.docs[index]["location"][0],
                            snapshot.data!.docs[index]["location"][1],
                          ),
                          builder: (BuildContext context, AsyncSnapshot<String> locSnapshot) {
                            if (locSnapshot.connectionState == ConnectionState.done) {
                              return Row(
                                children: [
                                  Icon(Icons.location_on, size: 10.0),
                                  SizedBox(width: 4.0),
                                  Text(
                                     locSnapshot.data! + "" + "\nKM Away",
                                    style: TextStyle(
                                      fontSize: 5.0,
                                    ),
                                  ),                                      
                                ],
                              );
                            } else {
                              return CircularProgressIndicator();
                            }
                          },
                        ),
                                  
                                
                                 
                                   ],
                                ),
                                )
                              ],
                            ),
                          
                            
                                    
                          ),
                        ),
                        
                      ],
                      ),
                    );
                              
                  }
                  );
                   },
                 
                ),
              
              ),
           
             
              
          
        
            ],
          ),
        ),
      ),
    );
  }
}