import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class SimilarDishes extends StatelessWidget {
  const SimilarDishes({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          7,
          (index) => Container(
            padding: const EdgeInsets.all(20),
            margin: const EdgeInsets.only(right: 10),
            decoration: BoxDecoration(
              color: const Color.fromRGBO(31, 33, 44, 1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Row(
              children: [
                Image.asset('images/biryani.png', width: 75, height: 75),
                const Gap(10),
                Column(
                  children: [
                    Text(
                      'Veg Biryani',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    const Gap(5),
                    Text(
                      'Nair Nosh',
                      style: Theme.of(
                        context,
                      ).textTheme.bodySmall!.copyWith(color: Colors.grey),
                    ),
                    const Gap(5),
                    Text(
                      '\$5.50',
                      style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: AppColors.secondaryText,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
