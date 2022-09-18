import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class SliderCarusel extends StatefulWidget {
  const SliderCarusel({super.key});

  @override
  State<SliderCarusel> createState() => _SliderCaruselState();
}

class _SliderCaruselState extends State<SliderCarusel> {
  final controller = CarouselController();
  int activeIndex = 0;
  final urlImages = [
    //877 x 1080
    'assets/images/home_slider/new_collection_1.jpg',
    'assets/images/home_slider/black_friday_sale.jpg',
    //'assets/images/home_slider/new_collection_2.jpg',
    'assets/images/home_slider/super_sale.jpg',
    //'assets/images/home_slider/clothes.jpg',
    // 'https://firebasestorage.googleapis.com/v0/b/e-commerce-dab1e.appspot.com/o/home_slider_images%2Fhome_slider_image_1.jpg?alt=media&token=6a2c2686-c40a-470e-8808-d7a27be80af1',
    // 'https://firebasestorage.googleapis.com/v0/b/e-commerce-dab1e.appspot.com/o/home_slider_images%2Fhome_slider_image_2.jpg?alt=media&token=0625e57a-f00a-4013-8f6e-95ddad0dc9dd',
    // 'https://firebasestorage.googleapis.com/v0/b/e-commerce-dab1e.appspot.com/o/home_slider_images%2Fhome_slider_image_4.jpg?alt=media&token=994298b9-c1db-43e7-b13e-561a3ec416d1',
  ];

  @override
  Widget build(BuildContext context) {
    // double screenWidth = MediaQuery.of(context).size.width;
    // double screenHeight = MediaQuery.of(context).size.height;
    return Stack(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            height: 450.h,
            autoPlay: true,
            initialPage: 0,
            autoPlayInterval: const Duration(seconds: 6),
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemCount: urlImages.length,
          itemBuilder: (context, index, realIndex) {
            final urlImage = urlImages[index];
            return buildImage(urlImage, index);
          },
        ),
        Positioned(
          bottom: 30,
          left: urlImages.length == 1
              ? 196.w
              : urlImages.length == 2
                  ? 178.w
                  : urlImages.length == 3
                      ? 159.w
                      : urlImages.length == 4
                          ? 142.w
                          : 128.w,
          child: buildIndicator(),
        ),
      ],
    );
  }

  buildImage(
    String urlImage,
    int index,
  ) =>
      Container(
        color: Colors.grey,
        // child: Image.network(
        //   urlImage,
        //   fit: BoxFit.cover,
        // ),
        child: Image(
          image: AssetImage(
            urlImage,
          ),
          fit: BoxFit.cover,
        ),
      );

  buildIndicator() => AnimatedSmoothIndicator(
        activeIndex: activeIndex,
        count: urlImages.length,
        onDotClicked: animateToSlide,
        effect: SlideEffect(
          spacing: 15.w,
          dotHeight: 16.h,
          dotWidth: 15,
          activeDotColor: Colors.red,
          dotColor: Colors.white,
        ),
      );

  void animateToSlide(int index) => controller.animateToPage(index);
}
