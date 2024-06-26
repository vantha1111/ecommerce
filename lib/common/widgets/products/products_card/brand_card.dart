import 'package:computer_store/common/widgets/custom_shapes/container/rounded_container.dart';
import 'package:computer_store/common/widgets/images/cricular_image.dart';
import 'package:computer_store/common/widgets/texts/brand_title_text_verified_icon.dart';
import 'package:computer_store/features/shop/models/shop/brand_model.dart';
import 'package:computer_store/utils/constants/enums.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class UBrandCard extends StatelessWidget {
  const UBrandCard({
    super.key, 
    required this.showBorder, 
    this.onTap, 
    required this.brand, 
  });

  final bool showBorder;  
  final void Function()? onTap;
  final BrandModel brand;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: URoundedContainer(
        padding: const EdgeInsets.all(USizes.sm),
        showBorder: showBorder,
        backgroundColor: Colors.transparent,
        child: Row(
          children: [
            //Icon
            Flexible(
              child: UCricularImage(
                image: brand.logoUrl ?? '',
                isNetworkImage: true,
              ),
            ),
            const SizedBox(height: USizes.spaceBtwItem / 2),
    
            // text
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  UBrandtitlewithverifiedIcon(title: brand.name ?? '', brandTextSize: TextSizes.large),
                  Text(
                    '256 Products with ajlkafa',
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
            ),
          ], 
        ),
      ),
    );
  }
}