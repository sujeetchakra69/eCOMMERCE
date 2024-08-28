import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart'; // Ensure this import is correct for your project

class item_detail extends StatelessWidget {
  final int itemIndex; // Add this line

  const item_detail({super.key, required this.itemIndex});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Item Detail'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Consumer<CartModel>(
          builder: (context, cartModel, child) {
            if (cartModel.shopItems.isEmpty) {
              return const Center(
                child: Text(
                  'Your cart is empty!',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }
        
            // Get the first item from the cart or specify the index of the item you want to display
            final item = cartModel.shopItems[itemIndex]; // Change index if needed
            final imagePath = item[2]; // Assuming the third element is the image path
            final itemName = item[0]; // Assuming the first element is the item name
            final itemPrice = item[1]; // Assuming the second element is the item price
            final description =item[4];
        
        
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Top section: Display the item image
                  Container(
                    width: double.infinity,
                    height: 350,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagePath),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: 3,
                          blurRadius: 5,
                          offset: const Offset(0, 3), // changes position of shadow
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8.0),
                  // Bottom section: Display the item name and price
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      itemName,
                      style: const TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      '\$${itemPrice.toString()}',textAlign: TextAlign.right,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.green,
                      ),
                    ),
                  ),
        
                  Card(
                    color:Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(description ,
                        style: GoogleFonts.lato(textStyle:TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),),
                    ),
                  ),
        
                  Card(
                    color:Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(description ,
                        style: GoogleFonts.lato(textStyle:TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                        ),),
                    ),
                  ),
        
        
        
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
