import 'dart:developer';

import 'package:e_commerce/src/module/auth/auth.dart';
import 'package:e_commerce/src/module/auth/presentation/logic/auth_state.dart';
import 'package:e_commerce/src/util/app_constants/app_constants.dart';
import 'package:e_commerce/src/util/app_constants/sized/spaces.dart';
import 'package:e_commerce/src/util/app_widgets/bar/custom_app_bar.dart';
import 'package:e_commerce/src/util/app_widgets/others/circle_profile_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../util/app_constants/text_styles/app_text_styles.dart';
import '../../../auth/presentation/logic/auth_bloc.dart';
import '../../../auth/presentation/logic/auth_event.dart';
import '../../../auth/presentation/views/auth_check_view.dart';

class MobileProfileViwe extends StatelessWidget {
  const MobileProfileViwe({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          return NestedMobileProfileViwe(
            user: state.user,
          );
        } else if (state is UnAuthenticatedState) {
          return AuthCheckView();
        }
        return const Center(
            child: Text(
          'Some Error',
          style: TextStyle(color: Colors.black),
        ));
      },
    );
  }
}

class NestedMobileProfileViwe extends StatelessWidget {
  NestedMobileProfileViwe({required this.user, Key? key}) : super(key: key);

  AuthUser user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: 'My profile',
        showSearchBtn: true,
        showBackBtn: false,
      ),
      body: Center(
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: REdgeInsets.symmetric(vertical: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  circleAvatar(
                    onTap: () {},
                    imageUrl: user.photoURL!,
                  ),
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
            listTileBtn(context, 'My orders', 'Already have 12 orders', true,
                false, () {}),
            listTileBtn(
                context, 'Shipping addresses', '3 dresses', true, false, () {}),
            listTileBtn(
                context, 'Payment methods', 'Visa  **34', true, false, () {}),
            listTileBtn(context, 'Promocodes', 'You have special promocodes',
                true, false, () {}),
            listTileBtn(context, 'My reviews', 'Reviews for 4 items', true,
                false, () {}),
            listTileBtn(
                context, 'Settings', 'Reviews for 4 items', true, false, () {}),
            listTileBtn(context, 'Exit', '', true, true, () {
              BlocProvider.of<AuthBloc>(context).add(
                SignOutEvent(),
              );
            }),
            // AppSized.h100,
            // ElevatedButton(
            //   onPressed: () async {
            //     BlocProvider.of<AuthBloc>(context).add(
            //       SignOutEvent(),
            //     );
            //   },
            //   child: const Text('Выход'),
            // ),
          ],
        ),
      ),
    );
  }
}

circleAvatar({required final VoidCallback onTap, required String imageUrl}) {
  return Container(
    margin: REdgeInsets.symmetric(horizontal: 15),
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

listTileBtn(
  BuildContext context,
  String title,
  String subtitle,
  bool isTop,
  bool isBottom,
  VoidCallback onTap,
) {
  return Expanded(
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

adminButton(
  BuildContext context,
  String text,
  bool isTop,
  bool isBottom,
  VoidCallback onTap,
) {
  return ListTile(
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
      text,
      style: AppTextStyles.black16,
    ),
    trailing: const Icon(Icons.chevron_right),
  );
}
