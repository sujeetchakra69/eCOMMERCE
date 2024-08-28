import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main()
{return runApp(MaterialApp(

home: Home(),
),
);


}


class Home  extends StatefulWidget {

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int roll=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text('ID card'),
        centerTitle: true,
        backgroundColor: Colors.grey,
        elevation: 0.0,
      ),
      
      body: Padding(padding: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        
        children: [
          Center(
            child: CircleAvatar(
              radius: 50,
              backgroundImage: AssetImage('assests/a.jpeg'),
            ),
          ),

          Text('Name:',
          style: TextStyle(
            color: Colors.white,
            fontWeight:FontWeight.bold,
            fontSize:25.0,
            letterSpacing: 2.0, 
          ),
          ),
          SizedBox(height: 10.0),

          Text('Sujeet chakradhar',
          style: TextStyle(
            color: Colors.white,
            fontWeight:FontWeight.w100,
            fontSize:28.0, 
            letterSpacing: 2.0,
          ),
          ),

           SizedBox(height: 20.0),
           
          Text('Roll no:',
          style: TextStyle(
            color: Colors.white,
            fontWeight:FontWeight.bold,
            fontSize:25.0,
            letterSpacing: 2.0, 
          ),
          ),
          SizedBox(height: 10.0),

           Padding(
             padding: EdgeInsets.all(8.0),
             child: Text('$roll',
                       style: TextStyle(
              color: Colors.white,
              fontWeight:FontWeight.w100,
              fontSize:28.0, 
              letterSpacing: 2.0,
                       ),
                       ),
           ),

          SizedBox(height: 20.0),
          
          Text('Address:',
          style: TextStyle(
            color: Colors.white,
            fontWeight:FontWeight.bold,
            fontSize:25.0,
            letterSpacing: 2.0, 
          ),
          ),
          SizedBox(height: 10.0),

          Text('Bhaktapur',
          style: TextStyle(
            color: Colors.white,
            fontWeight:FontWeight.w100,
            fontSize:28.0, 
            letterSpacing: 2.0,
          ),
          ),
          
          
          SizedBox(height: 20.0),

          Row(
            children: [
             Icon(
              Icons.mail,
              color: Colors.lightBlueAccent,
              
             ),
             SizedBox(width: 10.0,),
            Text('Sujeetchakradhar@gmail.com',
            style: TextStyle(
              color: Colors.lightBlueAccent,
              fontSize: 25.0,

            ),

              ), 
            ],//children
          ),


          Padding(
            padding: EdgeInsets.fromLTRB(10, 50, 10, 0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed:(){
                    setState(() {
                      roll+=1;
                    });
                  }, 
            
                 child:Text('click me',
                 style: TextStyle(
                  color: Colors.amberAccent,
                 ),
                 ),
                 
                ),
              ],
            ),
          ),


        ],
        
        
      ),
        
      ),
    ); 
  }
}