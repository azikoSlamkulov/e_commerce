import 'dart:developer';

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
          // return NestedMobileProfileViwe(
          //   user: state.user,
          // );
          return BlocProvider(
            create: (context) =>
                sl<ProfileBloc>()..add(GetUserInfoEvent(state.user.userID!)),
            // child: NestedMobileProfileViwe(
            //   user: state.user,
            // ),
            child: BlocBuilder<ProfileBloc, ProfileState>(
              builder: (context, state) {
                if (state is LoadingProfileState) {
                  return const LoadingWidget();
                } else if (state is LoadedUserProfileState) {
                  return NestedMobileProfileViwe(
                    user: state.user,
                  );
                }
                return const Center(
                    child: Text(
                  'Some Error',
                  style: TextStyle(color: Colors.black),
                ));
              },
            ),
          );
          // } else if (state is AuthenticatedAdminState) {
          //   return NestedMobileProfileViwe(
          //     user: state.user,
          //   );
        } else if (state is UnAuthenticatedState) {
          return const AuthCheckView();
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

class NestedMobileProfileViwe extends StatefulWidget {
  const NestedMobileProfileViwe({required this.user, Key? key})
      : super(key: key);

  final UserEntity user;

  @override
  State<NestedMobileProfileViwe> createState() =>
      _NestedMobileProfileViweState();
}

class _NestedMobileProfileViweState extends State<NestedMobileProfileViwe> {
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
              /// User info
              UserProfileInfoWidget(user: widget.user),

              /// Admin
              AdminBtnWidget(
                user: widget.user,
                context: context,
                subtitle: 'Already have 12 orders',
              ),

              /// Orders
              ProfileBtnWidget(
                context: context,
                title: 'My orders',
                subtitle: widget.user.orders!.isNotEmpty
                    ? 'Already have ${widget.user.orders!.length} orders'
                    : 'No orders',
                onTap: () {
                  GoRouter.of(context).goNamed(
                    AppPage.orders.toName,
                    extra: widget.user.orders!,
                  );
                  //  Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //       builder: (context) => MobileOrdersView(
                  //         orders: widget.user.orders! as List<OrderEntity>,
                  //       ),
                  //     ),
                  //   );
                },
              ),

              /// Shipping addresses
              ProfileBtnWidget(
                context: context,
                title: 'Shipping addresses',
                subtitle: widget.user.shippingAddresses!.isNotEmpty
                    ? '${widget.user.shippingAddresses!.length} adresses'
                    : 'No adresses',
                onTap: () async {
                  final isTrue = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobileShippingAddressView(
                        user: widget.user,
                        //isCheckout: false,
                      ),
                    ),
                  );
                  if (isTrue) {
                    setState(() {
                      context.read<ProfileBloc>().add(
                            GetUserInfoEvent(widget.user.userID!),
                          );
                    });
                  }
                },
              ),

              /// Payment methods
              ProfileBtnWidget(
                context: context,
                title: 'Payment methods',
                subtitle: 'Visa  **34',
                onTap: () async {
                  final isTrue = await Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MobilePaymentMethodsView(
                        user: widget.user,
                      ),
                    ),
                  );
                  if (isTrue) {
                    setState(() {
                      context.read<ProfileBloc>().add(
                            GetUserInfoEvent(widget.user.userID!),
                          );
                    });
                  }
                },
              ),

              /// Promocodes
              ProfileBtnWidget(
                context: context,
                title: 'Promocodes',
                subtitle: 'You have special promocodes',
                onTap: () {},
              ),

              /// Reviews
              ProfileBtnWidget(
                context: context,
                title: 'My reviews',
                subtitle: widget.user.reviews!.isNotEmpty
                    ? 'Reviews for ${widget.user.reviews!.length} items'
                    : 'No reviews',
                onTap: () {},
              ),

              ///Settings
              ProfileBtnWidget(
                context: context,
                title: 'Settings',
                subtitle: '',
                onTap: () {
                  BlocProvider.of<ProfileBloc>(context)
                      .add(GetUserInfoEvent(widget.user.userID!));
                },
              ),

              /// Log Out
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
