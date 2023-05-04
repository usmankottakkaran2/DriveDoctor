import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';



class RentPage extends StatefulWidget {
  const RentPage({super.key});

  @override
  State<RentPage> createState() => _RentPageState();
}

class _RentPageState extends State<RentPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GoRide'),

        leading: Icon(Icons.account_circle_rounded),
        
        // backgroundColor: Colors.transparent,
        // elevation: 0,
        // title: ListTile(
        //   trailing: Icon(Icons.clear_all,
        //   color: Colors.black,),
        // ),
      ),
      body: Padding(
        padding:EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
           GradientText(
    'Explore',
    style: TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.bold
    ),
    colors: [
        Colors.blue,
        Colors.red,
        Colors.teal,
    ],
),
SizedBox(
  height: 5,
),
Container(
  height: 2.5,decoration: BoxDecoration(gradient: LinearGradient(colors:[ Colors.blue,
        Colors.red,
        Colors.teal]),),
),
SizedBox(
  height: 5,
),
Container(
  color: Colors.transparent,
  height: 175,
  width: double.infinity,
  child: ListView(scrollDirection: Axis.horizontal,
  children: [
    Container(decoration: BoxDecoration(gradient: LinearGradient(begin:Alignment.topRight,
    end:Alignment.bottomLeft,
    colors: [Colors.blue,Colors.pink]),
    borderRadius: BorderRadius.circular(10),

    ),
    height: 175,
    width: 125,
    child: Card(color: Colors.transparent,
    elevation: 0,
    child: Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
           
              Text("BMW",
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold
              ),
              ),
              Image.asset("assets/bmw.jpg",
              fit:BoxFit.contain, height: 40, width: 50,),
          ],
        ),
        

      
      Image.asset("assets/bmw_car.jpg",
              fit:BoxFit.contain, height: 75,
                                width: 155,),


      Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Text(
                                    "All Series",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "\$35",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: <Widget>[
                                  Text(
                                    "per day",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 10,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
      ],
    ),
    ),
    ),
    SizedBox(
                    width: 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: <Color>[Color.fromARGB(255, 255, 224, 178), Colors.orange]),
                        borderRadius: new BorderRadius.circular(10)),
                    height: 175,
                    width: 125,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Jaguar",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                "assets/jaguar_logo.png",
                                fit: BoxFit.contain,
                                height: 40,
                                width: 50,
                                // width: double.infinity,
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/jaguar.png",
                            fit: BoxFit.contain,
                            height: 75,
                            width: 155,
                            // width: double.infinity,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "All Series",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$20",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "per day",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Container(
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            begin: Alignment.topRight,
                            end: Alignment.bottomLeft,
                            colors: <Color>[Color.fromARGB(255, 200, 230, 201), Colors.green]),
                        borderRadius: new BorderRadius.circular(10)),
                    height: 175,
                    width: 125,
                    child: Card(
                      color: Colors.transparent,
                      elevation: 0,
                      child: Column(
                        children: <Widget>[
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "Audi",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold),
                              ),
                              Image.asset(
                                "assets/audi_logo.gif",
                                fit: BoxFit.contain,
                                height: 40,
                                width: 50,
                                // width: double.infinity,
                              ),
                            ],
                          ),
                          Image.asset(
                            "assets/audi.png",
                            fit: BoxFit.contain,
                            height: 75,
                            width: 155,
                            // width: double.infinity,
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                "All Series",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                "\$28",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: <Widget>[
                              Text(
                                "per day",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                    fontWeight: FontWeight.normal),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
  ],
  ),
)
          ],
        ),
        )
    );
  }
}