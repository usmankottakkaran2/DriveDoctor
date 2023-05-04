import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test/view_details.dart';

import 'add_service.dart';

class home_service extends StatefulWidget {
  const home_service({super.key});

  @override
  State<home_service> createState() => _home_serviceState();
}



final List<String> servicesimg = [
  "assets/engineservice.jpg",
  "assets/caroil.jpg",
  "assets/mirrorservice.jpg",
  "assets/gasservice.jpg",
];

class _home_serviceState extends State<home_service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
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
              Row(
                children: [SizedBox(
                  width: 20,
                ),
                  Column(
                    children: [
                      SizedBox( 
  width: 150,
  height: 150,
  child: FittedBox( 
    child: FloatingActionButton( 
      backgroundColor: Colors.transparent,
      onPressed: () {
         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addservice()));
      },
      child: Icon(
        Icons.add,
        size: 35,
        color: Colors.black,
      ),
    ),
  ),
),
                    SizedBox(
      height: 10,
    ),
    Text(
                              "Add Details",style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
    )],
                  ),
SizedBox(
  width: 20,
),

Column(
  children: [
        SizedBox( 
    
      width: 150,
    
      height: 150,
    
      child: FittedBox( 
    
        child: FloatingActionButton( 
    
          backgroundColor: Colors.transparent,
    
          onPressed: () {Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => view_details()));},
    
          child: Icon(
    
            Icons.home,
    
            size: 35,
    
            color: Colors.black,
    
          ),
    
        ),
    
      ),
    
    ),
    SizedBox(
      height: 10,
    ),
    Text(
                              "View Details",style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
    )
  ],
),
                ],
              ),
              SizedBox(
                height: 20,
              ),
                Row(
                children: [SizedBox(
                  width: 20,
                ),
                  Column(
                    children: [
                      SizedBox( 
  width: 150,
  height: 150,
  child: FittedBox( 
    child: FloatingActionButton( 
      backgroundColor: Colors.transparent,
      onPressed: () {},
      child: Icon(
       Icons.home,
        size: 35,
        color: Colors.black,
      ),
    ),
  ),
),
                     SizedBox(
      height: 10,
    ),
    Text(
                              "View Details",style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
    )],
                  ),
SizedBox(
  width: 20,
),

Column(
  children: [
        SizedBox( 
    
      width: 150,
    
      height: 150,
    
      child: FittedBox( 
    
        child: FloatingActionButton( 
    
          backgroundColor: Colors.transparent,
    
          onPressed: () {},
    
          child: Icon(
    
           Icons.view_list_rounded,
    
            size: 35,
    
            color: Colors.black,
    
          ),
    
        ),
    
      ),
    
    ),
  SizedBox(
      height: 10,
    ),
    Text(
                              "View Requests",style: TextStyle(
                                fontSize: 25,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
    )],
),
                ],
              ),
            ]
      ),
    )
      )
    );


    
  }
}