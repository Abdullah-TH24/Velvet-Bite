import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:velvet_bite/features/dishes/presentation/components/custom_elevated_button.dart';

class ChooseSizeDish extends StatelessWidget {
  const ChooseSizeDish({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CustomElevatedButton(
          order: 0,
          currentOrder: 0,
          text: 'Small',
          onPressed: () {},
        ),
        const Gap(10),
        CustomElevatedButton(
          order: 1,
          currentOrder: 0,
          text: 'Half',
          onPressed: () {},
        ),
        const Gap(10),
        CustomElevatedButton(
          order: 2,
          currentOrder: 0,
          text: 'Full',
          onPressed: () {},
        ),
      ],
    );
  }
}
