import 'dart:ui';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
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
      extendBody: true,
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
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
            // special Offers Title & Button
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
                        width: Get.width,
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
                                const Expanded(
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Text(
                                          '30%',
                                          style: TextStyle(
                                            fontSize: 65,
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
                viewportFraction: 1,
                aspectRatio: 2.0,
                initialPage: 1,
                height: 180,
              ),
            ),
            // Products Types
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(
                    5,
                    (index) => Padding(
                      padding: const EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Image.asset('images/hamburger.png'),
                          Text(
                            'Burger',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Weekly Special Title & Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Weekly Special',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                TextButton(
                  onPressed: () {},
                  style: TextButton.styleFrom(
                    overlayColor: AppColors.secondaryText,
                    surfaceTintColor: AppColors.secondaryText,
                  ),
                  child: Text(
                    'See all',
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.secondaryText,
                    ),
                  ),
                ),
              ],
            ),
            // Weekly Special body
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
                mainAxisExtent: 200,
              ),
              itemCount: 8,
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
                            'BBQ Chicken',
                            style: Theme.of(context).textTheme.bodyMedium!
                                .copyWith(color: AppColors.background),
                          ),
                        ),
                        Expanded(
                          flex: 3,
                          child: Text(
                            '\$11.98',
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
                    child: Container(
                      height: 140,
                      width: 140,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: AssetImage('images/chicken.png'),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class GlassBottomNavBar extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const GlassBottomNavBar({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(8),
        topRight: Radius.circular(8),
      ),
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaX: 7.5, sigmaY: 7.5),
        child: Container(
          height: 85,
          decoration: BoxDecoration(
            color: AppColors.background.withAlpha(0),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withAlpha(100),
                offset: const Offset(0, 0),
              ),
            ],
          ),
          child: Center(
            child: BottomNavigationBar(
              iconSize: 27.5,
              type: BottomNavigationBarType.fixed,
              backgroundColor: Colors.transparent,
              elevation: 0,
              currentIndex: currentIndex,
              selectedItemColor: AppColors.secondaryText,
              unselectedItemColor: AppColors.primaryText,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.home_outlined),
                  ),
                  label: '',
                  tooltip: 'Home',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.email_outlined),
                  ),
                  label: '',
                  tooltip: 'Email',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.person_2_outlined),
                  ),
                  label: '',
                  tooltip: 'Profile',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.settings_outlined),
                  ),
                  label: '',
                  tooltip: 'Settings',
                ),
                BottomNavigationBarItem(
                  icon: IconButton(
                    onPressed: () {},
                    icon: const Icon(Icons.shopping_basket_outlined),
                  ),
                  label: '',
                  tooltip: 'Cart',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
