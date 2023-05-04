import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

import 'loginscreen.dart';

class Workshop extends StatefulWidget {
  const Workshop({super.key});

  @override
  State<Workshop> createState() => _WorkshopState();
}

class _WorkshopState extends State<Workshop> {
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
                child: Text('Workshop Sign Up',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.blue.withOpacity(0.4),
                  fontWeight: FontWeight.w600

                ),
                ),
              ),
            ), 
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Workshop Name',
                  hintStyle: TextStyle(
                    color: Colors.grey,
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
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Phone',
                  hintStyle: TextStyle(
                    color: Colors.grey,
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
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Email',
                  hintStyle: TextStyle(
                    color: Colors.grey,
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
                obscureText: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Password',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),


            ),
            SizedBox(
              height: 15,

            ), 
            Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                obscureText: false,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Latitude',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),


            ),
            SizedBox(
              height: 15,

            ), 

            Container(
              width: MediaQuery.of(context).size.width*0.8,
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: TextFormField(
                obscureText: false,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
                decoration: InputDecoration(
                  hintText: 'Longitude',
                  hintStyle: TextStyle(
                    color: Colors.grey,
                    fontSize: 16,
                  ),
                ),
              ),


            ),
            
            SizedBox(
              height: 20,

            ),
            GestureDetector(
              onTap: (){Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => LoginUI()));},
              child: Container(
                width: MediaQuery.of(context).size.width*0.3,
                height: MediaQuery.of(context).size.width*0.10,
                padding: EdgeInsets.symmetric(
                  vertical:5,
                  horizontal: 12 ),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff00b4db),
                      Color(0xff045de9)],
                      begin: Alignment.centerLeft,
                      ),
                      borderRadius: BorderRadius.all(Radius.circular(20),),
                  ),
                  child: Center(child:Text('Register',
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w400,
                    letterSpacing: 1.2,
                  ),),
                  ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
  