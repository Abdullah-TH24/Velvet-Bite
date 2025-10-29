import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class DishDetails extends StatelessWidget {
  const DishDetails({super.key});

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
        title: Text('Details', style: Theme.of(context).textTheme.bodySmall),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_outline),
          ),
        ],
      ),
      body: Container(
        width: Get.width,
        child: ListView(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hyderabadi Biryani',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.star,
                              color: Color(0xffFEC62E),
                              size: 15,
                            ),
                            const Gap(5),
                            Text(
                              '4.9',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(color: Colors.grey),
                            ),
                          ],
                        ),
                        const Gap(30),
                        Text(
                          'Restaurant',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                        ),
                        Text(
                          'Nair Nosh',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Gap(30),
                        Text(
                          'Price',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                        ),
                        Text(
                          '\$7.50',
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        const Gap(30),
                        Text(
                          'Quantity',
                          style: Theme.of(
                            context,
                          ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                        ),
                        Row(
                          children: [
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.remove,
                                color: AppColors.secondaryText,
                              ),
                              style: IconButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    8,
                                  ),
                                ),
                              ),
                            ),
                            const Gap(5),
                            const Text('02'),
                            const Gap(5),
                            IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.add,
                                color: AppColors.secondaryText,
                              ),
                              style: IconButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadiusGeometry.circular(
                                    8,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Container(
                    alignment: Alignment.centerRight,
                    child: Image.asset(
                      'images/biryani.png',
                      width: 320,
                      height: 320,
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
