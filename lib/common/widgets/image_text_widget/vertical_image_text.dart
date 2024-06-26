import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UVerticallmageText extends StatelessWidget {
  const UVerticallmageText({
    super.key,
    this.textColor = UColors.white,
    this.backGroundColor = UColors.white,
    required this.title,
    this.onTap,
    required this.image,
  });

  final Color textColor;
  final Color? backGroundColor;
  final String title, image;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: USizes.spaceBtwItem),
        child: Column(
          children: [
            Container(
              width: 56,
              height: 56,
              padding:  const EdgeInsets.all(USizes.sm),
              decoration: BoxDecoration(
                color: backGroundColor,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Center(
                child: Image.network(
                  image,
                  fit: BoxFit.cover,
                  width: 56,
                  height: 56,
                ),
              ),
            ),
            const SizedBox(height: USizes.spaceBtwItem / 2),
            SizedBox(
                width: 55,
                child: Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .labelMedium!
                      .apply(color: textColor),
                      textAlign:TextAlign.center,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                )),
          ],
        ),
      ),
    );
  }
}
