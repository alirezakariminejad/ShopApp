import 'package:flutter/material.dart';
import 'package:flutter_shop_application/constants/constants.dart';
import 'package:flutter_shop_application/widgets/cached_image.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_shop_application/model/banner_model.dart';

class BannerSlider extends StatelessWidget {
  List<BannerModel> bannerList;
  BannerSlider(this.bannerList, {super.key});

  @override
  Widget build(BuildContext context) {
    var controller = PageController(viewportFraction: 0.84);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        SizedBox(
          height: 175.0,
          child: PageView.builder(
            controller: controller,
            itemCount: bannerList.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: CachedImage(
                  imageUrl: bannerList[index].thumbnail,
                ),
              );
            },
          ),
        ),
        Positioned(
          bottom: 10.0,
          child: SmoothPageIndicator(
            controller: controller, // PageController
            count: 5,
            effect: const ExpandingDotsEffect(
                activeDotColor: shopBlue,
                dotColor: Colors.white,
                spacing: 5.0,
                dotHeight: 10.0,
                dotWidth: 10.0,
                expansionFactor: 5),
          ),
        ),
      ],
    );
  }
}
