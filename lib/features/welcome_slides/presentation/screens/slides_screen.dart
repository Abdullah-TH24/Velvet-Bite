import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/core/routes/screens_routes_names.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/welcome_slides/presentation/components/slides_smooth_page_indicator.dart';
import 'package:velvet_bite/features/welcome_slides/presentation/components/slides_widget.dart';
import 'package:velvet_bite/features/welcome_slides/presentation/components/smooth_skip_all_button.dart';
import 'package:velvet_bite/main.dart';

class SlidesScreen extends StatefulWidget {
  const SlidesScreen({super.key});

  @override
  State<SlidesScreen> createState() => _SlidesScreenState();
}

class _SlidesScreenState extends State<SlidesScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_onPageChanged);
  }

  void _onPageChanged() {
    final newPage = _controller.page!.round();
    if (newPage != currentPage) {
      setState(() {
        currentPage = newPage;
      });
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            if (currentPage == 0) {
              Get.close(1);
            } else {
              _controller.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.ease,
              );
              _onPageChanged();
            }
          },
          icon: const Icon(Icons.arrow_back_ios, color: AppColors.primaryText),
        ),
        actions: [
          SmoothSkipAllButton(
            currentPage: currentPage,
            controller: _controller,
          ),
        ],
      ),
      body: ListView(
        physics: const NeverScrollableScrollPhysics(),
        children: [
          SlidesWidget(controller: _controller),
          const Gap(10),
          SlidesSmoothPageIndicator(controller: _controller),
          const Gap(40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: ElevatedButton(
              onPressed: () {
                _controller.nextPage(
                  duration: const Duration(milliseconds: 300),
                  curve: Curves.ease,
                );
                _onPageChanged();
                if (currentPage == 2) {
                  Get.offAllNamed(ScreensRoutesNames.welcomeAuthScreen);
                  prefs.setBool('is_first_run', false);
                }
              },
              style: Theme.of(context).elevatedButtonTheme.style,
              child: const Text('Next'),
            ),
          ),
        ],
      ),
    );
  }
}
