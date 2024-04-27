import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CachedNetworkImageWidget extends StatelessWidget {
  const CachedNetworkImageWidget({
    required this.imageUrl,
    this.borderRadius,
    this.height,
    this.width,
    super.key,
  });

  final String imageUrl;
  final BorderRadius? borderRadius;
  final double? height;
  final double? width;

  Widget _imageWidget(ImageProvider imageProvider) {
    return Container(
      height: height ?? 192.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
        image: DecorationImage(
          image: imageProvider,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _placeholderWidget() {
    return Container(
      height: height ?? 192.h,
      width: width,
      decoration: BoxDecoration(
        borderRadius: borderRadius ??
            BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
      ),
      child: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return imageUrl.isEmpty
        ? _imageWidget(
            const AssetImage('assets/png/noImageError.png'),
          )
        : CachedNetworkImage(
            imageUrl: imageUrl,
            placeholder: (context, url) => _placeholderWidget(),
            imageBuilder: (context, imageProvider) =>
                _imageWidget(imageProvider),
            errorWidget: (context, url, error) =>
                _imageWidget(const AssetImage('assets/png/noImageError.png')),
            // errorWidget: (context, url, error) => Container(
            //   height: 192.h,
            //   //width: 100.h,
            //   decoration: BoxDecoration(
            //     borderRadius: BorderRadius.circular(10),
            //     color: Colors.red,
            //     boxShadow: const [
            //       BoxShadow(
            //         color: Colors.white,
            //         spreadRadius: 3,
            //       ),
            //     ],
            //   ),
            // ),
          );
  }
}
