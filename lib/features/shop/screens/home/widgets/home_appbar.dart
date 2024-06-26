
import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/text_strings.dart';
import 'package:flutter/material.dart';

class UHomeAppBar extends StatelessWidget {
  const UHomeAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UAppBar(title: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(UTexts.appBarTitle, style: Theme.of(context).textTheme.labelMedium!.apply(color: UColors.grey)),
        Text(UTexts.appBarSubtitle, style: Theme.of(context).textTheme.headlineSmall!.apply(color: UColors.white)),
      ],
    ),
    actions: [
      UCartCounterIcon(onPressed: () {}, iconColor: UColors.white,)
    ],
    );
  }
}
