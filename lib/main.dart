import 'package:firebase_core/firebase_core.dart';
import 'package:firebaseintro/login_page.dart';
import 'package:flutter/material.dart';

 Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();
   await Firebase.initializeApp(
     options: FirebaseOptions(
         apiKey: "AIzaSyABFxPsDUF7AMxoD9DVFfzBNsVVtZe3Z4w",
         appId: "1:220073361315:android:4d2e86a2015426baa1a416",
         messagingSenderId: "220073361315",
         projectId: "registerauth-bbc1b")
   );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
         home: Login_Page(),
    );
  }
}
