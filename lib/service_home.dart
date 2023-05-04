import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:test/add_service.dart';

class servicehome extends StatefulWidget {
  const servicehome({super.key});

  @override
  State<servicehome> createState() => _servicehomeState();
}

class _servicehomeState extends State<servicehome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("")),
      body: 
      Container(child: GridView(padding: const EdgeInsets.all(10),children: [
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20),color:Color.fromARGB(255, 99, 86, 94),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [GestureDetector(
        onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addservice()));
                      },child: Icon(Icons.add,size: 50,color:Color.fromARGB(255, 196, 168, 187),)),
        GradientText("Add Details", colors: [Color(0xFFF1000),Color(0xFF2508FF)],
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal),
        textAlign: TextAlign.center,
        ),],),),
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(124, 117, 146, 188),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.view_agenda_rounded,size: 50,color:Color.fromARGB(255, 4, 4, 4),),
        GradientText("View Details", colors: [Color.fromARGB(15, 5, 5, 5),Color.fromARGB(255, 4, 4, 4)],
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal),
        textAlign: TextAlign.center,
        ),],),),
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 160, 239, 232),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [Icon(Icons.home,size: 50,color:Color.fromARGB(255, 196, 168, 187),),
      Center(child:   GradientText("View Details", colors: [Color(0xFFF1000),Color(0xFF2508FF)],
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal),
        textAlign: TextAlign.center,
        ),)],),),
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Color.fromARGB(255, 160, 239, 232),),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [GestureDetector(

           onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => addservice()));
           },
          
          child: Icon(Icons.view_list_rounded,size: 50,color:Color.fromARGB(255, 196, 168, 187),)),
      Center(child:   GradientText("View Requests", colors: [Color.fromARGB(15, 23, 32, 73),Color.fromARGB(255, 31, 105, 155)],
        style: TextStyle(fontSize: 25,fontWeight: FontWeight.normal),
        textAlign: TextAlign.center,
        ),)],
      ),
      ),
      
      
      ],
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,childAspectRatio: .75)),),
    );
  }
}