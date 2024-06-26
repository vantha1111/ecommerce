
import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/common/widgets/custom_shapes/container/primary_container.dart';
import 'package:computer_store/common/widgets/list_tiles/setting_menu_tile.dart';
import 'package:computer_store/common/widgets/list_tiles/user_profile.dart';
import 'package:computer_store/common/widgets/texts/section_heading.dart';
import 'package:computer_store/features/shop/screens/orders/orders.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            //header
            UPrimaryHeaderContainer(
              child: Column(
                children: [
                  UAppBar(
                    title: Text('Account', style: Theme.of(context).textTheme.headlineMedium!.apply(color: UColors.white))),

                    //Userprofile card
                    const UUserProfile(),
                    const SizedBox(height: USizes.spacebtwSection ),
                  
                ],
              )),

            //body
            Padding(
              padding: const EdgeInsets.all(USizes.defualtSpece),
              child: Column(
                children: [
                  //Account setting
                  const USectionHeading(title: 'Account Setting', showActionButton: false),
                  const SizedBox(height: USizes.spaceBtwItem),

                  const USettingMenuTile(icon: Iconsax.safe_home, title: 'My Addresss', subTitle: 'Set shopping delivery address'),
                  const USettingMenuTile(icon: Iconsax.shopping_cart, title: 'My Cart', subTitle: 'Add, remove products and move checkout'),
                  USettingMenuTile(icon: Iconsax.bag_tick, title: 'My Order', subTitle: 'In-progress and Completed Orders',onTop: () => Get.to(() => const OrderScreen())),
                  const USettingMenuTile(icon: Iconsax.bank, title: 'Bark Account', subTitle: 'Withdraw balance to regidtered bank account'),
                  const USettingMenuTile(icon: Iconsax.discount_shape, title: 'My Coupon', subTitle: 'List of all the discounted coupons'),
                  const USettingMenuTile(icon: Iconsax.notification, title: 'Notification', subTitle: 'Set any kind of notification message'),
                  const USettingMenuTile(icon: Iconsax.security_card, title: 'Account Priavcy', subTitle: 'Manage data Usage and connected accounts'),

                  //App Setting
                  const SizedBox(height: USizes.spacebtwSection),
                  const USectionHeading(title: 'App Setting', showActionButton: false),
                  const SizedBox(height: USizes.spaceBtwItem),
                  const USettingMenuTile(icon: Iconsax.document_upload, title: 'Load Data', subTitle: 'Upload Data to your Cloud Firebase'),
                  USettingMenuTile(
                    icon: Iconsax.location, 
                    title: 'Geolcation', 
                    subTitle: 'Set recommandtion besed on location',
                    trailing: Switch(value: true, onChanged: (value) {}),
                  ),
                  USettingMenuTile(
                    icon: Iconsax.security_card, 
                    title: 'Safe Mode ', 
                    subTitle: 'Search Result id Safe for all ages',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  ),
                  USettingMenuTile(
                    icon: Iconsax.image, 
                    title: 'HD Image Quality', 
                    subTitle: 'Set image Quality to be seen',
                    trailing: Switch(value: false, onChanged: (value) {}),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

