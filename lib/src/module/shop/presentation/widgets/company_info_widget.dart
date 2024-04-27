import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CompanyInfoWidget extends StatelessWidget {
  const CompanyInfoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: REdgeInsets.only(top: 60),
      height: 120.h,
      width: double.infinity,
      decoration: const BoxDecoration(
        color: Colors.blue,
      ),
      child: const Center(
        child: Text(
          'Company Info',
          style: TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}
