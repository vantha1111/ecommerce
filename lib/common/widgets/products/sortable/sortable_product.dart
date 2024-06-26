
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class USortableProducts extends StatelessWidget {
  const USortableProducts({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        //dropdown
        DropdownButtonFormField(
          decoration: const InputDecoration(prefixIcon: Icon(Iconsax.sort)),                
          onChanged: (value) {},
          items: ['Name','Newesr','popularity','low Price']
          .map((option) => DropdownMenuItem( value: option, child: Text(option)))
          .toList(),
        ),
        const SizedBox(height: USizes.spacebtwSection),
        // UGridLayout(itemCount: 4, itemBuilder: (_, index) => const UProductCardVertical())
      ],
    );
  }
}