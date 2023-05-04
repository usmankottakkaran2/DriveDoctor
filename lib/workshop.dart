import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:test/service_view.dart';

class servicestaion extends StatefulWidget {
 String serviceselected;

 servicestaion({required this.serviceselected});

  @override
  State<servicestaion> createState() => _servicestaionState();
}

 final List<String> imagesrc = [
  "assets/servicing_cardimage.jpg",
  "assets/service3.jpg",
  "assets/oilservice.jpg",
];
final List<String> names = [
  " Nissan Service Center",
  " Maruti Suzuki Service Center ",
  " SV Motors ",
];
final List<String> locations = [
  " Calicut ",
  " Malappuram ",
  " Trivandrum ",
];
final List<String> phone = [
  " +91 1234567891 ",
  " +91 2468101214 ",
  " +91 2143658710 ",
];



final workshops=[{
  "name":"Nissan",
  "phone":"6217618271",
  "place":"Manjeri",
  "img":"assets/service3.jpg",
  "distance":"1.5km "
},{
  "name":"Toyota",
  "phone":"6217618271",
  "place":"Kottakkal",
  "img":"assets/oilservice.jpg",
  "distance":"1 km"
},{
  "img":"assets/servicing_cardimage.jpg"
},
{
  "img":"assets/wheel.jpg"
},{
  "img":"assets/engineservice.jpg"
}
];
// final List<String> services = [
//   " Wheel Service  ",
//   " Engine Service ",
//   " Oil Service ",
//   "Mirror Service",
//   "Gas Service",
//   "Brake Service"

// ];







class _servicestaionState extends State<servicestaion> {

 Future<String> loc(double lat, double long) async{
  Position? _currentUserPosition;
double? distanceInMeter;
double? distanceInKiloMeter;

 _currentUserPosition = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  distanceInMeter =  Geolocator.distanceBetween(_currentUserPosition.latitude, _currentUserPosition.longitude, lat, long);
distanceInKiloMeter = (distanceInMeter / 1000)*2.21;
return distanceInKiloMeter.toStringAsFixed(1);
 
}





 
 




  @override
 
  Widget build(BuildContext context) {



  return Scaffold(
    appBar:  AppBar(
      
        title: const Text('GoRide',
        ),
      ),
    body: Container(
      child: StreamBuilder(
        stream:  FirebaseFirestore.instance
      .collection("workshop")
      .where("services", arrayContains: widget.serviceselected)
      .snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (!snapshot.hasData) {
            return Center(child: CircularProgressIndicator());
          }

          return ListView.builder(
            itemCount: snapshot.data?.docs.length,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => serviceview(workshopname: snapshot.data!.docs[index]["name"]!)));
                },
                child: Expanded(
                  child: Card(
                    elevation: 10,
                   
                  
                    
                    child: Row(
                      children: [
                        SizedBox(
                          width: 100,
                          height: 150,
                          child: Image.asset(
                            workshops[index]["img"]!,
                            fit: BoxFit.cover,
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: Text(
                                snapshot.data!.docs[index]["name"]!,
                                style: TextStyle(
                    fontSize: 10.0,
                    color: Colors.black,
                  fontWeight: FontWeight.bold,
                  ),
                              ),
                            ),
                            Center(
                              child: Row(
                                children: [
                                  Text(
                                    snapshot.data!.docs[index]["place"]!,
                                     style: TextStyle(
                                  
                    fontSize: 10.0,
                    fontWeight: FontWeight.bold,
                   color: Colors.black,
                  
                    
                  ),
                                  ),
                                ],
                              ),
                            ),
                               GradientText("Available services", colors: [Color(0xFFF1000),Color(0xFF2508FF)],
                        style: TextStyle(fontSize: 5,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        ),
                
                             Container(
                              width: (MediaQuery.of(context).size.width - 30) / 4,
                              height: 50,
                              color: Colors.transparent,
                              child: Card(
                    color: Colors.grey[300],
                  shadowColor: Colors.black,
                  clipBehavior: Clip.hardEdge,
                               
                  elevation: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                        child: Column(
                          children: [
                            for (var service in snapshot.data!.docs[index]["services"])
                              Flexible(
                                child: Center(
                                  child: Text(
                                    service,
                
                                    style: TextStyle(
                                      fontSize: 10,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                              ),
                            ),
                //                           Container(
                //                             width: (MediaQuery.of(context).size.width - 30) / 2,
                //                             height: 70,
                //                             color: Colors.transparent,
                //                             child: Card(
                                
                //                               color: Colors.blue,
                //                               elevation: 0,
                //                               child: Row(
                //                                 crossAxisAlignment: CrossAxisAlignment.center,
                //                                 mainAxisAlignment: MainAxisAlignment.center,
                //                                 children: [
                //                                   SizedBox(
                //                                     width: 10,
                //                                   ),
                
                
                
                //                                   Center(
                //                                     child: Flexible(
                //                                       child: Text(
                
                
                                        
                // //   //                                       for (var i = 0; i < li.length; i++) {
                // //   // // TO DO
                // //   // var currentElement = li[i];
                // // }
                //                                         snapshot.data!.docs[index]["services"][0]!,
                //                                         // ser();,
                //                                         style: TextStyle(
                //                                           fontSize: 10,
                //                                           color: Colors.black,
                //                                           fontWeight: FontWeight.bold,
                //                                         ),
                //                                       ),
                //                                     ),
                //                                   ),
                //                                 ],
                //                               ),
                //                             ),
                //                           ),
                            SizedBox(
                              height: 10,
                            ),
                            GradientText("Service for", colors: [Color(0xFFF1000),Color(0xFF2508FF)],
                        style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),
                        textAlign: TextAlign.center,
                        ),
                             Container(
                              width: (MediaQuery.of(context).size.width - 30) / 4,
                              height: 20,
                              color: Colors.transparent,
                              child: Card(
                  color: Color.fromARGB(255, 189, 211, 230),
                  elevation: 0,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Center(
                        child: Column(
                          children: [
                            for (var service in snapshot.data!.docs[index]["vehicles"])
                              Flexible(
                                child: Center(
                                  child: Text(
                                    service,
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ],
                  ),
                              ),
                            ),
                            
                            // Container(
                            //   width: (MediaQuery.of(context).size.width - 30) / 2,
                            //   height: 70,
                            //   color: Colors.transparent,
                            //   child: Card(
                            //     color: Colors.blue,
                            //     elevation: 0,
                            //     child: Row(
                            //       crossAxisAlignment: CrossAxisAlignment.center,
                            //       mainAxisAlignment: MainAxisAlignment.center,
                            //       children: [
                            //         SizedBox(
                            //           width: 10,
                            //         ),
                            //         Center(
                            //           child: Flexible(
                            //             child: Text(
                            //               snapshot.data!.docs[index]["name"]!,
                            //               style: TextStyle(
                            //                 fontSize: 10,
                            //                 color: Colors.black,
                            //                 fontWeight: FontWeight.bold,
                            //               ),
                            //             ),
                            //           ),
                            //         ),
                            //       ],
                            //     ),
                            //   ),
                            // ),
                          ],
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
                  ),
                ),
              );
            },
          );
        },
      ),
    ),
  );
}

}