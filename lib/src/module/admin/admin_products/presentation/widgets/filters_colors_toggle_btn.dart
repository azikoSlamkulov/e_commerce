import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FilterColorsToggleButton extends StatefulWidget {
  const FilterColorsToggleButton({
    Key? key,
    required this.bgColor,
    required this.onPressed,
    this.isActivity = false,
    this.isPaddingOnly = false,
    this.paddingOnlyLeft = 0,
    this.paddingOnlyRight = 0,
    this.paddingOnlyTop = 0,
    this.paddingOnlyBottom = 0,
  }) : super(key: key);

  final VoidCallback onPressed;
  final Color? bgColor;
  final bool isActivity;
  final bool isPaddingOnly;
  final double paddingOnlyLeft;
  final double paddingOnlyRight;
  final double paddingOnlyTop;
  final double paddingOnlyBottom;

  @override
  State<FilterColorsToggleButton> createState() =>
      _FilterColorsToggleButtonState();
}

class _FilterColorsToggleButtonState extends State<FilterColorsToggleButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: REdgeInsets.only(
          left: widget.paddingOnlyLeft,
          right: widget.paddingOnlyRight,
          top: widget.paddingOnlyTop,
          bottom: widget.paddingOnlyBottom,
        ),
        child: Stack(
          children: [
            Container(
              height: 44.h,
              width: 44.h,
              decoration: BoxDecoration(
                border: Border.all(
                  color: widget.isActivity ? Colors.red : Colors.white,
                ),
                shape: BoxShape.circle,
              ),
            ),
            Positioned(
              right: 3.9.h,
              top: 3.9.h,
              child: SizedBox(
                height: 36.h,
                width: 36.h,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    backgroundColor: widget.bgColor,
                  ),
                  onPressed: widget.onPressed,
                  // onPressed: () {
                  //   isActivity = !isActivity;
                  //   setState(() {});
                  // },
                  child: const Text(''),
                ),
              ),
            ),
          ],
        ));
  }
}
