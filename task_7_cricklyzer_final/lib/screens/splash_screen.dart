import 'dart:async';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home_screen.dart'; // Import your home screen
import 'welcome_screen.dart'; // Import your welcome screen

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  bool _isFirstTime = true; // Default value assuming it's the first time

  @override
  void initState() {
    super.initState();
    _checkFirstTime().then((isFirstTime) {
      setState(() {
        _isFirstTime = isFirstTime;
      });
      _navigateToNextScreen();
    });
  }

  Future<bool> _checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('first_time') ?? true;
  }

  Future<void> _navigateToNextScreen() async {
    // Simulate some background initialization work
    await Future.delayed(const Duration(seconds: 3));
    
    // Navigate based on whether it's the first time or not
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) => _isFirstTime ? const WelcomeScreen() : HomeScreen()),
    );

    // Update the flag in shared preferences
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('first_time', false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/letter-c-outline.png',
              width: 120,
              height: 120,
            ),
            const Text("Cricklyzer", style: TextStyle(fontSize: 30),),
            const Text("App for Cricketers"),
          ],
        ),
      ),
    );
  }
}
