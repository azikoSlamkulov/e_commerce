import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UserProfileInfoWidget extends StatelessWidget {
  const UserProfileInfoWidget({
    required this.user,
    super.key,
  });

  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.only(top: 10, bottom: 30, left: 16, right: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('My Profile', style: AppTextStyles.black34Bold),
            ],
          ),
          24.verticalSpace,
          InkWell(
            onTap: () => AppBottomSheet.showBottomSheet(
              context: context,
              title: 'Add new card',
              //TODO: Добавить контент
              content: Text(
                'Добавить контент',
                style: AppTextStyles.black14,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                circleAvatar(
                  onTap: () {},
                  imageUrl: user.photoURL!,
                ),
                15.horizontalSpace,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      user.name!,
                      style: AppTextStyles.black18Bold,
                    ),
                    Text(user.email!, style: AppTextStyles.grey14),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

circleAvatar({required final VoidCallback onTap, required String imageUrl}) {
  return Container(
    //margin: REdgeInsets.symmetric(horizontal: 15),
    decoration: BoxDecoration(
      //color: AppColors.bgColorCircleProfile,
      shape: BoxShape.circle,
      border: imageUrl.isNotEmpty
          ? Border.all(style: BorderStyle.none)
          : Border.all(color: AppColors.grey),
    ),
    child: Stack(
      children: [
        if (imageUrl.isNotEmpty)
          CircleAvatar(
            radius: 30.w,
            backgroundImage: NetworkImage(imageUrl),
          )
        else
          Padding(
            padding: REdgeInsets.all(35.0),
            // child: FaIcon(
            //   icon,
            //   size: 25.w,
            //   color: AppColors.black,
            // ),
            child: AppAssets.profileIcon(width: 25.w, height: 25.w),
          ),
      ],
    ),
  );
}
