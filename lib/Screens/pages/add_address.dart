import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/utility/constants/size.dart';

class AddAddress extends StatelessWidget {
  const AddAddress({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true, 
        title: Text('Add new Address'),
      ),
      body: SingleChildScrollView( // Added to prevent overflow when keyboard is opened
        padding: const EdgeInsets.all(16.0), // Added padding for better UI
        child: Column(
          children: [
            // Name Field
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.user), 
                labelText: 'Name',
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace / 2),

            // Phone Number Field
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.mobile), 
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace / 2),

            // Row for Street and Postal Code
            Row(
              children: [
                // Expanded to avoid layout overflow
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.home), 
                      labelText: 'Street',
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.defaultSpace / 2),

                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.code), 
                      labelText: 'Postal Code',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.defaultSpace / 2),

            // Row for City and State
            Row(
              children: [
                // Expanded to avoid layout overflow
                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.building), 
                      labelText: 'City',
                    ),
                  ),
                ),
                const SizedBox(width: TSizes.defaultSpace / 2),

                Expanded(
                  child: TextFormField(
                    decoration: const InputDecoration(
                      prefixIcon: Icon(Iconsax.activity), 
                      labelText: 'State',
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: TSizes.defaultSpace / 2),

            // Country Field
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Iconsax.global), 
                labelText: 'Country',
              ),
            ),
            const SizedBox(height: TSizes.defaultSpace,),


            Container(width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Colors.blue,
            ),
              child: TextButton(onPressed: (){}, child: const Text('Save',style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.bold
              ),)))
          ],
        ),
      ),
    );
  }
}
