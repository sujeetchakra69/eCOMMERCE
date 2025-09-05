

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/utility/constants/colors.dart';

class BrandVerification extends StatelessWidget {
  const BrandVerification({
    super.key, required this.title,  this.maxLines=1,
  });

final String title;
final int maxLines;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.labelSmall!.apply(color: TColors.dark),
          overflow: TextOverflow.ellipsis,
          maxLines: maxLines,
          textAlign: TextAlign.left,
        ),
            const SizedBox(
              width: 5,
            ),
            const Icon(
              Iconsax.verify5,
              color: Colors.blue,
            )
          
       
      ],
    );
  }
}
