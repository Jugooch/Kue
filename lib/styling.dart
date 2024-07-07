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
//input styles

//text styles

//colors
var primaryColor = Color(0xFF9067C6);
var primaryLightColor = Color(0xFFE1DFEC);
var primaryDarkColor = Color(0xFF242038);
var error = Color(0xFFAF0000);
var errorDark = Color(0xFF330000);
var success = Color(0xFF00FE47);