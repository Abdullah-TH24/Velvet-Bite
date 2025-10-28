import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:gap/gap.dart';
import 'package:velvet_bite/core/di/injection_container.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/home/presentation/components/custom_widget_title.dart';
import 'package:velvet_bite/features/home/presentation/components/popular_food.dart';
import 'package:velvet_bite/features/home/presentation/components/search_field.dart';
import 'package:velvet_bite/features/home/presentation/components/special_offer.dart';
import 'package:velvet_bite/features/home/presentation/cubit/home_cubit.dart';
import 'package:velvet_bite/main.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final cubit = HomeCubit(AppDependencies.getUserInfoAndProductsUseCase);
        cubit.getUserInfoAndProductsUseCase(token: prefs.getString('token')!);
        return cubit;
      },
      child: BlocBuilder<HomeCubit, HomeState>(
        builder: (context, state) {
          if (state is HomeLoading) {
            return const Scaffold(
              extendBody: true,
              body: Center(
                child: SpinKitFadingCircle(
                  color: AppColors.secondaryText,
                  size: 50.0,
                ),
              ),
            );
          } else if (state is HomeLoaded) {
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
                            state.fullName,
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
                    const SearchField(),
                    // special Offers Title & Button
                    const CustomWidgetTitle(
                      widgetTitle: 'Special Offers',
                      buttonTitle: 'See more...',
                    ),
                    // special Offers Body
                    SpecialOffer(state: state),
                    // Products Types
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: List.generate(
                            5,
                            (index) => Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15,
                                vertical: 10,
                              ),
                              child: Column(
                                children: [
                                  Image.asset('images/hamburger.png'),
                                  Text(
                                    'Burger',
                                    style: Theme.of(
                                      context,
                                    ).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Weekly Special Title & Button
                    const CustomWidgetTitle(
                      widgetTitle: 'Popular Food',
                      buttonTitle: 'See all',
                    ),
                    // Weekly Special body
                    PopularFood(state: state),
                  ],
                ),
              ),
            );
          } else if (state is HomeError) {
            return Scaffold(
              extendBody: true,
              body: Padding(
                padding: const EdgeInsets.all(20),
                child: Center(
                  child: Text(
                    'Please check your internet connection and try again later ${state.message}',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            );
          } else {
            return const Scaffold();
          }
        },
      ),
    );
  }
}
