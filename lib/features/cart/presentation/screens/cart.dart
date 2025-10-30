import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primaryText,
        leading: IconButton(
          onPressed: () {
            Get.close(1);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
        title: Text('Cart', style: Theme.of(context).textTheme.bodyMedium),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(31, 33, 44, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/biryani.png', width: 100, height: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Biryani Food',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(15),
                      Text(
                        'Price: \$7.21',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(),
                    icon: const Icon(
                      Icons.delete_outline,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
            const Gap(10),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: const Color.fromRGBO(31, 33, 44, 1),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset('images/biryani.png', width: 100, height: 100),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Biryani Food',
                        style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Gap(15),
                      Text(
                        'Price: \$7.21',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(),
                    icon: const Icon(
                      Icons.delete_outline,
                      color: AppColors.secondaryText,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: ListTile(
        tileColor: const Color.fromRGBO(31, 33, 44, 1),
        contentPadding: const EdgeInsets.all(20),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.only(
            topLeft: Radius.circular(8),
            topRight: Radius.circular(8),
          ),
        ),
        title: Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: Text(
            'Total amount',
            style: Theme.of(
              context,
            ).textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.bold),
          ),
        ),
        subtitle: Text(
          '\$14.42',
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: Colors.grey),
        ),
        trailing: ElevatedButton(
          onPressed: () {},
          style: ElevatedButton.styleFrom(fixedSize: const Size(120, 35)),
          child: Text('Ckeckout', style: Theme.of(context).textTheme.bodySmall),
        ),
      ),
    );
  }
}
