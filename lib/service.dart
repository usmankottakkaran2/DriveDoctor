import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:test/view_service.dart';
import 'package:test/workshop.dart';

class service extends StatefulWidget {
  const service({super.key});

  @override
  State<service> createState() => _serviceState();
}

final List<String> imagesrc = [
  "assets/servicing_cardimage.jpg",
  "assets/service3.jpg",
  "assets/oilservice.jpg",
];
final List<String> offers = [
  " ON CAR SERVICES ",
  " ON ENGINE SERVICES ",
  " ON OIL SERVICES ",
];
final List<String> offersvalue = [
  " 40% OFF ",
  " 10% OFF ",
  " 50% OFF ",
];
final List<String> offercodes = [
  " Code: ABC123 ",
  " Code: DEF456 ",
  " Code: GHI789 ",
];
final List<String> servicesleft = [
  "assets/wheel.jpg",
  "assets/caroil.jpg",
  "assets/mirrorservice.jpg",
];
final List<String> servicesright = [
  "assets/engineservice.jpg",
  "assets/gasservice.jpg",
  "assets/brakeservice.jpg",
];
final List<String> servicesnameleft = [
  "Wheel",
  "Oil",
  "Mirror",
];
final List<String> servicesnameright = [
  "Engine",
  "Gas",
  "Brake",
];
int imagesrcindex = 0;

class _serviceState extends State<service> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: GradientText("Our Services", colors: [Color(0xFFF1000),Color(0xFF2508FF)],
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        ),
         

      ),
      body: Padding(padding: EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        children: [Container(
          child: Column(
            children: [Container(
              height: 2.5,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF2508FF),Color(0xFFFF1000)]
              )
              ),
            ),
            SizedBox(height: 10,),
            Row(
              children: [GradientText("How can we help you?", colors: [Color(0xFFF1000),Color(0xFF2508FF)],
        style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
        textAlign: TextAlign.center,
        ),],
            ),
            SizedBox(height: 10,),
            Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height * 0.057,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      color: Colors.blueGrey[100],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: 15,
                            ),
                            Text(
                              "Search",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ),
                          ],
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.057,
                          width: (MediaQuery.of(context).size.width - 80) / 5,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Colors.orange,
                          ),
                          child: Center(
                            child: Icon(
                              Icons.search,
                              size: 23,
                              color: Colors.white,
                              )
                              ),
                
              )
            ]
            ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height*0.25,
              
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index) {
      return SizedBox(height: 3);
   },
                scrollDirection: Axis.horizontal,
                itemCount:imagesrc.length,
              itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.transparent
                  ),
                              width: MediaQuery.of(context).size.width - 40,
                              
                              child: Image.asset(
                                        imagesrc[index],
                                        fit: BoxFit.fill,
                                        width: double.infinity,
                                      
                                      ),
                            );

              })
              ),
              SizedBox(
                height: 20,
              ),
              
              GradientText("All Services", colors: [Color(0xFFF1000),Color(0xFF2508FF)],
        style: TextStyle(fontSize: 15,fontWeight: FontWeight.normal),
        textAlign: TextAlign.center,
        ),
        Container(
              height: 2.5,
              decoration: BoxDecoration(gradient: LinearGradient(colors: [Color(0xFF2508FF),Color(0xFFFF1000)]
              )
              ),
            ),
            SizedBox(
              height: 10,
            )
            


            ],

            
          ),




        ),
        SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height/2.8,
            child: Expanded(child: ListView.builder(
              itemCount: servicesnameleft.length,
              itemBuilder: (context,index){
                return Row(
                  children: [
                    Container(
                      width:(MediaQuery.of(context).size.width-25) / 2,
                      height: 100,
                      color: Colors.transparent,
                      child: Card(
                        elevation: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Container(
                                child: GestureDetector(
                                   onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>view_service(serviceselected: servicesnameleft[index])));},
                                  child: Image.asset(servicesleft[index],
                                  fit: BoxFit.fill,
                                  width: 50,
                                  height: 50,
                                                
                                  ),
                                )                              
                                ),
                            ),
                            SizedBox(
                              width: 10,
                              
                            ),
                            Flexible(child: Text(
                              servicesnameleft[index],style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ))
                          ],
                        ),
                
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      width:(MediaQuery.of(context).size.width-25) / 2,
                      height: 100,
                      color: Colors.transparent,
                      child: Card(
                        elevation: 0,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ClipOval(
                              child: Container(
                                child: GestureDetector(
                                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>view_service(serviceselected:  servicesnameright[index])));},

                                  child: Image.asset(servicesright[index],
                                  fit: BoxFit.fill,
                                  width: 50,
                                  height: 50,
                                                
                                  ),
                                )                              
                                ),
                            ),
                            SizedBox(
                              width: 10,
                              
                            ),
                            Flexible(child: Text(
                              servicesnameright[index],style: TextStyle(
                                fontSize: 20,
                                color: Colors.black,
                                fontWeight: FontWeight.bold
                              ),
                            ))
                          ],
                        ),
                
                      ),
                    ),
                  ],
                );
              }
            )),
          ),
        )
        ],
      ),
      ),
    );
  }
}