import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test/home_service.dart';
import 'package:test/register.dart';
import 'package:test/rent.dart';
import 'package:test/select.dart';
import 'package:test/service.dart';
import 'package:test/service_home.dart';
import 'package:test/service_view.dart';
import 'package:test/view_service.dart';
import 'package:test/workshop.dart';

class LoginUI extends StatefulWidget {
  const LoginUI({super.key});

  @override
  State<LoginUI> createState() => _LoginUIState();
}

class _LoginUIState extends State<LoginUI> {



GlobalKey<FormState> formkey = GlobalKey<FormState>();
final TextEditingController emailEditingController = new TextEditingController();
final TextEditingController passwordEditingController = new TextEditingController();
final _auth = FirebaseAuth.instance;
CollectionReference users = FirebaseFirestore.instance.collection('users');



 void route() {
    User? user = FirebaseAuth.instance.currentUser;
    print(user?.uid);
    var nav = FirebaseFirestore.instance
            .collection('users')
            .doc(user!.email)
            .get()
            .then((DocumentSnapshot documentSnapshot) {

      if (documentSnapshot.exists) {
        if (documentSnapshot.get('usertype') == "mech") {
           Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  home_service(),
          ),
        );
        }else{
          Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>  service(),
          ),
        );
        }
      } else {
        print('Document does not exist on the database');
      }
    });
  }

void signin(String email,String password) async{

  if(formkey.currentState!.validate()){
    await _auth.signInWithEmailAndPassword(email: email, password: password).then((uid) => {
             route()

    }).catchError((e){

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(e!.message),
    ));
    });

    

  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height*0.35,
                  child: Center(
                    child: Text('Sign In',
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
                  controller: emailEditingController,
                   onSaved: (value){
                      emailEditingController.text = value!;
                  },
                  validator: (value) {
                   
                      if(value!.isEmpty){
                    return "Please Enter Email";
                  }else if(!RegExp(r'\S+@\S+\.\S+').hasMatch(value))
                    {
                      return "Please Enter a Valid Email";
                    }
                  return null;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Username',
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
                  controller: passwordEditingController,
                  onSaved: (value){
                    passwordEditingController.text = value!;
                  },
                  validator: (pass) {
                   
                      if(pass!.isEmpty){
                    return "Please Enter Password";
                  }else if(pass.length < 8 || pass.length > 15)

                    {
                      return "Password Length is incorrect";
                    }
                  return null;
                  },
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
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: (){},
                      child: Text('Forget Password',
                      style: TextStyle(
                        color: Colors.grey.withOpacity(0.7),
                        fontSize: 15,
                        fontWeight: FontWeight.w500
                      ),),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
        
              ), 
              GestureDetector(
                onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>servicehome()));},
                child: Container(
                  width: MediaQuery.of(context).size.width*0.80,
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
                    child: ElevatedButton(

                      
        
                      onPressed: () { 
                        signin(emailEditingController.text, passwordEditingController.text);
                       },
                      child: Center(child:Text('Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w400,
                        letterSpacing: 1.2,
                      ),),
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
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      GestureDetector(
                        onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Register()));},
                        child: Text('New User? Register',
                        style: TextStyle(
                          color: Colors.grey.withOpacity(0.7),
                          fontSize: 15,
                          fontWeight: FontWeight.w500
                        ),),
                      )
                    ],
                  ),
                ),
              
            ],
          ),
        ),
      ),
    );
  }
}






