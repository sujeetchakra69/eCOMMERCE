import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:t_store/Screens/pages/payment_successful.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';

class Checkoutpage extends StatelessWidget {
  Checkoutpage({super.key});
  final List<int> quantities = List<int>.filled(2, 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        showBackArrow: true,
        title: Text('Order Review'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                height: 70,
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.grey[50],
                ),
                child: Row(
                  children: [
                    Flexible(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: 'Have a promo code? Enter here',
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    ElevatedButton(
                      onPressed: () {},
                      child: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 15),
                        child: Text('Apply'),
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.grey[100]),
                child: Column(
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(15.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextsStyle(
                                text: 'Subtotal',
                              ),
                              SizedBox(
                                height: TSizes.md,
                              ),
                              TextsStyle(
                                text: 'Shipping Fee',
                              ),
                              SizedBox(
                                height: TSizes.md,
                              ),
                              TextsStyle(
                                text: 'Tax Fee',
                              ),
                              SizedBox(
                                height: TSizes.md,
                              ),
                              Text(
                                'Order Total',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              TextsStyle(
                                text: '\$100',
                              ),
                              SizedBox(
                                height: TSizes.md,
                              ),
                              TextsStyle(
                                text: '\$20',
                              ),
                              SizedBox(
                                height: TSizes.md,
                              ),
                              TextsStyle(
                                text: '\$13',
                              ),
                              SizedBox(
                                height: TSizes.md,
                              ),
                              Text(
                                '\$133',
                                style: TextStyle(
                                    fontSize: 17, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Divider(
                      thickness: 2,
                      color: Colors.black,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Text('Payment Method',
                              style:
                                  Theme.of(context).textTheme.headlineMedium),
                        ),
                        TextButton(
                            onPressed: () {},
                            child: const Text(
                              'Change',
                              style: TextStyle(color: Colors.grey),
                            )),
                      ],
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CircleImages(
                            images: TImages.paypal,
                          ),
                          CircleImages(
                            images: TImages.khalti,
                          ),
                          CircleImages(
                            images: TImages.esewa,
                          ),
                          CircleImages(
                            images: TImages.masterCard,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwSections,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Shipping Detail',
                                  style:
                                      Theme.of(context).textTheme.headlineMedium),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Change',
                                    style: TextStyle(color: Colors.grey),
                                  )),
                            ],
                          ),
                          const SizedBox(height: TSizes.spaceBtwItems,),
                          const TextsStyle(
                            text: 'Sujeet Chakradhar',
                          ),
                          
                          const TextsStyle(
                                      text: '+977 9984116566',
                                    ),
                          
                                    const TextsStyle(
                                      text: '+977 9764488415',
                                    ),
                          
                                    const TextsStyle(
                                      text: 'madhyapur thimi, bhaktapur',
                                    ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SizedBox( width: double.infinity,child: ElevatedButton(onPressed: (){Get.to(const PaymentSuccessful());}, child: const Text('Done'))),
            )
          ],
        ),
      ),
    );
  }
}

class CircleImages extends StatelessWidget {
  const CircleImages({
    super.key,
    required this.images,
  });
  final String images;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: Colors.transparent,
      radius: 25,
      child: Image(image: AssetImage(images)),
    );
  }
}

class TextsStyle extends StatelessWidget {
  const TextsStyle({
    super.key,
    required this.text,
  });
  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(text, style: Theme.of(context).textTheme.bodyLarge);
  }
}
