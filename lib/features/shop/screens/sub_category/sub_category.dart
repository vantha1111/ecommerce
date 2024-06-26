
import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/common/widgets/images/rounded_image.dart';
import 'package:computer_store/common/widgets/products/products_card/product_card_hoizontal.dart';
import 'package:computer_store/common/widgets/texts/section_heading.dart';
import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UAppBar(title: Text('Sports'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defualtSpece),
          child: Column(
            children: [
              //banner
              const URoundedImage(width: double.infinity, imageUrl: UImages.appLogo, applyImageRadius: true ),
              const SizedBox(width: USizes.spacebtwSection),

              Column(
                children: [
                  USectionHeading(title: 'Sports Shirts', onPressed: (){}),
                  const SizedBox(width: USizes.spaceBtwItem / 2),

                  SizedBox(
                    height: 120,
                    child: ListView.separated(
                      itemCount: 6,
                      scrollDirection: Axis.horizontal,
                      separatorBuilder: (context, index) => const SizedBox(width: USizes.spaceBtwItem),
                      itemBuilder: (context, index) => const UProductCardHorizaontal()
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}