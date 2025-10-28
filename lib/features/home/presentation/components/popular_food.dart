import 'package:flutter/material.dart';
import 'package:velvet_bite/core/api/base_ip.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/home/presentation/cubit/home_cubit.dart';

class PopularFood extends StatelessWidget {
  final HomeLoaded state;
  const PopularFood({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 20,
        mainAxisSpacing: 20,
        mainAxisExtent: 200,
      ),
      itemCount: state.popularFood.length,
      itemBuilder: (context, index) => Stack(
        children: [
          Container(
            height: 200,
            margin: const EdgeInsets.only(top: 50),
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.primaryText,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 4,
                  child: Text(
                    state.popularFood[index].dishName!,
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.background,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: (state.popularFood[index].dishOffer != 0)
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              '\$${state.popularFood[index].dishPrice}',
                              style: Theme.of(context).textTheme.bodySmall!
                                  .copyWith(
                                    color: AppColors.background.withAlpha(100),
                                    fontWeight: FontWeight.bold,
                                    decoration: TextDecoration.lineThrough,
                                    decorationColor: Colors.red,
                                  ),
                              textAlign: TextAlign.end,
                            ),
                            Text(
                              '\$${double.parse(state.popularFood[index].dishPrice!) - ((double.parse(state.popularFood[index].dishPrice!) * state.popularFood[index].dishOffer!) / 100)}',
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: AppColors.secondaryText,
                                    fontWeight: FontWeight.bold,
                                  ),
                              textAlign: TextAlign.end,
                            ),
                          ],
                        )
                      : Text(
                          '\$${state.popularFood[index].dishPrice}',
                          style: Theme.of(context).textTheme.bodyMedium!
                              .copyWith(
                                color: AppColors.secondaryText,
                                fontWeight: FontWeight.bold,
                              ),
                          textAlign: TextAlign.end,
                        ),
                ),
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            child: SizedBox(
              height: 140,
              width: 140,
              child: Image.network(
                'http://${BaseIp.baseIp}/velvet_bite/${state.popularFood[index].dishImage}',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
