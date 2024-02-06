import 'package:flutter/material.dart';


class Home_Page extends StatefulWidget {
  const Home_Page({super.key});

  @override
  State<Home_Page> createState() => _Home_PageState();
}

class _Home_PageState extends State<Home_Page> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome !!!!!!!....",style: TextStyle(color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
