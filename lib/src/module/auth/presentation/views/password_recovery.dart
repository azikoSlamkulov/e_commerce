import 'dart:developer';

import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../util/app_constants/colors/app_colors.dart';
import '../../../../util/app_constants/sized/spaces.dart';
import '../../../../util/app_constants/text_styles/app_text_styles.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../util/app_widgets/inputs/custom_text_form_field.dart';
import '../../../app/routes/router_utils.dart';
import '../logic/auth_bloc.dart';
import '../logic/auth_event.dart';

// class SignUpView extends StatelessWidget {
//   const SignUpView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => sl<AuthBloc>(),
//       child: SignUp2View(),
//     );
//   }
// }

class PasswordRecoveryView extends StatelessWidget {
  PasswordRecoveryView({
    Key? key,
  }) : super(key: key);

  final formKey = GlobalKey<FormState>();
  final TextEditingController emailCont = TextEditingController();

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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      IconButton(
                        padding: EdgeInsets.zero,
                        alignment: Alignment.centerLeft,
                        onPressed: () {
                          //GoRouter.of(context).goNamed(AppPage.signIn.toName);
                          // BlocProvider.of<AuthBloc>(context).add(
                          //   OpenSignInEvent(),
                          // );
                          Navigator.pop(context);
                        },
                        icon: const Icon(
                          Icons.chevron_left_sharp,
                          size: 35,
                        ),
                      )
                    ],
                  ),
                  AppSized.h15,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        'Восстановление пароля',
                        style: AppTextStyles.black30Bold,
                      ),
                    ],
                  ),
                  AppSized.h70,
                  Text(
                    'Пожалуйста, введите свой адрес электронной почты. Вы получите ссылку для создания нового пароля по электронной почте.',
                    style: AppTextStyles.black16,
                    //style: TextStyle(fontSize: 16),
                  ),

                  /// Email
                  AppSized.h30,
                  // _eMail(context),
                  CustomTextFormField(
                    controller: emailCont,
                    sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
                    labelText: 'Эл. почта',
                    validator: (value) {
                      if (value != null && value.isEmpty) {
                        return 'Поле не должно быть пустым!';
                      } else if (!isEmail(value!)) {
                        return 'Пример: your@email.com';
                      }
                      return null;
                    },
                  ),

                  /// Button
                  AppSized.h70,
                  //_button(context),
                  CustomElevatedButton(
                    bgColor: AppColors.mainColor,
                    sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
                    //borderRadius: 30,
                    text: Text(
                      'Отправить',
                      style: AppTextStyles.white18Bold,
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        log('reg');
                        //TODO Добавить востановление пароля
                        // BlocProvider.of<AuthBloc>(context).add(
                        //   SignUpEvent(
                        //     name: nameCont.text,
                        //     email: emailCont.text,
                        //     password: passwordCont.text,
                        //   ),
                        // );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  // _eMail(BuildContext context) {
  //   return CustomTextFormField(
  //     controller: emailCont,
  //     sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
  //     labelText: 'Эл. почта',
  //     validator: (value) {
  //       if (value != null && value.isEmpty) {
  //         return 'Поле не должно быть пустым!';
  //       } else if (!isEmail(value!)) {
  //         return 'Пример: your@email.com';
  //       }
  //       return null;
  //     },
  //   );
  // }

  // _button(BuildContext context) {
  //   return CustomElevatedButton(
  //     bgColor: AppColors.mainColor,
  //     sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
  //     //borderRadius: 30,
  //     text: Text(
  //       'Отправить',
  //       style: AppTextStyles.white18Bold,
  //     ),
  //     onPressed: () async {
  //       if (formKey.currentState!.validate()) {
  //         log('reg');
  //         //TODO Добавить востановление пароля
  //         // BlocProvider.of<AuthBloc>(context).add(
  //         //   SignUpEvent(
  //         //     name: nameCont.text,
  //         //     email: emailCont.text,
  //         //     password: passwordCont.text,
  //         //   ),
  //         // );
  //       }
  //     },
  //   );
  // }
}
