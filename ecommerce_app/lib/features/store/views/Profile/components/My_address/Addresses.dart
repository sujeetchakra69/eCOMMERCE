import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/Screens/pages/add_address.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/features/store/views/Profile/components/My_address/Single_address.dart';
import 'package:t_store/utility/constants/size.dart';

class Addresses extends StatelessWidget {
  const Addresses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppBar(
          showBackArrow: true,
          title: Text('Addresses'),
        ),
        body: const SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(TSizes.defaultSpace),
            child: Column(
              children: [
                SingleAddress(selectedAddress: true),
                SizedBox(
                  height: TSizes.defaultSpace / 2,
                ),
                SingleAddress(selectedAddress: true),
                SizedBox(
                  height: TSizes.defaultSpace / 2,
                ),
                SingleAddress(selectedAddress: false),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () => Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddAddress())),
          child: const Icon(
            Iconsax.add,
          ),
        ));
  }
}
