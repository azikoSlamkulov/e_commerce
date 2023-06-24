// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce/lib.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  //with PreferredSizeWidget
  CustomAppBar({
    key,
    required this.title,
    this.bgColor = Colors.white,
    this.showBackBtn = true,
    this.showSearchBtn = false,
    this.showShareBtn = false,
    //this.bottom = false,
  })  : preferredSize = Size.fromHeight(60.0.h),
        super(key: key);

  @override
  final Size preferredSize;
  final String title;
  final Color bgColor;
  final bool showBackBtn;
  final bool showSearchBtn;
  final bool showShareBtn;
  //final PreferredSizeWidget? bottom;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: bgColor,
      title: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      leading: showBackBtn
          ? IconButton(
              icon: Icon(
                Icons.chevron_left_sharp,
                color: Colors.black,
                size: 35.h,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : SizedBox(
              width: 50.h,
            ),
      actions: [
        showSearchBtn
            ? IconButton(
                icon: Icon(
                  Icons.search,
                  size: 27.h,
                  color: Colors.black,
                ),
                onPressed: () {
                  // showSearch(
                  //   context: context,
                  //   delegate: MySearchDelegate(),
                  // );
                },
              )
            : showShareBtn
                ? IconButton(
                    icon: Icon(
                      Icons.share,
                      size: 27.h,
                      color: Colors.black,
                    ),
                    onPressed: () {},
                  )
                : SizedBox(
                    width: 50.h,
                  ),
      ],
      elevation: 0,
      //bottom: bottom,
    );
  }
}
