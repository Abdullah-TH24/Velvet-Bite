import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:velvet_bite/core/theme/theme.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: AppColors.primaryText,
        leadingWidth: double.maxFinite,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              const CircleAvatar(
                backgroundColor: AppColors.secondaryText,
                child: Icon(Icons.person_4_outlined),
              ),
              const Gap(10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Customer',
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  Text(
                    'Abdullah Hameed',
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_outlined),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.shopping_cart_outlined),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: ListView(
          children: [
            // Search Field
            TextFormField(
              decoration: InputDecoration(
                fillColor: const Color(0xff0E162C),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: BorderRadius.circular(8),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color(0xff858585),
                  size: 30,
                ),
                hintText: 'Search your interesting foods...',
                hintStyle: const TextStyle(color: Color(0xff858585)),
              ),
              cursorColor: const Color(0xff858585),
              style: const TextStyle(color: Color(0xff858585)),
            ),
            // special Offers Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Special Offers',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    overlayColor: AppColors.secondaryText,
                    surfaceTintColor: AppColors.secondaryText,
                  ),
                  child: Text(
                    'See more...',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ),
              ],
            ),
            // special Offers Body
            CarouselSlider.builder(
              itemCount: 5,
              itemBuilder:
                  (BuildContext context, int itemIndex, int pageViewIndex) =>
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          color: AppColors.secondaryText,
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              bottom: -20,
                              left: 20,
                              child: Transform.rotate(
                                angle: 50,
                                child: Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.primaryText.withAlpha(111),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              top: -20,
                              left: 75,
                              child: Transform.rotate(
                                angle: 50,
                                child: Container(
                                  width: 50,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: AppColors.primaryText.withAlpha(111),
                                  ),
                                ),
                              ),
                            ),
                            Row(
                              children: [
                                const Gap(10),
                                const Expanded(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        '30%',
                                        style: TextStyle(
                                          fontSize: 70,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        'off from\nchicken burger',
                                        style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    alignment: Alignment.centerRight,
                                    child: Image.asset('images/special-1.png'),
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
                viewportFraction: 0.9,
                aspectRatio: 2.0,
                initialPage: 1,
                height: 180,
              ),
            ),
            //
          ],
        ),
      ),
    );
  }
}
