import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/navigation.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';

class PaymentSuccessful extends StatelessWidget {
  const PaymentSuccessful({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column( mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Image(image: AssetImage(TImages.successfulPaymentIcon)),
             const SizedBox(height: TSizes.spaceBtwItems,),
            Text('Payment Successful',style: Theme.of(context).textTheme.headlineMedium,),
            const SizedBox(height: 50,),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
              child: SizedBox(width: double.infinity,child: ElevatedButton(onPressed: (){Get.to(const NavigationMenu());}, child: const Text('Continue Shopping'))),
            )
          ],
        ),
      ),
    );
  }
}