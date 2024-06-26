
import 'package:computer_store/common/widgets/texts/section_heading.dart';
import 'package:computer_store/features/shop/screens/product_details/widget/button_add_to_cart_widget.dart';
import 'package:computer_store/features/shop/screens/product_details/widget/product_attributes.dart';
import 'package:computer_store/features/shop/screens/product_details/widget/product_details_image_slider.dart';
import 'package:computer_store/features/shop/screens/product_details/widget/product_meta_data.dart';
import 'package:computer_store/features/shop/screens/product_details/widget/rating_and_share.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:readmore/readmore.dart';


class ProductDetailScreen extends StatelessWidget {
  const ProductDetailScreen ({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      bottomNavigationBar: const UButtonAddtoCart(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // product image slider
            const UProductImageSlider(),

            //product details
            Padding(
              padding: const EdgeInsets.only(right: USizes.defualtSpece, left: USizes.defualtSpece, bottom: USizes.defualtSpece),
              child: Column(
                children: [
                  //Rating and share button
                  const URatingAndShare(),
                  //price title stock brand
                  const UProductMetaData(),
                  // attrivutes
                  const UProductAttribates(),
                  const SizedBox(height: USizes.spacebtwSection),
                  // cheackout button 
                  SizedBox(width: double.infinity, child: ElevatedButton(onPressed: (){}, child: Text('Checkout'))),
                  // description
                  const USectionHeading(title: 'Description', showActionButton: false),
                  const SizedBox(height: USizes.spaceBtwItem),
                  const ReadMoreText(
                    '',
                    trimLines: 2,
                    trimMode: TrimMode.Line,
                    trimCollapsedText: 'Show more',
                    trimExpandedText: 'less',
                    moreStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                    lessStyle: TextStyle(fontSize: 14, fontWeight: FontWeight.w800),
                  ),
                  // reviews
                  const Divider(),
                  const SizedBox(height: USizes.spaceBtwItem),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const USectionHeading(title: 'Review 199', showActionButton: false),
                      IconButton(onPressed: (){}, icon: const Icon(Iconsax.activity))
                    ],
                  ),
                  const SizedBox(height: USizes.spacebtwSection),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}



