import 'package:flutter/material.dart';

const kPrimaryColor = Color(0xfffef7ff);
const kSecondaryColor = Color(0xff022238);
const kThirdColor = Color(0xFF49454f);
const kLightBackground = Color(0xFFE8F6FB);
const kWhiteColor = Colors.white;
const kBlackColor = Colors.black;

class AppTheme {
  static const kBigTitle = TextStyle(
    color: kWhiteColor,
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily: "Lato"
  );

  static const kHeadingOne = TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily: "Lato"
  );

  static const kSeeAllText = TextStyle(color: kPrimaryColor, fontFamily: "Lato");

  static final kBodyText = TextStyle(
    color: Colors.grey.shade500,
    fontSize: 12,
    fontFamily: "Lato"
  );

  static const kCardTitle = TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: "Lato"
  );
}
