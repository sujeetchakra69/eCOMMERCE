import 'package:flutter/material.dart';



class Location extends StatefulWidget {

  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Text("Please select the Location"),
        TextField(
          decoration: InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Enter a search term',
         ),
      ),
      ],)
    );
  }
}