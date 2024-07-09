import 'package:device_preview/device_preview.dart';
import 'package:task_5_expense_tracker_with_firebase/widgets/auth_gate.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:task_5_expense_tracker_with_firebase/screens/signup_screen.dart';

// void main() {
//   runApp(const MyApp());
// }

// void main() => runApp(DevicePreview(builder: (context) => MyApp(),),);

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
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
      title: 'Expense Tracker',
      builder: (context,child){
        return MediaQuery(data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)), child: child!);
      },
      home: AuthGate(),
    );
  }
}

