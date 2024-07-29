import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:task_6_e_commerce_e_bazaar/firebase_options.dart';
import 'package:task_6_e_commerce_e_bazaar/views/home_page.dart';
import 'package:task_6_e_commerce_e_bazaar/views/login_screen.dart';
// import 'package:task_6_e_commerce_e_bazaar/views/home_page.dart';
// import 'package:task_6_e_commerce_e_bazaar/views/login_screen.dart';


void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
      // home: HomePage(),
    ),
  ));
}
