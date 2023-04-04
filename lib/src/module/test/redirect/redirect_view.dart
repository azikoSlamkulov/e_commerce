// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// import '../../../util/app_constants/colors/app_colors.dart';
// import '../../../util/app_widgets/progress/progress.dart';
// import '../../auth/presentation/logic/auth_bloc.dart';
// import '../../auth/presentation/logic/auth_event.dart';
// import '../../auth/presentation/logic/auth_state.dart';
// import '../../onboarding/onboarding_view.dart';
// import '../../shop/presentation/views/mobile/mobile_home_view.dart';
// import '../../shop/presentation/views/tablet/tablet_home_view.dart';
// import '../../app/navbar/root_layout.dart';
// // import '../../../core/constants/colors/app_colors.dart';
// // import '../../bloc/auth_bloc/auth_bloc.dart';
// // import '../../bloc/auth_bloc/auth_event.dart';
// // import '../../bloc/auth_bloc/auth_state.dart';
// // import '../../widgets/progress/progress.dart';
// // import '../admin/admin_view.dart';
// // import '../sign_in/otp_view.dart';
// // import '../sign_in/sign_in_with_phone_vew.dart';
// // import '../sign_up/views/create_user_view.dart';

// class RedirectView extends StatefulWidget {
//   @override
//   State<RedirectView> createState() => _RedirectViewState();
// }

// class _RedirectViewState extends State<RedirectView> {
//   late final AuthBloc _authBloc;

//   @override
//   void initState() {
//     _initAuth();
//     super.initState();
//   }

//   void _initAuth() {
//     _authBloc = context.read<AuthBloc>();
//     _authBloc.add(GetCurrentUserEvent());
//   }

//   @override
//   Widget build(BuildContext context) {
//     const _scaffoldKey = ValueKey('_scaffoldKey');
//     return BlocBuilder<AuthBloc, AuthState>(
//       bloc: _authBloc,
//       builder: (context, state) {
//         if (state is AuthLoadingState) {
//           return Scaffold(
//             backgroundColor: AppColors.black,
//             body: Center(
//               child: progressIndicator.circularProgress(),
//             ),
//           );
//         } else if (state is UnAuthenticatedState) {
//           return const OnboardingView();
//         } else if (state is AuthenticatedState) {
//           return const RootLayout(
//             key: _scaffoldKey,
//             currentIndex: 0,
//             mobile: MobileHomeView(),
//             tablet: TabletHomeView(),
//           );
//         }

//         ///
//         return const Scaffold(
//           body: Center(
//             child: Text('Something went wrong! Please try again!'),
//           ),
//         );
//       },
//     );
//   }
// }



// // import 'package:flutter/material.dart';


// // import 'package:get/get.dart';
// // import 'package:kgdrivers/app/app_constants/colors/app_colors.dart';
// // import 'package:kgdrivers/app/app_widgets/progress/progress.dart';
// // import 'package:kgdrivers/app/modules/admin/views/admin_view.dart';
// // //import 'package:kgdrivers/app/modules/accounts/views/create_account_view.dart';
// // import 'package:kgdrivers/app/modules/drivers/views/drivers_view.dart';
// // import '../../../data/services/authentication/authentication_state.dart';
// // import '../../authentication/controllers/authentication_controller.dart';
// // import '../../authentication/views/authentication_view.dart';
// // import '../../user_profile/views/create_account_view.dart';

// // class RedirectView extends StatelessWidget {
// //   // final AuthenticationController? _authCont =
// //   //     AuthenticationController.findAuthCont!;

// //   @override
// //   Widget build(BuildContext context) {
// //     return Obx(
// //       () {
// //         if (_authCont!.state is LoadingState) {
// //           return Scaffold(
// //             backgroundColor: AppColors.black,
// //             body: Center(
// //               child: progressIndicator.circularProgress(),
// //             ),
// //           );
// //           // } else if (_authCont!.state is OtpVerificationState) {
// //           //   return OtpView();
// //           // return OtpView(
// //           //     code: (_authCont!.state as OtpVerificationState).phoneNumber);
// //         } else if (_authCont!.state is UnAuthenticatedState) {
// //           return AuthenticationView();
// //         } else if (_authCont!.state is AuthenticatedAdminState) {
// //           return AdminView();
// //         } else if (_authCont!.state is AuthenticatedDriverState) {
// //           //Get.lazyPut(() => HomeController());
// //           return DriversView(
// //             user: (_authCont!.state as AuthenticatedDriverState).user,
// //           );
// //         } else if (_authCont!.state is NewUserState) {
// //           return CreateAccountView(
// //             userCredential: (_authCont!.state as NewUserState).user,
// //             showBackButton: true,
// //           );
// //         }

// //         ///
// //         return const Scaffold(
// //           body: Center(
// //             child: Text('Something went wrong! Please try again!'),
// //           ),
// //         );
// //       },
// //     );
// //   }
// // }
