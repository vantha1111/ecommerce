
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/device/device_utility.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';

class UTabBar extends StatelessWidget implements PreferredSizeWidget {
  const UTabBar({super.key, 
  required this.tabs});

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: TabBar(
        tabs: tabs,
        isScrollable: true,
        indicatorColor: UColors.primary ,
        labelColor: UHelper.isDarkMode(context) ? UColors.white : UColors.dark,
        unselectedLabelColor: UColors.darGrey,
        ),
    );
  }
  
  @override
  Size get preferredSize => Size.fromHeight(UDeviceUtils.getAppBarHeight());
}