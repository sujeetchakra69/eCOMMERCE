import 'package:flutter/material.dart';

class TelevatedbuttonTheme{
  TelevatedbuttonTheme._();

  static final lightelevatedbuttonTheme=ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
    elevation: 1.0,
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: Colors.blue),
    padding:const  EdgeInsets.symmetric(vertical: 18),
    textStyle:const TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))
  ));


  static final darkelevatedbuttonTheme=ElevatedButtonThemeData(style: ElevatedButton.styleFrom(
    elevation: 1.0,
    foregroundColor: Colors.white,
    backgroundColor: Colors.blue,
    disabledForegroundColor: Colors.grey,
    disabledBackgroundColor: Colors.grey,
    side: const BorderSide(color: Colors.blue),
    padding:const  EdgeInsets.symmetric(vertical: 18),
    textStyle:const TextStyle(fontSize: 16.0,color: Colors.white,fontWeight: FontWeight.w600),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12))

  ));
}