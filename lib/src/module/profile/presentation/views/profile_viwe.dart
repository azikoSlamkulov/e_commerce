import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

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
        } else if (state is AuthenticatedAdminState) {
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
  const NestedMobileProfileViwe({required this.user, Key? key})
      : super(key: key);

  final AuthUserEntity user;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(
        title: '',
        showSearchBtn: true,
        showBackBtn: false,
        bgColor: AppColors.bgColorMain,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              UserProfileInfoWidget(user: user),
              AdminBtnWidget(
                user: user,
                context: context,
                subtitle: 'Already have 12 orders',
              ),
              ProfileBtnWidget(
                context: context,
                title: 'My orders',
                subtitle: 'Already have 12 orders',
                onTap: () {
                  GoRouter.of(context).goNamed(
                    AppPage.orders.toName,
                  );
                },
              ),
              ProfileBtnWidget(
                context: context,
                title: 'Shipping addresses',
                subtitle: '3 dresses',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MobileShippingAddressView(),
                    ),
                  );
                },
              ),
              ProfileBtnWidget(
                context: context,
                title: 'Payment methods',
                subtitle: 'Visa  **34',
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const MobilePaymentMethodsView(),
                    ),
                  );
                },
              ),
              ProfileBtnWidget(
                context: context,
                title: 'Promocodes',
                subtitle: 'You have special promocodes',
                onTap: () {},
              ),
              ProfileBtnWidget(
                context: context,
                title: 'My reviews',
                subtitle: 'Reviews for 4 items',
                onTap: () {},
              ),
              ProfileBtnWidget(
                context: context,
                title: 'Settings',
                subtitle: 'Reviews for 4 items',
                onTap: () {},
              ),
              ProfileBtnWidget(
                context: context,
                title: 'Log Out',
                subtitle: 'Exit the application',
                isBottom: true,
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    SignOutEvent(),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}

// MyDialog.getDialog(
//                     context: context,
//                   );

// profileBottomSheet(BuildContext context) {
//   return showModalBottomSheet<void>(
//     context: context,
//     isScrollControlled: true,
//     backgroundColor: Colors.white,
//     shape: RoundedRectangleBorder(
//       borderRadius: BorderRadius.only(
//         topLeft: Radius.circular(30.r),
//         topRight: Radius.circular(30.r),
//       ),
//     ),
//     builder: (BuildContext context) {
//       return Padding(
//         padding: REdgeInsets.symmetric(horizontal: 16),
//         child: SizedBox(
//           height: 250.h,
//           child: Column(
//             children: [
//               Center(
//                 child: Padding(
//                   padding: REdgeInsets.only(top: 36),
//                   child: Text(
//                     'Add new card',
//                     style: AppTextStyles.black18Bold,
//                   ),
//                 ),
//               ),
//               33.verticalSpace,
//               CustomButton(
//                 onPressed: () {
//                   CustomProgressIndicator().showLoaderDialog(context);
//                 },
//                 text: 'SAVE ADDRESS',
//               ),
//               20.verticalSpace,
//               CustomButton(
//                 onPressed: () => context.pop(context),
//                 text: 'EXIT',
//               ),
//               25.verticalSpace,
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
