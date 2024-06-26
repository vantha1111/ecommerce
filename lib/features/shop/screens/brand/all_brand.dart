import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/common/widgets/layouts/grid_layout.dart';
import 'package:computer_store/common/widgets/products/products_card/brand_card.dart';
import 'package:computer_store/common/widgets/texts/section_heading.dart';
import 'package:computer_store/features/shop/models/function/fatch_brand.dart';
import 'package:computer_store/features/shop/models/shop/brand_model.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class AllBrands extends StatelessWidget {
  const AllBrands({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const UAppBar(title: Text('Brand'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(USizes.defualtSpece),
          child: Column(
            children: [
              //heading
              const USectionHeading(
                title: 'Brands',
                showActionButton: false,
              ),
              const SizedBox(height: USizes.spaceBtwItem),

              //brands
              FutureBuilder<List<BrandModel>>(
                future: BrandService().fetchBrand(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(child: CircularProgressIndicator());
                  } else if (snapshot.hasError) {
                    return Center(child: Text('Error: ${snapshot.error}'));
                  } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                    return const Center(child: Text('No brands found'));
                  } else {
                    return UGridLayout(
                      itemCount: snapshot.data!.length,
                      mainAxisExtent: 80,
                      itemBuilder: (_, index) {
                        return UBrandCard(
                          showBorder: false,
                          brand: snapshot.data![index],
                        );
                      },
                    );
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
