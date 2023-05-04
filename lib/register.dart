import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:test/register_screen.dart';
import 'package:test/workshop_register.dart';

import 'loginscreen.dart';
import 'owner_register.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

final _list = ['User',  'Workshop'];

String valueState = "user";

class _RegisterState extends State<Register> {
  final _formkey = GlobalKey<FormState>();
  final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  final nameEditingController = new TextEditingController();
  final phoneEditingController = new TextEditingController();
  final emailEditingController = new TextEditingController();
  final passwordEditingController = new TextEditingController();
  final confirmEditingController = new TextEditingController();
  final _auth = FirebaseAuth.instance;
  User? currentUser = FirebaseAuth.instance.currentUser;

  void signup(String email, String password) async {
    if (_formkey.currentState!.validate()) {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((value) => {postDetailsTofirestore()})
          .catchError((e) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e!.message),
        ));
      });
    }
  }

  postDetailsTofirestore() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(12),
                height: MediaQuery.of(context).size.height * 0.35,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: Text(
                    'Sign Up',
                    style: TextStyle(
                        fontSize: 40,
                        color: Colors.blue.withOpacity(0.4),
                        fontWeight: FontWeight.w600),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                child: Center(
                  child: DropdownButtonFormField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                    ),
                    hint: Text("Select the type of user"),
                    onChanged: (value) {
                      setState(() {
                        print(value);

                        if (value == 'User') {
                          valueState = "user";
                        } else {
                          if (value == "Owner") {
                            valueState = "rent";
                          } else {
                            if (value == "Workshop") {
                              valueState = "mech";
                            }
                          }
                          //           switch (valueState) {
                          //   case 'user':
                          //     Navigator.push(context,
                          //         MaterialPageRoute(builder: (context) => Register()));
                          //     break;
                          //   case 'mech':
                          //     Navigator.push(context,
                          //         MaterialPageRoute(builder: (context) => Workshop()));
                          //     break;
                          //   case 'rent':
                          //     Navigator.push(context,
                          //         MaterialPageRoute(builder: (context) => Owner()));
                          //     break;
                          //   default:
                          //     break;
                          // }
                        }
                      });
                    },
                    items: _list.map((e) {
                      return DropdownMenuItem(value: e, child: Text(e));
                    }).toList(),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: nameEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    nameEditingController.text = value!;
                  },
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Name',
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
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: phoneEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Name";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    phoneEditingController.text = value!;
                  },
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
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: emailEditingController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email";
                    } else if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                      return "Please Enter a Valid Email";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    emailEditingController.text = value!;
                  },
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
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: passwordEditingController,
                  validator: (pass) {
                    if (pass!.isEmpty) {
                      return "Please Enter Password";
                    } else if (pass.length < 8 || pass.length > 15) {
                      return "Password Length is incorrect";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    passwordEditingController.text = value!;
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
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: TextFormField(
                  controller: confirmEditingController,
                  validator: (value) {
                    if (confirmEditingController.text.length > 6 &&
                        passwordEditingController.text != value) {
                      return "Password dont match";
                    }
                    return null;
                  },
                  onSaved: (value) {
                    confirmEditingController.text = value!;
                  },
                  obscureText: true,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                  decoration: InputDecoration(
                    hintText: 'Confirm Password',
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
                width: MediaQuery.of(context).size.width * 0.8,
                padding: EdgeInsets.symmetric(horizontal: 8),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => LoginUI()));
                      },
                      child: Text(
                        'Already a user? Sign in',
                        style: TextStyle(
                            color: Colors.grey.withOpacity(0.7),
                            fontSize: 15,
                            fontWeight: FontWeight.w500),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) => LoginUI()));
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.3,
                  height: MediaQuery.of(context).size.width * 0.10,
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [Color(0xff00b4db), Color(0xff045de9)],
                      begin: Alignment.centerLeft,
                    ),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: ElevatedButton(
                    onPressed: () async{
                      var username = nameEditingController.text.trim();
                      var phone = phoneEditingController.text.trim();
                      var useremail = emailEditingController.text.trim();
                      var userpassword = passwordEditingController.text.trim();

                      FirebaseAuth.instance
                          .createUserWithEmailAndPassword(
                              email: useremail, password: userpassword)
                          .then((value) => {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("User Created")),
                                ),
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text("Data added")),
                                ),
                              });

                     await FirebaseFirestore.instance
                          .collection("users")
                          .doc(useremail)
                          .set({
                        'username': username,
                        'phone': phone,
                        'email': useremail,
                        'usertype': valueState,
                        'userid': currentUser!.uid,
                      });
                      Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => LoginUI()));


                      
                    },
                    child: Center(
                      child: Text(
                        'Register',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 1.2,
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
