import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseintro/home_page.dart';
import 'package:firebaseintro/signup_page.dart';
import 'package:flutter/material.dart';


class Login_Page extends StatefulWidget {
  const Login_Page({super.key});

  @override
  State<Login_Page> createState() => _Login_PageState();
}

class _Login_PageState extends State<Login_Page> {

  TextEditingController emailctrl = TextEditingController();
  TextEditingController pswdctrl = TextEditingController();


  //sigin ...................................


  void _formSignin() async{
    try{
      final UserCredential  credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: email,
          password: password
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) =>  Home_Page()),
      );


    }on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }
  String email = "";
  String password = "";



  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body:Center(
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value){
                    email=value;
                  },
                  controller: emailctrl ,
                  decoration: InputDecoration(
                    hintText: "enter email",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0)
                    )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value){
                    password=value;
                  },
                  controller: pswdctrl,
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "enter password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      )
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                  height: 45,
                  width: 350,
                  child: ElevatedButton(onPressed: () {

                    _formSignin();


                  },

                      style: ElevatedButton.styleFrom(
                        primary: Colors.black
                      ),

                      child:Text("Login",style: TextStyle(color: Colors.white),))),

              SizedBox(
                height: 10,
              ),
              TextButton(onPressed: () {

                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Signup_page()),
                );

              }, child: Text("Signup?")),
            ],
          ),
        ),
      ),
    );
  }
}
