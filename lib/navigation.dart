import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/features/store/views/Profile/profile.dart';
import 'package:t_store/features/store/views/home/home.dart';
import 'package:t_store/features/store/views/store/Store.dart';
import 'package:t_store/features/store/views/wishlist/Wishlist.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/helpers/helper_functions.dart';

class NavigationMenu
 extends StatefulWidget {
  const NavigationMenu
  ({super.key});

  @override
  State<NavigationMenu> createState() => _NavigationMenuState();
}

class _NavigationMenuState extends State<NavigationMenu> {
  final controller=Get.put(NavigationController());
  @override
  Widget build(BuildContext context) {
    final darkMode= THelperFunctions.isDarkMode(context);
    return  Scaffold(
      bottomNavigationBar: Obx(
        ()=> NavigationBar(height: 80,
        elevation: 0,
        selectedIndex: controller.selectedIndex.value,
        onDestinationSelected: (index)=> controller.selectedIndex.value=index ,
        backgroundColor: darkMode? TColors.black : TColors.white,
        indicatorColor: darkMode? Colors.white.withOpacity(.1): TColors.black.withOpacity(.1),
          destinations:const [
         NavigationDestination(icon: Icon(Iconsax.home), label: 'Home'),
          NavigationDestination(icon: Icon(Iconsax.shop), label: 'Store'),
         NavigationDestination(icon: Icon(Iconsax.heart), label: 'Favourite'),
         NavigationDestination(icon: Icon(Iconsax.user), label: 'Profile'),
        
        ],),
      ),
      body:Obx(()=> controller.screens[controller.selectedIndex.value]) ,
    );
  }
}


class NavigationController extends GetxController{
  final Rx<int> selectedIndex=0.obs;

  final screens =[const HomeScreen(),const StoreScreen(),const WishlistScreen(), ProfileScreen()];


}