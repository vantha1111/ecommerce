import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/common/widgets/custom_shapes/curved_edges/curves_edges_widget.dart';
import 'package:computer_store/common/widgets/icons/cricular_icon.dart';
import 'package:computer_store/common/widgets/images/rounded_image.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class UProductImageSlider extends StatelessWidget {
  const UProductImageSlider({
    super.key,
  
  });



  @override
  Widget build(BuildContext context) {
    final dark = UHelper.isDarkMode(context);
    return UCurvedEdgesWidget(
      child: Container(
        color:  dark ? UColors.darGrey :UColors.light,
        child: Stack(
          children: [
            //Main large image
            const SizedBox(height: 400,child: Padding(
              padding: EdgeInsets.all(USizes.productImageRadiue * 2),
              child: Center(child: Image(image: AssetImage(UImages.productImage1))),
              ),
            ),
    
            //image slider
            Positioned(
              right: 0,
              bottom: 30,
              left: USizes.defualtSpece,
              child: SizedBox(
                height: 80,
                child: ListView.separated(
                  separatorBuilder: (_, __) => const SizedBox(width: USizes.spaceBtwItem), 
                  itemCount: 4, 
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  physics: const AlwaysScrollableScrollPhysics(),
                  itemBuilder: (_, index) => URoundedImage(
                  width: 80,
                  backgroundColor: dark ? UColors.dark :UColors.white,
                  border: Border.all(color: UColors.primary),
                  padding: const EdgeInsets.all(USizes.sm),
                  imageUrl: UImages.productImage2,
                  ),
                ),
              ),
            ),
    
            // appbar icons
            const UAppBar(
              showBackArrow: true,
              actions: [UCricularIcon(icon: Iconsax.heart5, color: Colors.red,)],
            )
          ],
        ),
      ),
    );
  }
}