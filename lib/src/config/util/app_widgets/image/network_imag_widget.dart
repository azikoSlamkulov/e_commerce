import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';

class NetworkImageWidget extends StatelessWidget {
  const NetworkImageWidget({
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

  @override
  Widget build(BuildContext context) {
    if (imageUrl.isEmpty) {
      Container(
        // borderRadius: BorderRadius.circular(8.0),
        height: height ?? 192.h,
        width: width,
        decoration: BoxDecoration(
          borderRadius: borderRadius ??
              BorderRadius.only(
                topLeft: Radius.circular(10.r),
                bottomLeft: Radius.circular(10.r),
              ),
          color: Colors.red,
          boxShadow: const [
            BoxShadow(
              color: Colors.white,
              spreadRadius: 3,
            ),
          ],
        ),
      );
    }
    return Container(
      height: height ?? 192.h,
      width: width,
      decoration: BoxDecoration(
        //color: Colors.greenAccent,
        image: DecorationImage(
          image: NetworkImage(imageUrl),
          fit: BoxFit.cover,
        ),
        borderRadius: borderRadius ??
            BorderRadius.only(
              topLeft: Radius.circular(10.r),
              bottomLeft: Radius.circular(10.r),
            ),
      ),
    );
  }
}
