import 'package:flutter/material.dart';
import 'quote.dart';
import 'quote_card.dart';

void main() {
  runApp( MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List <Lists> quotes=[
  Lists(author: 'aaa',text: 'aaaaaaaaaa'),
  Lists(author: 'bbb',text: 'bbbbbbbbbb'),
  Lists(author: 'ccc',text: 'cccccccccc'),
  ];
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('List'),
        backgroundColor: const Color.fromARGB(127, 68, 137, 255),
        elevation: 0.0,
        centerTitle: true,

      ),

      body: Center(
        child: Column( 
          children:quotes.map((quote)=> quotesCards(quote: quote,
          delete:(){
            setState(() {
              quotes.remove(quote);
            });
          }
          )).toList(),
            ),
      ),);
  }
}
