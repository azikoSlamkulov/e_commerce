import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:carousel_slider/carousel_slider.dart';

import '../../../../core/presentation/app_widgets/app_widgets.dart';

class ProductDatailImagelWidget extends StatefulWidget {
  const ProductDatailImagelWidget({
    required this.imagesUrl,
    super.key,
  });

  final List<String> imagesUrl;

  @override
  State<ProductDatailImagelWidget> createState() =>
      _ProductDatailImagelWidgetState();
}

class _ProductDatailImagelWidgetState extends State<ProductDatailImagelWidget> {
  final controller = CarouselSliderController();
  int activeIndex = 0;

  void animateToSlide(int index) => controller.animateToPage(index);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CarouselSlider.builder(
          carouselController: controller,
          options: CarouselOptions(
            height: 413.h,
            initialPage: 0,
            viewportFraction: 1,
            onPageChanged: (index, reason) =>
                setState(() => activeIndex = index),
          ),
          itemCount: widget.imagesUrl.length,
          itemBuilder: (context, index, realIndex) {
            final imageUrl = widget.imagesUrl[index];
            return CachedNetworkImageWidget(
              imageUrl: imageUrl,
              height: 413,
              width: double.infinity,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(0.r),
                bottomLeft: Radius.circular(0.r),
              ),
            );
            // return Container(
            //   color: Colors.grey,
            //   child: Image.network(
            //     urlImage,
            //     fit: BoxFit.cover,
            //   ),
            // );
          },
        ),
        // 10.verticalSpace,
        // Padding(
        //   padding: REdgeInsets.symmetric(horizontal: 16),
        //   child: SizedBox(
        //     height: 50,
        //     child: ListView.separated(
        //       scrollDirection: Axis.horizontal,
        //       itemCount: widget.imagesUrl.length,
        //       itemBuilder: (context, index) {
        //         final imageUrl = widget.imagesUrl[index];
        //         return InkWell(
        //           onTap: () {
        //             activeIndex = index;
        //             animateToSlide(index);
        //             setState(() {});
        //           },
        //           child: CachedNetworkImageWidget(
        //             imageUrl: imageUrl,
        //             height: 50.h,
        //             width: 50.h,
        //             borderRadius: BorderRadius.only(
        //               topLeft: Radius.circular(0.r),
        //               bottomLeft: Radius.circular(0.r),
        //             ),
        //             border: Border.all(
        //               style: activeIndex == index
        //                   ? BorderStyle.solid
        //                   : BorderStyle.none,
        //               color: Colors.blue,
        //               width: 2.5.h,
        //             ),
        //           ),
        //           // child: Container(
        //           //   height: 50.h,
        //           //   width: 50.h,
        //           //   decoration: BoxDecoration(
        //           //     border: Border.all(
        //           //       style: activeIndex == index
        //           //           ? BorderStyle.solid
        //           //           : BorderStyle.none,
        //           //       color: Colors.blue,
        //           //       width: 2.5.h,
        //           //     ),
        //           //     image: DecorationImage(
        //           //       image: NetworkImage(imageUrl),
        //           //       fit: BoxFit.cover,
        //           //     ),
        //           //   ),
        //           // ),
        //         );
        //       },
        //       separatorBuilder: (context, index) => SizedBox(width: 7.h),
        //     ),
        //   ),
        // ),
      ],
    );
  }
}
