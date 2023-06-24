// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:e_commerce/lib.dart';

class FavoriteToggleIconBtn extends StatefulWidget {
  FavoriteToggleIconBtn({
    super.key,
    this.isFavorite = false,
  });

  bool isFavorite;

  @override
  State<FavoriteToggleIconBtn> createState() => _FavoriteToggleIconBtnState();
}

class _FavoriteToggleIconBtnState extends State<FavoriteToggleIconBtn> {
  //bool isFavorite = isFavorite1;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: Colors.white,
      ),
      onPressed: () {
        if (widget.isFavorite) {
          setState(() {
            widget.isFavorite = false;
          });
        } else {
          setState(() {
            widget.isFavorite = true;
          });
        }
      },
      child: widget.isFavorite
          ? Icon(
              Icons.favorite,
              color: Colors.red,
              size: 15.h,
            )
          : Icon(
              Icons.favorite_outline,
              color: Colors.grey,
              size: 15.h,
            ),
    );
  }
}
