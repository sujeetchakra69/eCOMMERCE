import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/common_shapes.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class SingleAddress extends StatelessWidget {
  const SingleAddress({super.key, required this.selectedAddress});
  final bool selectedAddress;

  @override
  Widget build(BuildContext context) {
    final bool dark = THelperFunctions.isDarkMode(context);
    return TCircleContainer(
      showBorder: true,
      width: double.infinity,
      backgroundColor: selectedAddress
          ? TColors.primary
          : dark
              ? TColors.light
              : TColors.grey,
      child: Stack(
        children: [
          Positioned(
            top: 10,
            right: 15,
            child: Icon(selectedAddress ? Iconsax.tick_circle5 : null,
                color: selectedAddress
                    ? dark
                        ? TColors.grey
                        : TColors.darkergrey
                    : null),
          ),
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [



                Text('Sujeet Chakradhar',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleLarge),



                Text('9813194171',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.titleSmall),
                
                
                
               
               
                Text('MAdhyapur thimi, Bhaktapur, Nepal',
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelLarge),
              ],
            ),
          )
        ],
      ),
    );
  }
}
