import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TitleWithDesc extends StatelessWidget {
  final String title;
  final String description;
  final bool thickDesc;
  const TitleWithDesc({
    super.key,
    required this.title,
    required this.description,
    this.thickDesc = true,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(30),
        Text(
          title,
          style: Theme.of(
            context,
          ).textTheme.bodySmall!.copyWith(color: Colors.grey),
        ),
        Text(
          description,
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
            fontWeight: (thickDesc) ? FontWeight.bold : null,
          ),
        ),
      ],
    );
  }
}
