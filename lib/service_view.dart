import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'book.dart';

class serviceview extends StatefulWidget {
  String workshopname;

 serviceview({required this.workshopname});

  @override
  State<serviceview> createState() => _serviceviewState();
}



final List<String> names = [
  " Nissan Service Center",
  " Maruti Suzuki Service Center ",
  " SV Motors ",
];

final Map<String, dynamic> center={
  "name":"Nissan Service Centre",
  "phone":"6217618271",
  "place":"Manjeri",
  "img":"assets/oilservice.jpg",
  "descrip":"Automobile service station means an establishment where vehicle fuels, lubricants and accessories are offered for retail sale and which contains facilities for the repair and maintenance of vehicles excluding body and fender work.",
  "service":["Oil Service","Engine Service","Wheel Service","Brake Service"]
};



class _serviceviewState extends State<serviceview> {

  String name =  "";
  String place = "";
  String phone = "";
  String descrip="";
  List<String> servicess = [];

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
      body: Column(
        children: [
          SizedBox(
            height: 35,
          ),
          Container(
            width: MediaQuery.of(context).size.width * 10,
            height: 200,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(center["img"]),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            
            decoration: BoxDecoration(
                gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 90, 15, 133),
                  Color.fromARGB(255, 196, 192, 232),
                ],
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(25),
                bottomRight: Radius.circular(25),
                
              )
            ),
            width: MediaQuery.of(context).size.width * 10,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                Text(
                  name,
                   style: TextStyle(color: Colors.white,
                   fontWeight: FontWeight.bold
                   ,fontSize: 25.0),
                
                ),
                SizedBox(height: 8),
                Text(place
                , style: TextStyle(color: Colors.white,
                   fontWeight: FontWeight.bold
                   ,fontSize: 15.0)),
                SizedBox(
                  height: 8,
                ),
                Text(phone,
                 style: TextStyle(color: Colors.white,
                   fontWeight: FontWeight.bold
                   ,fontSize: 15.0)),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 90, 15, 133),
                Color.fromARGB(255, 196, 192, 232),
              ],
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(25),
              bottomRight: Radius.circular(25),
              topLeft: Radius.circular(25),
              topRight:  Radius.circular(25),
              
            )
          ),
              height: 200,
              
                child: ListView.builder(
                  itemCount: servicess.length,
                  
                  itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
               
                children: <Widget>[
                  
                                      Flexible(
                                        child: Text(
                                          servicess[index],
                                          
                                          style: TextStyle(
                                            color: Colors.white,
                   fontWeight: FontWeight.bold
                   ,fontSize: 15.0
                                            
                                          ),
                                        ),
                                      ),
                 
                ],
              ),
            );

                  },
                ),
            ),
          

          Container(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Container(
                width: MediaQuery.of(context).size.width * 25,
                height: (MediaQuery.of(context).size.height)/3-80,
              padding: EdgeInsets.all(16.0),
              child: Text(
                descrip,
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            ),
          )
,
          
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [SizedBox(height: 5,),
                Container(
                  width: MediaQuery.of(context).size.width*0.40,
                    height: MediaQuery.of(context).size.width*0.10,
                  child: ElevatedButton(
                          onPressed: () { FlutterPhoneDirectCaller.callNumber(phone); },
                          
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
    );
  }
}
