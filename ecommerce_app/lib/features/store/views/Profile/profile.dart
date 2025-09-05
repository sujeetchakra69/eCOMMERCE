import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/common/widgets/common_shapes.dart';
import 'package:t_store/common/widgets/components/TCategories.dart';
import 'package:t_store/common/widgets/curvededges.dart';
import 'package:t_store/features/store/controllers/Profile_controller.dart';
import 'package:t_store/features/store/views/Profile/Listitle.dart';
import 'package:t_store/features/store/views/Profile/components/My_address/Addresses.dart';
import 'package:t_store/features/store/views/Profile/components/Profile_user_tile.dart';
import 'package:t_store/features/store/views/Profile/components/cart/my_cart.dart';
import 'package:t_store/features/store/views/order/Order.dart';
import 'package:t_store/utility/constants/colors.dart';
import 'package:t_store/utility/constants/size.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  // Initialize the ProfileController
  final ProfileController controller = Get.put(ProfileController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.transparent, // Make the app bar transparent
            expandedHeight: 100, // Adjust the height for your needs
            floating: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              background: ClipPath(
                clipper: TCustomCurveEdges(),
                child: Container(
                  color: const Color.fromARGB(255, 46, 92, 240),
                  padding: const EdgeInsets.all(0),
                  child: Stack(
                    children: [
                      Positioned(
                        top: -150,
                        right: -250,
                        child: TCircleContainer(
                          showBorder: true,
                          width: 400,
                          height: 300,
                          backgroundColor: TColors.black.withOpacity(.1),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              title: Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Text('Account',
                          style: TextStyle(
                              color: Color.fromARGB(255, 215, 214, 214))),
                      IconButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const ProfileUserTile()));
                        },
                        icon: const Icon(Iconsax.user),
                        color: Colors.white,
                      )
                    ],
                  )),
              centerTitle: true,
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate([
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const TCategories(
                      title: 'Account Settings',
                      showActionButton: false,
                    ),
                    const SizedBox(
                      height: TSizes.spaceBtwItems,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const Addresses());
                      },
                      child: const ProfileListTile(
                        icon: Iconsax.home,
                        title: 'My Addresses',
                        subtitle: 'Set Shipping delivery address',
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => const MyCart());
                      },

                      child: const ProfileListTile(
                        icon: Iconsax.shopping_cart5,
                        title: 'My Cart',
                        subtitle: 'Add, remove product and move to checkout',
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    GestureDetector(
                      onTap: ()=> Get.to( const MyOrder()),
                      child: const ProfileListTile(
                        icon: Iconsax.bag_tick,
                        title: 'My Orders',
                        subtitle: 'Progress and Completed Orders',
                      ),
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const ProfileListTile(
                      icon: Iconsax.bank,
                      title: 'Bank Account',
                      subtitle: 'Withdraw balance to registered bank account',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const ProfileListTile(
                      icon: Iconsax.discount_circle,
                      title: 'My Coupons',
                      subtitle: 'List of all the discounted coupons',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const ProfileListTile(
                      icon: Iconsax.notification,
                      title: 'Notification',
                      subtitle: 'See Notification',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const ProfileListTile(
                      icon: Iconsax.security_card,
                      title: 'Account Privacy',
                      subtitle: 'Manage data usage and connected accounts',
                    ),
                    const SizedBox(height: TSizes.defaultSpace),
                    const TCategories(
                      title: 'App Settings',
                      showActionButton: false,
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),
                    const ProfileListTile(
                      icon: Iconsax.document,
                      title: 'Load Data',
                      subtitle: 'Manage data usage and connected accounts',
                    ),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Location Switch with GetX
                    Obx(() => ProfileListTile(
                          icon: Iconsax.location,
                          title: 'Location',
                          subtitle: 'Get the location',
                          trailing: Switch(
                            value: controller.isLocationEnabled.value,
                            onChanged: (value) {
                              controller.toggleLocation();
                            },
                          ),
                        )),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // Safe Mode Switch with GetX
                    Obx(() => ProfileListTile(
                          icon: Iconsax.security_user,
                          title: 'Safe Mode',
                          subtitle: 'Manage data usage and connected accounts',
                          trailing: Switch(
                            value: controller.isSafeModeEnabled.value,
                            onChanged: (value) {
                              controller.toggleSafeMode();
                            },
                          ),
                        )),
                    const SizedBox(height: TSizes.spaceBtwItems),

                    // HD Image Quality Switch with GetX
                    Obx(() => ProfileListTile(
                          icon: Iconsax.image,
                          title: 'HD Image Quality',
                          subtitle: 'Set image quality to HD',
                          trailing: Switch(
                            value: controller.isHDQualityEnabled.value,
                            onChanged: (value) {
                              controller.toggleHDQuality();
                            },
                          ),
                        )),
                    const SizedBox(height: TSizes.spaceBtwItems),
                  ],
                ),
              ),
            ]),
          ),
        ],
      ),
    );
  }
}
