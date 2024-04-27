import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    final textController = TextEditingController();
    final passwordController = TextEditingController();
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

    bool isEmail(String input) => EmailValidator.validate(input);
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      appBar: CustomAppBar(title: '', bgColor: AppColors.bgColorMain),
      body: Padding(
        padding: REdgeInsets.only(left: 15, right: 15, top: 15, bottom: 45),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Авторизация',
                      style: AppTextStyles.black34Bold,
                    ),
                  ],
                ),

                60.verticalSpace,

                /// eMail
                CustomTextFormField(
                  controller: textController,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Эл. почта',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле не должно быть пустым!';
                    } else if (!isEmail(value!)) {
                      return 'Не правильно введена почта';
                    }
                    return null;
                  },
                  onChanged: (value) {},
                ),
                5.verticalSpace,

                /// Password
                CustomTextFormField(
                  controller: passwordController,
                  sizedBoxWidth: double.infinity,
                  labelText: 'Пароль',
                  validator: (phone) {
                    if (phone == null || phone.isEmpty) {
                      return 'Поле не должно быть пустым!';
                    }
                    return null;
                  },
                ),
                5.verticalSpace,

                /// Text Button Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const PasswordRecoveryView(),
                          ),
                        );
                      },
                      icon: Text(
                        'Забыли пароль?',
                        style: AppTextStyles.black16,
                      ),
                      label: AppAssets.arrowRight(
                        width: 30,
                        height: 20,
                      ),
                    ),
                  ],
                ),
                30.verticalSpace,

                /// Button
                CustomButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      BlocProvider.of<AuthBloc>(context).add(
                        SignInWithEmailEvent(
                          textController.text,
                          passwordController.text,
                        ),
                      );
                    }
                  },
                  text: 'Авторизация',
                  textStyle: AppTextStyles.white18Bold,
                ),
                160.verticalSpace,
                Text(
                  'Или авторизуйтесь с помощью соц. сетей.',
                  style: AppTextStyles.black16,
                ),
                50.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // WidgetBtnFacebook(onTap: () {}),
                    // AppSized.w20,
                    // WidgetBtnGoogle(
                    //   onTap: () => BlocProvider.of<AuthBloc>(context).add(
                    //     SignInWithGoogleEvent(),
                    //   ),
                    // ),
                    IconButton(
                      iconSize: 50.h,
                      icon: AppAssets.facebookLogo(),
                      onPressed: () {},
                    ),
                    30.horizontalSpace,
                    IconButton(
                      iconSize: 47.h,
                      icon: AppAssets.googleLogo(),
                      onPressed: () {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignInWithGoogleEvent(),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
