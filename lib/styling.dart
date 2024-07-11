import 'package:flutter/material.dart';

//button styles
var primaryBtn = ButtonStyle(
    foregroundColor: MaterialStatePropertyAll(Colors.white),
    backgroundColor: MaterialStatePropertyAll(primaryColor),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ));

var secondaryBtn = ButtonStyle(
    foregroundColor: MaterialStatePropertyAll(primaryColor),
    backgroundColor: MaterialStatePropertyAll(primaryLightColor),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ));

var errorBtn = ButtonStyle(
    foregroundColor: MaterialStatePropertyAll(Colors.white),
    backgroundColor: MaterialStatePropertyAll(error),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ));

var errorBtn2 = ButtonStyle(
    foregroundColor: MaterialStatePropertyAll(Colors.white),
    backgroundColor: MaterialStatePropertyAll(errorDark),
    shape: MaterialStatePropertyAll(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ));

var textButton = ButtonStyle(
  foregroundColor: MaterialStatePropertyAll(Colors.white),
);

//text styles
var header1 = TextStyle(
    fontSize: 24, fontWeight: FontWeight.w600, color: primaryDarkColor);
var header2 = TextStyle(
    fontSize: 24, fontWeight: FontWeight.normal, color: primaryDarkColor);
var header3 = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600, color: primaryDarkColor);
var header4 = TextStyle(
    fontSize: 20, fontWeight: FontWeight.normal, color: primaryDarkColor);
var header5 = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w600, color: primaryDarkColor);
var header6 = TextStyle(
    fontSize: 16, fontWeight: FontWeight.normal, color: primaryDarkColor);
var paragraph = TextStyle(
    fontSize: 14, fontWeight: FontWeight.normal, color: primaryDarkColor);

var header1_light = TextStyle(
    fontSize: 24, fontWeight: FontWeight.w600, color: primaryLightColor);
var header2_light = TextStyle(
    fontSize: 24, fontWeight: FontWeight.normal, color: primaryLightColor);
var header3_light = TextStyle(
    fontSize: 20, fontWeight: FontWeight.w600, color: primaryLightColor);
var header4_light = TextStyle(
    fontSize: 20, fontWeight: FontWeight.normal, color: primaryLightColor);
var header5_light = TextStyle(
    fontSize: 16, fontWeight: FontWeight.w600, color: primaryLightColor);
var header6_light = TextStyle(
    fontSize: 16, fontWeight: FontWeight.normal, color: primaryLightColor);
var paragraph_light = TextStyle(
    fontSize: 14, fontWeight: FontWeight.normal, color: primaryLightColor);

var header1_primary =
    TextStyle(fontSize: 24, fontWeight: FontWeight.w600, color: primaryColor);
var header2_primary =
    TextStyle(fontSize: 24, fontWeight: FontWeight.normal, color: primaryColor);
var header3_primary =
    TextStyle(fontSize: 20, fontWeight: FontWeight.w600, color: primaryColor);
var header4_primary =
    TextStyle(fontSize: 20, fontWeight: FontWeight.normal, color: primaryColor);
var header5_primary =
    TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: primaryColor);
var header6_primary =
    TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: primaryColor);
var paragraph_primary =
    TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: primaryColor);

//colors
var primaryColor = Color(0xFF9067C6);
var primaryLightColor = Color(0xFFE1DFEC);
var primaryDarkColor = Color(0xFF242038);
var error = Color(0xFFAF0000);
var errorDark = Color(0xFF330000);
var success = Color(0xFF00FE47);
