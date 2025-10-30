import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/dishes/presentation/components/buy_buttons.dart';
import 'package:velvet_bite/features/dishes/presentation/components/choose_size_dish.dart';
import 'package:velvet_bite/features/dishes/presentation/components/custom_icon.dart';
import 'package:velvet_bite/features/dishes/presentation/components/similar_dishes.dart';
import 'package:velvet_bite/features/dishes/presentation/components/title_with_desc.dart';

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
      body: SizedBox(
        width: Get.width,
        child: ListView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            Stack(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                            style: Theme.of(
                              context,
                            ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                          ),
                        ],
                      ),
                      const TitleWithDesc(
                        title: 'Restaurant',
                        description: 'Nair Nosh',
                      ),
                      const TitleWithDesc(
                        title: 'Price',
                        description: '\$7.50',
                        thickDesc: false,
                      ),
                      const Gap(30),
                      Text(
                        'Quantity',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                      ),
                      const Gap(10),
                      Row(
                        children: [
                          CustomIcon(icon: Icons.remove, onTap: () {}),
                          const Gap(10),
                          const Text('02'),
                          const Gap(10),
                          CustomIcon(icon: Icons.add, onTap: () {}),
                        ],
                      ),
                      const Gap(20),
                      const ChooseSizeDish(),
                      const Gap(20),
                      Text(
                        'Hyderabadi Biryani is a culinary masterpiece that tantalizes the senses with its aromatic spices, tender meat and fragrant basmati rice. Originating from the vibrant city of the Hyderabad in India, this iconic dish',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                      const Gap(20),
                      Text(
                        'Similar Dishes',
                        style: Theme.of(
                          context,
                        ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                      ),
                      const Gap(10),
                      const SimilarDishes(),
                      const Gap(15),
                      const BuyButtons(),
                    ],
                  ),
                ),
                PositionedDirectional(
                  top: 0,
                  end: 0,
                  child: Image.asset(
                    'images/biryani.png',
                    width: 265,
                    height: 265,
                    fit: BoxFit.cover,
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
