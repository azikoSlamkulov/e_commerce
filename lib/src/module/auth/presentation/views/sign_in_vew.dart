import 'dart:developer';

import 'package:e_commerce/src/module/auth/presentation/views/sign_up_view.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../app/routes/router_utils.dart';
import '../../../../util/app_constants/assets/app_assets.dart';
import '../../../../util/app_constants/colors/app_colors.dart';
import '../../../../util/app_constants/sized/spaces.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../util/app_widgets/inputs/custom_text_form_field.dart';

import '../logic/auth_bloc.dart';
import '../logic/auth_event.dart';
import '../widgets/btn_facebook_widget.dart';
import '../widgets/btn_google_widget.dart';

class SignInView extends StatelessWidget {
  final textController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordFormKey = GlobalKey<FormState>();
  final formKey = GlobalKey<FormState>();

  bool isEmail(String input) => EmailValidator.validate(input);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bgColorMain,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 45,
            ),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  //AppSized.h40,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      // InkWell(
                      //   splashColor: Colors.red,
                      //   child: Container(
                      //     child: const Icon(
                      //       Icons.chevron_left_sharp,
                      //       size: 35,
                      //     ),
                      //   ),
                      //   onTap: () {},
                      // ),
                      IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          BlocProvider.of<AuthBloc>(context).add(
                            OpenSignUpEvent(),
                          );
                        },
                        icon: const Icon(
                          Icons.chevron_left_sharp,
                          size: 35,
                        ),
                        // icon: AppAssets.arrow_right(
                        //   width: 35,
                        //   height: 35,
                        // ),
                      )
                    ],
                  ),
                  AppSized.h15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Авторизация',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          //fontFamily:
                        ),
                      ),
                    ],
                  ),
                  // AppAssets.flutterLogo(width: 220, height: 180),
                  AppSized.h70,

                  _eMailFormField(context),
                  AppSized.h5,
                  _passwordFormField(context),
                  AppSized.h5,
                  _textButtonIcon(context),
                  AppSized.h30,
                  _registrationBtn(context),
                  AppSized.h150,
                  const Text(
                    'Или авторизуйтесь с помощью соц. сетей.',
                    style: TextStyle(fontSize: 16),
                  ),
                  AppSized.h30,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WidgetBtnFacebook(onTap: () {}),
                      AppSized.w20,
                      WidgetBtnGoogle(
                        onTap: () => BlocProvider.of<AuthBloc>(context).add(
                          SignInWithGoogleEvent(),
                        ),
                      ),
                      // IconButton(
                      //   iconSize: 50,
                      //   icon: AppAssets.facebookLogo(),
                      //   onPressed: () {},
                      // ),
                      // AppSized.w20,
                      // IconButton(
                      //   iconSize: 47,
                      //   icon: AppAssets.googleLogo(),
                      //   onPressed: () {
                      //     BlocProvider.of<AuthBloc>(context).add(
                      //       SignInWithGoogleEvent(),
                      //     );
                      //   },
                      // ),
                    ],
                  ),
                  //const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _eMailFormField(BuildContext context) {
    return CustomTextFormField(
      controller: textController,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
      labelText: 'Эл. почта',
      //fillColor: AppColors.textFormFieldBgColor,
      //keyboardType: TextInputType.number,
      // border: OutlineInputBorder(
      //   borderSide: BorderSide(
      //     color: AppColors.black,
      //     width: 1.0,
      //     //style: BorderStyle.none,
      //   ),
      // ),
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Поле не должно быть пустым!';
        } else if (!isEmail(value!)) {
          return 'Не правильно введена почта';
        }
        return null;
      },
      onChanged: (value) {},
    );
  }

  _passwordFormField(BuildContext context) {
    return CustomTextFormField(
      controller: passwordController,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
      labelText: 'Пароль',
      //fillColor: AppColors.textFormFieldBgColor,
      //keyboardType: TextInputType.number,
      validator: (phone) {
        if (phone == null || phone.isEmpty) {
          return 'Поле не должно быть пустым!';
        }
        return null;
      },
      // onChanged: (phone) {

      //   // if (controller.phoneController.text.length == 9) {
      //   //   FocusScope.of(context).requestFocus(FocusNode());
      //   // }
      // },
    );
  }

  _textButtonIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            // GoRouter.of(context).goNamed(APP_PAGE.passwordRecovery.toName);
            BlocProvider.of<AuthBloc>(context).add(
              OpenPasswordRecoveryEvent(),
            );
          },
          icon: const Text(
            'Забыли пароль?',
            style: TextStyle(
              fontSize: 16,
              color: AppColors.black,
            ),
          ),
          //label: Icon(Icons.arrow_right)),
          label: AppAssets.arrowRight(
            width: 30,
            height: 20,
          ),
        ),
      ],
    );
  }

  _registrationBtn(BuildContext context) {
    return CustomElevatedButton(
      bgColor: AppColors.mainColor,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
      text: const Text(
        'Авторизация',
        style: TextStyle(fontSize: 18),
      ),
      onPressed: () async {
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(
        //     builder: (context) => OtpView(phoneNumber: ''),
        //   ),
        // );
        if (formKey.currentState!.validate()) {
          BlocProvider.of<AuthBloc>(context).add(
            SignInWithEmailEvent(
              textController.text,
              passwordController.text,
            ),
          );
        }
      },
    );
  }
}



// class SignInView extends StatelessWidget {
//   final textController = TextEditingController();
//   final passwordController = TextEditingController();
//   final passwordFormKey = GlobalKey<FormState>();
//   final formKey = GlobalKey<FormState>();

//   bool isEmail(String input) => EmailValidator.validate(input);

//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () => FocusScope.of(context).unfocus(),
//       child: Scaffold(
//         backgroundColor: AppColors.bgColorMain,
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(
//               horizontal: 15,
//               vertical: 60,
//             ),
//             child: Form(
//               key: formKey,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   AppAssets.flutterLogo(width: 220, height: 180),
//                   AppSized.h30,
//                   const Text(
//                     'Авторизуйтесть с помощью эл. почты.',
//                     style: TextStyle(fontSize: 18),
//                   ),
//                   AppSized.h30,
//                   _eMailFormField(context),
//                   AppSized.h10,
//                   _passwordFormField(context),
//                   AppSized.h20,
//                   _registrationBtn(context),
//                   AppSized.h10,
//                   TextButton(
//                     onPressed: () {},
//                     child: const Text('Забыли пароль?'),
//                   ),
//                   AppSized.h10,
//                   const CustomDivider(
//                     text: 'или',
//                     alignColor: AppColors.bgColorMain,
//                   ),
//                   AppSized.h30,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       WidgetBtnFacebook(
//                         onTap: () {},
//                       ),
//                       AppSized.w20,
//                       WidgetBtnGoogle(
//                         onTap: () {
//                           BlocProvider.of<AuthBloc>(context).add(
//                             SignInWithGoogleEvent(),
//                           );
//                         },
//                       ),
//                     ],
//                   ),
//                   AppSized.h30,
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'Если нет учетной записи.',
//                         style: TextStyle(fontSize: 16),
//                       ),
//                       AppSized.w10,
//                       TextButton(
//                         onPressed: () {
//                           // GoRouter.of(context)
//                           //     .goNamed(APP_PAGE.signUp.toName);
//                           // Navigator.push(
//                           //   context,
//                           //   MaterialPageRoute(
//                           //     builder: (context) => SignUpView(),
//                           //   ),
//                           // );
//                           BlocProvider.of<AuthBloc>(context).add(
//                             OpenSignUpEvent(),
//                           );
//                         },
//                         child: const Text(
//                           'Регистрация',
//                           style: TextStyle(fontSize: 16),
//                         ),
//                       )
//                     ],
//                   ),
//                   //const SizedBox(height: 10),
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   }

//   _eMailFormField(BuildContext context) {
//     return CustomTextFormField(
//       controller: textController,
//       sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
//       labelText: 'Номер телефона или эл. почта',
//       //fillColor: AppColors.textFormFieldBgColor,
//       //keyboardType: TextInputType.number,
//       // border: OutlineInputBorder(
//       //   borderSide: BorderSide(
//       //     color: AppColors.black,
//       //     width: 1.0,
//       //     //style: BorderStyle.none,
//       //   ),
//       // ),
//       validator: (value) {
//         if (!isEmail(value!)) {
//           return 'Введите эл.почту.';
//         } else if (value.isEmpty) {
//           return 'Поле не должно быть пустым!';
//         }
//         return null;
//       },
//       onChanged: (value) {},
//     );
//   }

//   _passwordFormField(BuildContext context) {
//     return CustomTextFormField(
//       controller: passwordController,
//       sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
//       labelText: 'Пароль',
//       //fillColor: AppColors.textFormFieldBgColor,
//       //keyboardType: TextInputType.number,
//       validator: (phone) {
//         if (phone == null || phone.isEmpty) {
//           return 'Поле не должно быть пустым!';
//         }
//         return null;
//       },
//       // onChanged: (phone) {

//       //   // if (controller.phoneController.text.length == 9) {
//       //   //   FocusScope.of(context).requestFocus(FocusNode());
//       //   // }
//       // },
//     );
//   }

//   _registrationBtn(BuildContext context) {
//     return CustomElevatedButton(
//       bgColor: AppColors.red,
//       sizedBoxWidth: MediaQuery.of(context).size.width * 0.90,
//       text: const Text(
//         'Авторизация',
//         style: TextStyle(fontSize: 18),
//       ),
//       onPressed: () async {
//         // Navigator.push(
//         //   context,
//         //   MaterialPageRoute(
//         //     builder: (context) => OtpView(phoneNumber: ''),
//         //   ),
//         // );
//         if (formKey.currentState!.validate()) {
//           BlocProvider.of<AuthBloc>(context).add(
//             SignInWithEmailEvent(
//               textController.text,
//               passwordController.text,
//             ),
//           );
//         }
//       },
//     );
//   }
// }

