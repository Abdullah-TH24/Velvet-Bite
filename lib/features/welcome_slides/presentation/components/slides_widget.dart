import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:get/get.dart';
import 'package:velvet_bite/features/welcome_slides/presentation/screens/data/slides_data.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SlidesWidget extends StatelessWidget {
  const SlidesWidget({super.key, required PageController controller})
    : _controller = controller;

  final PageController _controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height - 250,
      width: Get.width,
      padding: const EdgeInsets.only(top: 50),
      child: PageView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: slides.length,
        itemBuilder: (context, index) => Column(
          children: [
            SvgPicture.asset(slides[index].image, width: 250),
            const Gap(75),
            Text(
              slides[index].title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const Gap(25),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Text(
                slides[index].description,
                style: Theme.of(context).textTheme.bodySmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
