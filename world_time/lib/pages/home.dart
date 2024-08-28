
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';


class Home extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(
      title: Text('Home Page',
       style: TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.bold,
        backgroundColor: Colors.grey[300]
        ),
        ),
        centerTitle: true,
        elevation: 5.0,

    ),
       bottomNavigationBar:BottomNavigationBar(
        items:const [
          BottomNavigationBarItem(icon: Icon(Icons.arrow_back),
          label: 'Back'),
          BottomNavigationBarItem(icon: Icon(Icons.home),
          label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.location_city),
          label: 'Location'),
        ],
        
        
        

          
            ),
      body:Center(
      child: Column(
        children: [
          
          Text('hello'),
          
                
        




          ],
        ),
      ),
    );
  }
}