import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class TCartIcon extends StatelessWidget {
  const TCartIcon({
    super.key,  required this.onPressed,
  });
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
        final bool dark = Theme.of(context).brightness == Brightness.dark;

    return Stack(children: [
      IconButton(
          onPressed: onPressed,
          icon:  Icon(
            Iconsax.shopping_bag,
            color:dark? Colors.white: Colors.black,
          )),
          Positioned(
            right: 0,
            child: Container(
              height: 18,
              width: 18,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color:const  Color.fromARGB(255, 245, 207, 205),
              ),
              child: Center(
                child: Text('2',style: Theme.of(context).textTheme.labelSmall,),
              ),
            
            ),
            
          ),
    ]);
  }
}
