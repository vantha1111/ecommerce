import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/common/widgets/appbar/tabbar.dart';

import 'package:computer_store/common/widgets/custom_shapes/container/search_container.dart';

import 'package:computer_store/common/widgets/layouts/grid_layout.dart';
import 'package:computer_store/common/widgets/products/cart/cart_menu_icon.dart';
import 'package:computer_store/common/widgets/products/products_card/brand_card.dart';

import 'package:computer_store/common/widgets/texts/section_heading.dart';
import 'package:computer_store/data/services/shop/categories.dart';
import 'package:computer_store/features/shop/models/cart/cart_model.dart';
import 'package:computer_store/features/shop/models/cart/fetch_cart.dart';
import 'package:computer_store/features/shop/models/function/fatch_brand.dart';
import 'package:computer_store/features/shop/models/function/fatch_catagories.dart';
import 'package:computer_store/features/shop/models/shop/brand_model.dart';
import 'package:computer_store/features/shop/screens/brand/all_Brand.dart';
import 'package:computer_store/features/shop/screens/store/widget/category_tab.dart';
import 'package:computer_store/utils/constants/color.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:computer_store/utils/device/device_utility.dart';
import 'package:computer_store/utils/helpers/helper_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class StoreSrceen extends StatefulWidget {
  const StoreSrceen({super.key});



  @override
  _StoreScreenState createState() => _StoreScreenState();
}

class _StoreScreenState extends State<StoreSrceen> {
  late Future<List<BrandModel>> futureBrands;
  late Future<List<Categories>> futureCategories;
  late Future<CartModel> futureCart;

  @override
  void initState() {
    super.initState();
    futureBrands = BrandService().fetchBrand();
    futureCategories = CateService().fetchCategories();
    futureCart = CartService().fetchCart();
  }

  

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: UAppBar(
          title:
              Text('Store', style: Theme.of(context).textTheme.headlineMedium),
          actions: [
             UCartCounterIcon(onPressed: () {}, iconColor: UColors.black,),
          ],
        ),
        body: NestedScrollView(
          headerSliverBuilder: (_, innerBoxIsScrolled) {
            return [
              SliverAppBar(
                automaticallyImplyLeading: false,
                pinned: true,
                floating: true,
                backgroundColor:
                    UHelper.isDarkMode(context) ? UColors.black : UColors.white,
                expandedHeight: 440,
                flexibleSpace: Padding(
                  padding: const EdgeInsets.all(USizes.defualtSpece),
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: [
                      //search bar
                      const SizedBox(height: USizes.spaceBtwItem),
                      const USearchContainer(
                          showBorder: true,
                          showBackground: false,
                          padding: EdgeInsets.zero, hintText: 'Search on Store',),
                      const SizedBox(height: USizes.spacebtwSection),

                      // frature brand
                      USectionHeading(
                        title: 'Features Brands',
                        onPressed: () => Get.to(() => const AllBrands()),
                      ),
                      const SizedBox(
                        height: USizes.spaceBtwItem / 1.5,
                      ),

                      // Fetch and display Brand
                      FutureBuilder<List<BrandModel>>(
                        future: futureBrands,
                        builder: (context, snapshot) {
                          if (snapshot.connectionState ==
                              ConnectionState.waiting) {
                            return Center(child: CircularProgressIndicator());
                          } else if (snapshot.hasError) {
                            return Center(
                                child: Text('Error: ${snapshot.error}'));
                          } else if (!snapshot.hasData ||
                              snapshot.data!.isEmpty) {
                            return Center(child: Text('No brands found'));
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

                // Tabc
                bottom: PreferredSize(
                  preferredSize: Size.fromHeight(UDeviceUtils.getAppBarHeight()),
                  child: FutureBuilder<List<Categories>>(
                    future: futureCategories,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const TabBar(tabs: []);
                      } else if (snapshot.hasError) {
                        return const TabBar(tabs: []);
                      } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                        return const TabBar(tabs: []);
                      } else {
                        return UTabBar(
                          tabs: snapshot.data!
                              .map((category) => Tab(child: Text(category.name ?? '')))
                              .toList(),
                        );
                      }
                    },
                  ),
                ),
              ),
            ];
          },
          body: FutureBuilder<List<Categories>>(
            future: futureCategories,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              } else if (snapshot.hasError) {
                return Center(child: Text('Error: ${snapshot.error}'));
              } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
                return Center(child: Text('No categories found'));
              } else {
                return TabBarView(
                  children: snapshot.data!.map((category) => UCategoryTab()).toList(),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}
