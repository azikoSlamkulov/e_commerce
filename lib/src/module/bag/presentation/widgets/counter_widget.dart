import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/app_constants/app_constants.dart';

class CounterWidget extends StatefulWidget {
  const CounterWidget({super.key});

  @override
  State<CounterWidget> createState() => _CounterWidgetState();
}

class _CounterWidgetState extends State<CounterWidget> {
  int count = 1;
  void increment() => setState(() {
        count = count++;
      });

  void decrement() {
    setState(() {
      count++;
    });
    if (count > 1) {
      setState(() {
        count--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    log('$count');
    return Expanded(
      child: Row(
        children: [
          SizedBox(
            height: 36.h,
            width: 36.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide.none,
                ),
                //primary: bgColor,
                backgroundColor: AppColors.white,
              ),
              child: const Icon(
                Icons.remove,
                color: AppColors.black26,
              ),
              onPressed: () => decrement(),
            ),
          ),
          16.horizontalSpace,
          Text(
            '$count',
            style: const TextStyle(color: Colors.black, fontSize: 14),
          ),
          16.horizontalSpace,
          SizedBox(
            height: 36.h,
            width: 36.h,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(50),
                  side: BorderSide.none,
                ),
                //primary: bgColor,
                backgroundColor: AppColors.white,
              ),
              child: const Icon(
                Icons.add,
                color: AppColors.black26,
              ),
              onPressed: () => increment(),
            ),
          ),
        ],
      ),
    );
  }
}
