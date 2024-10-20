import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ListTileBtnWidget extends StatelessWidget {
  final String text;
  final String subtitle;
  final VoidCallback onTap;

  const ListTileBtnWidget({
    super.key,
    required this.text,
    required this.subtitle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      // onTap: () {
      //   GoRouter.of(context).goNamed(
      //     APP_PAGE.shopBrand.toName,
      //   );
      // },
      title: Text(
        text,
        style: AppTextStyles.black16Bold,
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          color: Colors.black38,
          fontSize: 14.sp,
        ),
      ),
      trailing: const Icon(Icons.chevron_right),
    );
  }
}
