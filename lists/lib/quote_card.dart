
  import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
  import 'quote.dart';
  

class quotesCards extends StatelessWidget {
  
  final Lists quote;
  final  delete;
  quotesCards({ required this.quote,required this.delete});


  @override
  Widget build(BuildContext context) {
    return Card(
        margin:EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(quote.text,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),),

            Text(quote.author,
            style:TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
            ),

            ElevatedButton.icon(
              
              onPressed:delete,
               label: Text("delete"),
               icon: Icon(Icons.delete),
               
               
               
               )

          ],
        ),
    );
  }
}