import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_6_e_commerce_e_bazaar/views/home_page.dart';
import 'package:task_6_e_commerce_e_bazaar/views/login_screen.dart';

class AuthGate extends StatelessWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if(!snapshot.hasData){
          return LoginScreen();
        }
        // return Dashboard();
        return HomePage();
      }
    );
  }
}
