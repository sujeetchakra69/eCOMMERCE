import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/components/TSearchBar.dart';

class CustomSearch extends StatelessWidget {
  const CustomSearch({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const TSearchBar(
      text: 'Search the items',
      icon: Iconsax.search_normal,
      showBackground: true,
      showborder: true,
    );
  }
}