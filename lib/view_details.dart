import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test/shop_info.dart';

class view_details extends StatefulWidget {
  const view_details({super.key});

  @override
  State<view_details> createState() => _view_detailsState();
}

class _view_detailsState extends State<view_details> {

 User? user = FirebaseAuth.instance.currentUser;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child:Column(
          children: [
            Container(
                    height: 500,
                    child:StreamBuilder(
                       stream:  FirebaseFirestore.instance
      .collection("workshop")
      .where("workshopid", isEqualTo: user!.email )
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
    );
  }
}