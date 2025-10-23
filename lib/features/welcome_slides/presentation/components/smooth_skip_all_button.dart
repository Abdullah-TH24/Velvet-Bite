import 'package:flutter/material.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/welcome_slides/presentation/screens/data/slides_data.dart';

class SmoothSkipAllButton extends StatelessWidget {
  const SmoothSkipAllButton({
    super.key,
    required this.currentPage,
    required PageController controller,
  }) : _controller = controller;

  final int currentPage;
  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedSwitcher(
      duration: const Duration(milliseconds: 300),
      switchInCurve: Curves.easeInOut,
      switchOutCurve: Curves.easeInOut,
      transitionBuilder: (child, animation) =>
          FadeTransition(opacity: animation, child: child),
      child: (currentPage != 2)
          ? Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: TextButton(
                onPressed: () {
                  _controller.animateToPage(
                    slides.length - 1,
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.ease,
                  );
                },
                style: TextButton.styleFrom(
                  overlayColor: AppColors.primaryText,
                  surfaceTintColor: AppColors.primaryText,
                ),
                child: Text(
                  'Skip All',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            )
          : Container(),
    );
  }
}
