
import 'package:computer_store/common/widgets/appbar/appbar_widget.dart';
import 'package:computer_store/features/shop/screens/orders/widget/order_list.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UAppBar(title: Text('My Orders', style: Theme.of(context).textTheme.headlineSmall,), showBackArrow: true,),
      body: const Padding(
        padding: EdgeInsets.all(USizes.defualtSpece),
        child: UOrderListItem(),
      ),
    );
  }
}