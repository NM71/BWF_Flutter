import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cricklyzer/Screens/home_screen.dart';
// import 'package:cricklyzer/provider/auth_provider.dart';
import 'firebase_options.dart';
// import 'package:cricklyzer/Screens/welcome_screen.dart';
// import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      //provide multiple providers
      // providers: [
      //   ChangeNotifierProvider(
      //       create: (_) =>
      //           AuthProvider()) //change notifiers is a provider which is specifically used for auth
      // ],

      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Symthe'
      ),
      home: HomeScreen(),
      title: "Cricklyzer",
    );
  }
}
