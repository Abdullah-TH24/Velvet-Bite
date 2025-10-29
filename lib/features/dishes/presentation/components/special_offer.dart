import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/api/base_ip.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/dishes/presentation/components/custom_shape.dart';
import 'package:velvet_bite/features/dishes/presentation/cubit/dishes_cubit.dart';

class SpecialOffer extends StatelessWidget {
  final DishesLoaded state;
  const SpecialOffer({super.key, required this.state});

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: state.specialOffer.length,
      itemBuilder: (BuildContext context, int itemIndex, int pageViewIndex) =>
          Container(
            width: Get.width,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: AppColors.secondaryText,
            ),
            child: Stack(
              children: [
                const CustomShape(size: 100, bottom: -20, left: 20),
                const CustomShape(size: 50, top: -20, left: 75),
                Row(
                  children: [
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text(
                              '${state.specialOffer[itemIndex].dishOffer}%',
                              style: const TextStyle(
                                fontSize: 65,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              'off from\n${state.specialOffer[itemIndex].dishName!.toLowerCase()}',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        alignment: Alignment.centerRight,
                        child: Image.network(
                          'http://${BaseIp.baseIp}/velvet_bite/${state.specialOffer[itemIndex].dishImage}',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
      options: CarouselOptions(
        autoPlay: true,
        enlargeCenterPage: true,
        viewportFraction: 1,
        aspectRatio: 2.0,
        initialPage: 1,
        height: 180,
      ),
    );
  }
}
