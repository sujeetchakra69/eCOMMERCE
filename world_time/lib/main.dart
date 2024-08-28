import 'package:flutter/material.dart';
import 'package:world_time/pages/home.dart';
import 'package:world_time/pages/loading_screen.dart';
import 'package:world_time/pages/location.dart';
void main() {
  runApp( MaterialApp(
    initialRoute: '/',
    routes: {
      '/':(context)=>loading_screen(),
      '/home':(context) => Home(),
      '/location':(context)=>Location(),
    }
    ),
  
  
  
  );
}

