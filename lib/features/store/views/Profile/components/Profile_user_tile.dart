import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:t_store/Screens/login/login_page.dart';
import 'package:t_store/common/widgets/appBar.dart';
import 'package:t_store/common/widgets/components/TCategories.dart';
import 'package:t_store/common/widgets/image/circularImage.dart'; 
import 'package:t_store/features/store/views/Profile/Listitle.dart'; 
import 'package:t_store/utility/constants/images_strings.dart';
import 'package:t_store/utility/constants/size.dart';

class ProfileUserTile extends StatelessWidget {
  const ProfileUserTile({super.key});

  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        showBackArrow: true,
        title: Text(
          'Profile',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () => _showLogoutDialog(context),
            icon: const Icon(Iconsax.logout),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const Center(
                child: CircularImage(
                  image: TImages.user,
                  height: 150,
                  width: 150,
                ),
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TCategories(
                      title: 'Profile Information',
                      showActionButton: false,
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections - 10),
              ProfileListTile(
                icon: Iconsax.user,
                title: 'Name',
                subtitle: 'Sujeet Chakradhar',
                trailing: const Icon(Iconsax.arrow_right_3),
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              ProfileListTile(
                icon: Iconsax.user,
                title: 'Username',
                subtitle: 'Sujeet chakradhar',
                trailing: const Icon(Iconsax.arrow_right_3),
                onPressed: () {},
              ),
              const SizedBox(height: 20),
              const Row(
                children: [
                  Expanded(
                    child: Divider(thickness: 1),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
                    child: TCategories(
                      title: 'Personal Information',
                      showActionButton: false,
                    ),
                  ),
                  Expanded(
                    child: Divider(thickness: 1),
                  ),
                ],
              ),
              const SizedBox(height: TSizes.spaceBtwSections - 10),
              ProfileListTile(
                icon: Iconsax.user_tag,
                title: 'User Id',
                subtitle: '128455',
                trailing: const Icon(Iconsax.copy),
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              ProfileListTile(
                icon: Iconsax.messages_15,
                title: 'E-mail',
                subtitle: 'Sujeetchakradhar123@gmail.com',
                trailing: const Icon(Iconsax.arrow_right_3),
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              ProfileListTile(
                icon: Iconsax.mobile,
                title: 'Phone Number',
                subtitle: '9766512419',
                trailing: const Icon(Iconsax.arrow_right_3),
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              ProfileListTile(
                icon: Iconsax.group,
                title: 'Gender',
                subtitle: 'Male',
                trailing: const Icon(Iconsax.arrow_right_3),
                onPressed: () {},
              ),
              const SizedBox(height: 10),
              ProfileListTile(
                icon: Iconsax.location,
                title: 'Address',
                subtitle: 'Bhaktapur',
                trailing: const Icon(Iconsax.arrow_right_3),
                onPressed: () {},
              ),
              const SizedBox(height: TSizes.spaceBtwSections),
              const Divider(thickness: 1),
              const SizedBox(height: TSizes.spaceBtwSections),
              Center(
                child: TextButton(
                  onPressed: () {},
                  child: const Text(
                    'Close Account',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Are you sure you want to log out?'),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                TextButton(
                  onPressed: () => Navigator.pop(context), // Close the dialog
                  child: const Text('Cancel'),
                ),
                TextButton(
                  onPressed: () {
                                                            Navigator.pop(context); // Close the dialog

                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const  LoginPage()));// Navigate to login page

                  },
                  child: const Text('Confirm'),
                ),
              ],
            ),
          ],
        );
      },
    );
  }