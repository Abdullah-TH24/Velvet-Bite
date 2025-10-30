import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/routes/screens_routes_names.dart';

class BuyButtons extends StatelessWidget {
  const BuyButtons({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ElevatedButton.icon(
          onPressed: () {
            Get.toNamed(ScreensRoutesNames.cart);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color.fromRGBO(31, 33, 44, 1),
          ),
          label: const Text('Add to Cart'),
          icon: const Icon(Icons.shopping_cart_outlined),
        ),
        const Gap(10),
        ElevatedButton.icon(
          onPressed: () {},
          label: const Text('Order Now'),
          icon: const Icon(Icons.shopping_bag_outlined),
        ),
      ],
    );
  }
}
