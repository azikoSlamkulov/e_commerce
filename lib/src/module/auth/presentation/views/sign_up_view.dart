import 'dart:developer';

import 'package:e_commerce/src/util/app_constants/assets/app_assets.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import '../../../app/routes/router_utils.dart';
import '../../../../util/app_constants/colors/app_colors.dart';
import '../../../../util/app_constants/sized/spaces.dart';
import '../../../../util/app_widgets/buttons/custom_elevated_button.dart';
import '../../../../util/app_widgets/inputs/custom_text_form_field.dart';

import '../logic/auth_bloc.dart';
import '../logic/auth_event.dart';
import '../widgets/btn_facebook_widget.dart';
import '../widgets/btn_google_widget.dart';

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

class SignUpView extends StatelessWidget {
  SignUpView({
    Key? key,
  }) : super(key: key);

  final TextEditingController nameCont = TextEditingController();
  final TextEditingController emailCont = TextEditingController();
  final TextEditingController passwordCont = TextEditingController();
  final TextEditingController repeatPasswordCont = TextEditingController();
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
                  AppSized.h60,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: const [
                      Text(
                        'Регистрация',
                        style: TextStyle(
                          fontSize: 34,
                          fontWeight: FontWeight.bold,
                          //fontFamily:
                        ),
                      ),
                    ],
                  ),
                  AppSized.h70,
                  _name(context),
                  AppSized.h5,
                  _eMail(context),
                  AppSized.h5,
                  _password(context),
                  _textButtonIcon(context),
                  AppSized.h30,
                  _button(context),
                  AppSized.h100,
                  const Text(
                    'Или зарегистрируйтесь с помощью соц. сетей.',
                    style: TextStyle(
                      fontSize: 16,
                      //color: AppColors.black,
                    ),
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  _name(BuildContext context) {
    return CustomTextFormField(
      controller: nameCont,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
      labelText: 'Имя',
    );
  }

  _eMail(BuildContext context) {
    return CustomTextFormField(
      controller: emailCont,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
      labelText: 'Почта',
      validator: (value) {
        if (value != null && value.isEmpty) {
          return 'Поле не должно быть пустым!';
        } else if (!isEmail(value!)) {
          return 'Пример: your@email.com';
        }
        return null;
      },
    );
  }

  _password(BuildContext context) {
    return CustomTextFormField(
      controller: passwordCont,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
      labelText: 'Пароль',
    );
  }

  _textButtonIcon(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        TextButton.icon(
          onPressed: () {
            //GoRouter.of(context).goNamed(APP_PAGE.signIn.toName);
            BlocProvider.of<AuthBloc>(context).add(
              OpenSignInEvent(),
            );
          },
          icon: const Text(
            'У вас уже есть аккаунт?',
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

  _button(BuildContext context) {
    return CustomElevatedButton(
      //bgColor: AppColors.mainColor,
      sizedBoxWidth: MediaQuery.of(context).size.width * 0.95,
      //borderRadius: 30,
      text: const Text(
        'Регистрация',
        style: TextStyle(
          //color: AppColors.blue,
          fontSize: 18,
          //fontWeight: FontWeight.bold,
          //fontFamily:
        ),
      ),
      onPressed: () async {
        if (formKey.currentState!.validate()) {
          log('reg');
          BlocProvider.of<AuthBloc>(context).add(
            SignUpEvent(
              name: nameCont.text,
              email: emailCont.text,
              password: passwordCont.text,
            ),
          );
        }
      },
    );
  }
}
