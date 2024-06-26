
import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/common/widgets/products/sortable/sortable_product.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';


class AllProducts extends StatelessWidget {
  const AllProducts({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: UAppBar(title: Text('Popular Products'), showBackArrow: true),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(USizes.defualtSpece),
          child: USortableProducts(),
        ),
      ),
    );
  }
}

