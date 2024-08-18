// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:cricklyzer/Screens/home_screen.dart';
// import 'package:cricklyzer/widgets/custom_buttons.dart';
import 'package:firebase_auth/firebase_auth.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    super.initState();
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
      if (_user != null) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => HomeScreen()),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _user != null ? _userInfo() : _googleSignInButton(),
    );
  }

  Widget _googleSignInButton() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 16.0),
            child: Image.asset(
              'assets/images/letter-c-outline.png',
              height: 120,
            ),
          ),
          const Text(
            'Cricklyzer',
            style: TextStyle(
                color: Colors.black,
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          const Text(
            '\nSign In with your Google Account',
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20,),
          ),
          const SizedBox(height: 30,),
          GestureDetector(
              onTap: handleGoogleSignIn,
              child: const Image(
            image: AssetImage('assets/images/google-logo.png'),
            height: 50,
            width: 50,
          ),
          ),
          // CustomButton(
          //   text: "Sign In with Google",
          //   onPressed: handleGoogleSignIn,
          // ),
        ],
      ),
    );
  }

  Widget _userInfo() {
    return const SizedBox();
  }

  void handleGoogleSignIn() async {
    try {
      GoogleAuthProvider googleAuthProvider = GoogleAuthProvider();
      // await FirebaseAuth.instance.signInWithProvider(googleAuthProvider);
      await FirebaseAuth.instance.signInWithPopup(googleAuthProvider);
      // ignore: empty_catches
    } catch (error) {}
  }
}
