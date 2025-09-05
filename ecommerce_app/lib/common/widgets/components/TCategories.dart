import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/size.dart';

class TCategories extends StatelessWidget {
  const TCategories({
    super.key,
    this.color,
    this.showActionButton = true,
    required this.title,
    this.buttonTitle = 'View all',
    this.onPressed,
  });
  final Color? color;
  final bool showActionButton;
  final String title, buttonTitle;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: TSizes.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style:
                Theme.of(context).textTheme.headlineMedium!.apply(color: color),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
          ),
          if (showActionButton)
            TextButton(onPressed: onPressed, child: Text(buttonTitle,style:const  TextStyle( color: Colors.blue),),)
        ],
      ),
    );
  }
}
