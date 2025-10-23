import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:velvet_bite/core/theme/theme.dart';
import 'package:velvet_bite/features/welcome_slides/presentation/screens/data/slides_data.dart';

class SlidesSmoothPageIndicator extends StatelessWidget {
  const SlidesSmoothPageIndicator({
    super.key,
    required PageController controller,
  }) : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SmoothPageIndicator(
        controller: _controller,
        count: slides.length,
        effect: const ExpandingDotsEffect(
          dotColor: AppColors.primaryText,
          activeDotColor: AppColors.secondaryText,
          dotHeight: 7.5,
          dotWidth: 7.5,
          expansionFactor: 5,
        ),
      ),
    );
  }
}
