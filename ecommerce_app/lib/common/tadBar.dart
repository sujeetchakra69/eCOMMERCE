import 'package:flutter/material.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/device/device_utility.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class TTabBar extends StatelessWidget implements PreferredSizeWidget {
  const TTabBar({
    super.key,
    required this.tab,
  });
  final List<Widget> tab;

  @override
  Widget build(BuildContext context) {
    return TabBar(
      tabAlignment: TabAlignment.center,
      padding: const EdgeInsets.only(left: 0.0), // Set to zero to remove left space
        // labelPadding: const EdgeInsets.only(left: 0.0, ),
        isScrollable: true,
        indicatorColor: TColors.primary,
        labelColor:
            THelperFunctions.isDarkMode(context) ? TColors.white : TColors.dark,
        tabs: tab);
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(TdeviceUtils.getAppBarHeight());
}
