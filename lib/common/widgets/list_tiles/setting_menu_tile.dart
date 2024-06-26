
import 'package:computer_store/utils/constants/color.dart';
import 'package:flutter/material.dart';


class USettingMenuTile extends StatelessWidget {
  const USettingMenuTile({super.key, 
  required this.icon, 
  required this.title, 
  this.trailing, 
  required this.subTitle, 
  this.onTop});

  final IconData icon;
  final String title, subTitle;
  final Widget? trailing;
  final VoidCallback? onTop;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, size: 28,color: UColors.primary),
      title: Text(title, style: Theme.of(context).textTheme.titleMedium),
      subtitle: Text(subTitle, style: Theme.of(context).textTheme.labelMedium),
      trailing: trailing,
      onTap: onTop,
    );
  }
}