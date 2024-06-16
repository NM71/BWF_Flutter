import 'dart:ui';

import 'package:flutter/material.dart';

class AppWidget {

  static TextStyle mainText(){
    return TextStyle(color: Colors.black, fontSize: 40.0, fontWeight: FontWeight.bold, fontFamily: 'RobotoMono');
  }

  static TextStyle boldTextFieldStyle(){
    return TextStyle(color: Colors.black, fontSize: 28.0, fontWeight: FontWeight.bold, fontFamily: 'MerriweatherSans');
  }

  static TextStyle lightTextFieldStyle(){
    return TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.w500, fontFamily: 'MerriweatherSans');
  }

  static TextStyle lightTextFieldStyleNormalFont(){
    return TextStyle(color: Colors.black54, fontSize: 20.0, fontWeight: FontWeight.w500,fontFamily: 'RobotoMono');
  }
}