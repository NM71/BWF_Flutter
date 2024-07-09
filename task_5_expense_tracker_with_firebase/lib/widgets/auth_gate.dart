import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:task_5_expense_tracker_with_firebase/screens/home_page.dart';
import 'package:task_5_expense_tracker_with_firebase/screens/login_screen.dart';

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
