import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebaseintro/login_page.dart';
import 'package:flutter/material.dart';

class Signup_page extends StatefulWidget {
  const Signup_page({super.key});

  @override
  State<Signup_page> createState() => _Signup_pageState();
}

class _Signup_pageState extends State<Signup_page> {

  TextEditingController namectrl = TextEditingController();
  TextEditingController emailctrl = TextEditingController();
  TextEditingController pswdctrl = TextEditingController();
  TextEditingController locationctrl = TextEditingController();

  final FirebaseFirestore _firestore = FirebaseFirestore.instance;


  // add data to firebase.............................
  
  void _addFirestore()async{
    try{
      await _firestore.collection('user').add({
        'name':namectrl.text,
        'email':emailctrl.text,
        'location':locationctrl.text,
        'password': pswdctrl.text

      }
      );
    }catch(e){
      print("error adding to firestore: $e");
    }
  }

  //submit function

 void Submitform()async{
  _addFirestore();
   VerifyForm();
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const Login_Page()),
  );

  }

  // verification email and password

  void VerifyForm() async{

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Login_Page()),
      );



    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
      //  print('The account already exists for that email.');
        showDialog(
            context: context,
            builder: (BuildContext context)=>
                AlertDialog(
                  title: Text("warning"),
                  content: Text("The account already exists for that email"),
                  actions: [
                    TextButton(onPressed: () {
                      Navigator.of(context).pop();
                    }, child: Text("ok"))
                  ],
                )
                );

      }
    } catch (e) {
      print(e);
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
                  controller: namectrl,
                  decoration: InputDecoration(
                      hintText: "enter name",
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
                    email=value;
                  },
                  controller: emailctrl,
                  decoration: InputDecoration(
                      hintText: "enter mailid",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10.0)
                      )
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  controller: locationctrl,
                  decoration: InputDecoration(
                      hintText: "enter location",
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
                      hintText: "create password",
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

                  Submitform();

                  },

                      style: ElevatedButton.styleFrom(
                          primary: Colors.black
                      ),

                      child:Text("Register",style: TextStyle(color: Colors.white),))),



            ],
          ),
        ),
      ),
    );
  }
}

