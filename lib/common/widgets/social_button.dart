import 'package:computer_store/utils/constants/image_strings.dart';
import 'package:computer_store/utils/constants/sizes.dart';
import 'package:flutter/material.dart';

class USocialButton extends StatelessWidget {
  const USocialButton({super.key});

  @override
  Widget build(BuildContext context) {
    return  Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: USizes.iconMd,
                        height: USizes.iconMd,
                        image: AssetImage(UImages.google)
                      ),
                    ),
                  ),
                  const SizedBox(width: USizes.spaceBtwItem),
                   Container(
                    decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10)),
                    child: IconButton(
                      onPressed: () {},
                      icon: const Image(
                        width: USizes.iconMd,
                        height: USizes.iconMd,
                        image: AssetImage(UImages.facebook),
                      ),
                    ),
                  ),
                ],
              );
  }
}