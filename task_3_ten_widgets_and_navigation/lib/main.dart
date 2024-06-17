import 'package:bwt_flutter/ten_widgets_and_navigation.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';

void main() => runApp(
      DevicePreview(
        builder: (context) => MyApp(),
      ),
    );

class MyApp extends StatelessWidget {
  // const TenWidgetsAndNavigation({super.key})

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: TenWidgetsAndNavigation(),
    );
  }
}
