
import 'package:flutter/material.dart';
//import 'package:grocery_app/cart_model.dart';
//import 'package:grocery_app/shop.dart';
//import 'grid_tile.dart';
import 'item_list.dart';
import 'package:google_fonts/google_fonts.dart';
//import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            
            Padding(
              
              padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
              child: Image.asset('images/logo.jpg',height: 350.0,width: 400,),
              
            ),
            const SizedBox(height: 20,),
            /*const Text('Enjoy the Freshness here...',
            style: TextStyle(
              fontSize: 30.0,
              fontWeight:FontWeight.w300,
            ),),*/
            Text(
              'Enjoy the Freshness here...',
              style: GoogleFonts.lato(
                textStyle: TextStyle(color: Colors.blue, letterSpacing: .5,  fontSize: 30.0,),
              ),
            ),

            const SizedBox(height: 10.0,),
             Text('Fresh Vegetables everyday',
            style: GoogleFonts.lato(textStyle: TextStyle(
              fontSize: 15.0,
              color: Colors.grey,fontWeight: FontWeight.bold,
            ),),
            ),
            const SizedBox(height: 20.0,),
            const Padding(
              padding: EdgeInsets.all(50.0),
              child: Divider(height: 40.0),
                
          
            ),
            
            GestureDetector(
              onTap: () => Navigator.push(context,MaterialPageRoute(
                builder: (context){
                  return const itemlist();
                } )),
              child: Container(
                decoration: BoxDecoration( 
                color: Colors.grey,
                borderRadius: BorderRadius.circular(10),
                ),
                child: const Padding(
                  padding:  EdgeInsets.all(10.0),
                  child: Text('Shop now',
                    style: TextStyle(
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ) ,),
                ),
              
              ),
            ),
      
        
          ],
        
        ),
      ),

    );
  }
}