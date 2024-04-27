import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RangeSliderWidget extends StatefulWidget {
  const RangeSliderWidget({
    required this.currentRangeValuesCallback,
    super.key,
  });

  final ValueSetter<RangeValues> currentRangeValuesCallback;

  @override
  State<RangeSliderWidget> createState() => _RangeSliderWidgetState();
}

class _RangeSliderWidgetState extends State<RangeSliderWidget> {
  RangeValues _currentRangeValues = const RangeValues(75, 300);

  final double min = 0;
  final double max = 500;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 88.h,
          color: Colors.white,
          child: RangeSlider(
            values: _currentRangeValues,
            divisions: 500,
            min: min,
            max: max,
            labels: RangeLabels(
              _currentRangeValues.start.round().toString(),
              _currentRangeValues.end.round().toString(),
            ),
            activeColor: AppColors.mainColor,
            inactiveColor: Colors.grey,
            onChanged: (RangeValues values) {
              setState(() {
                _currentRangeValues = values;
                widget.currentRangeValuesCallback(_currentRangeValues);
              });
            },
          ),
        ),
        Positioned(
          left: 20.h,
          top: 15.h,
          child: buildSideLabel(min),
        ),
        Positioned(
          right: 25.h,
          top: 15.h,
          child: buildSideLabel(max),
        ),
      ],
    );
  }

  buildSideLabel(double value) {
    return Text(
      '\$${value.round().toString()}',
      style: TextStyle(fontSize: 14.sp),
    );
  }
}
