import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileBtnWidget extends StatelessWidget {
  const ProfileBtnWidget({
    required this.context,
    required this.title,
    required this.subtitle,
    required this.onTap,
    this.isTop = true,
    this.isBottom = false,
    super.key,
  });

  final BuildContext context;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final bool isTop;
  final bool isBottom;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 65.h,
      child: ListTile(
        shape: Border(
          top: isTop
              ? const BorderSide(color: Colors.black12, width: 0.5)
              : BorderSide.none,
          bottom: isBottom
              ? const BorderSide(color: Colors.black12, width: 0.5)
              : BorderSide.none,
        ),
        onTap: onTap,
        title: Text(
          title,
          style: AppTextStyles.black16,
        ),
        subtitle: Text(
          subtitle,
          style: AppTextStyles.grey11,
        ),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
