import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class DropDownMenu extends StatelessWidget {
  const DropDownMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      items: ['Name', 'higher price', 'lower Price', 'Sale']
          .map((option) => DropdownMenuItem(
                value: option,
                child: Text(option),
              ))
          .toList(),
      onChanged: (value) {},
      decoration:
          const InputDecoration(prefixIcon: Icon(Iconsax.sort)),
    );
  }
}
