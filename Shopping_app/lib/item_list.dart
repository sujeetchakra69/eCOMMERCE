import 'package:flutter/material.dart';
import 'package:grocery_app/shop.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart';
//import 'package:grocery_app/cart_model.dart';
import 'grid_tile.dart';
class itemlist extends StatelessWidget {
  const itemlist({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title: const Text('Thimi Supermarket'),
      centerTitle: true,),
      body: Column( crossAxisAlignment: CrossAxisAlignment.start, // Aligns children to the start

        children: [
          const SizedBox(height: 20.0,),
      
          const Padding(
            padding: EdgeInsets.symmetric(horizontal:10.0),
            child: Text('Good Morning',textAlign: TextAlign.left,),
            
          ),
      
        const SizedBox(height: 10.0,),
      
          const Padding(
            padding: EdgeInsets.all(20),
            child: Text('Buy some fresh veggies',textAlign: TextAlign.left,
            style: TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.w200,
            ),),
          ),
      
      
        const Divider(height: 10.0,),
        
        
        Expanded(
          child: Consumer<CartModel>(
            builder: (context, value, child) {
              return GridView.builder(
                padding: const EdgeInsets.all(10),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: value.shopItems.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  childAspectRatio: 1 / 1.2,
                ),
                itemBuilder: (context, index) {
                  return GroceryItemTile(
                    itemName: value.shopItems[index][0],
                    itemPrice: value.shopItems[index][1],
                    imagePath: value.shopItems[index][2],
                    color: value.shopItems[index][3],
                    onPressed: () =>
                        Provider.of<CartModel>(context, listen: false)
                            .addItemToCart(index),
                  
                  );
                },
              );
            },
          ),
        ),
      const Divider(height: 4,),
        Row(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            
            Padding(
              padding: const EdgeInsets.all(15.0),
              child:  ElevatedButton(
                onPressed:()=>Navigator.push(context,MaterialPageRoute(
                  builder: (context){
                    return CartPage(); }))  ,         
                
                child:const Icon(Icons.shopping_cart),
                
                 
              
            ),
            )
          ],
        ),
      
        ],
      ),
    );
  }
}