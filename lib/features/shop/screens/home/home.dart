import 'package:computer_store/common/widgets/custom_shapes/container/primary_container.dart';
import 'package:computer_store/common/widgets/custom_shapes/container/search_container.dart';
import 'package:computer_store/common/widgets/layouts/grid_layout.dart';
import 'package:computer_store/common/widgets/products/products_card/product_card_vertical.dart';
import 'package:computer_store/common/widgets/texts/section_heading.dart';
import 'package:computer_store/features/shop/models/function/fetch_product.dart';
import 'package:computer_store/features/shop/screens/all_product/all_product.dart';
import 'package:computer_store/features/shop/screens/home/widgets/home_appbar.dart';
import 'package:computer_store/features/shop/screens/home/widgets/home_categories.dart';
import 'package:computer_store/features/shop/screens/home/widgets/promo_slider.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:computer_store/data/services/shop/products.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Future<List<Data>> futureProducts;
  late String searchText = '';

  @override
  void initState() {
    super.initState();
    futureProducts = ProductService().fetchProducts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            UPrimaryHeaderContainer(
              child: Column(
                children: [
                  //AppBar
                  const UHomeAppBar(),
                  const SizedBox(height: USizes.spacebtwSection),

                  USearchContainer(
                    onTap: () {
                      // Handle search functionality here
                    }, hintText: 'Search in Store',
                  ),
                  const SizedBox(height: USizes.spacebtwSection),

                  // Categories
                  const Padding(
                    padding: EdgeInsets.only(left: USizes.defualtSpece),
                    child: Column(
                      children: [
                        USectionHeading(
                            title: 'Popular Categories',
                            showActionButton: false,
                            textColor: UColors.white),
                        SizedBox(height: USizes.spaceBtwItem),

                        //categories
                        UHomeCategoies()
                      ],
                    ),
                  ),
                  SizedBox(height: USizes.spacebtwSection),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(USizes.defualtSpece),
              child: Column(
                children: [
                  const UPromoSlider(banners: [
                    UImages.promoBanner1,
                    UImages.promoBanner2,
                    UImages.promoBanner3
                  ]),
                  const SizedBox(height: USizes.spacebtwSection),

                  USectionHeading(
                    title: 'Popular Products',
                    onPressed: () => Get.to(() => const AllProducts()),
                  ),
                  const SizedBox(height: USizes.spaceBtwItem),

                  // Fetch and display popular products
                  FutureBuilder<List<Data>>(
                    future: futureProducts,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const CircularProgressIndicator();
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const Text('No products found');
                      } else {
                        final products = snapshot.data!;
                        return UGridLayout(
                          itemCount: products.length,
                          itemBuilder: (_, index) =>
                              UProductCardVertical(product: products[index]),
                        );
                      }
                    },
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
