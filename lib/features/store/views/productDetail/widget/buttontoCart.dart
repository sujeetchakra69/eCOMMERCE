import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/components/project_component/TCircularIcon.dart';

class ToCart extends StatelessWidget {
  const ToCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 55,
      decoration: const BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(14),
            topRight: Radius.circular(14),
          )),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Row(
            children: [
              TCircularIcon(
                backgroundColor: Colors.grey,
                icon: Iconsax.minus,
                height: 40,
                width: 40,
              ),
              SizedBox(
                width: 8,
              ),
              Text('2'),
              SizedBox(
                width: 8,
              ),
              TCircularIcon(
                backgroundColor: Colors.grey,
                icon: Iconsax.add,
                height: 40,
                width: 40,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: TextButton(
                onPressed: () {},
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[300],
                  side: const BorderSide(
                    color: Colors.transparent,
                    width: 2.0, // Border width
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    // Border radius
                  ),
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(
                      fontWeight: FontWeight.bold, color: Colors.black),
                )),
          )
        ],
      ),
    );
  }
}
