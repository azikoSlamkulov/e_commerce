import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';
import 'package:go_router/go_router.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController nameCont = TextEditingController();
    final TextEditingController emailCont = TextEditingController();
    final TextEditingController passwordCont = TextEditingController();
    final TextEditingController repeatPasswordCont = TextEditingController();

    bool isEmail(String input) => EmailValidator.validate(input);
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    // return GestureDetector(
    //   onTap: () => FocusScope.of(context).unfocus(),
    return Scaffold(
      backgroundColor: AppColors.bgColorMain,
      body: Padding(
        padding: REdgeInsets.symmetric(horizontal: 15, vertical: 45),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                60.verticalSpace,
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      'Регистрация',
                      style: AppTextStyles.black34Bold,
                    ),
                  ],
                ),
                60.verticalSpace,

                /// Name
                CustomTextFormField(
                  controller: nameCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Имя',
                ),
                5.verticalSpace,

                /// eMail
                CustomTextFormField(
                  controller: emailCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Почта',
                  validator: (value) {
                    if (value != null && value.isEmpty) {
                      return 'Поле не должно быть пустым!';
                    } else if (!isEmail(value!)) {
                      return 'Пример: your@email.com';
                    }
                    return null;
                  },
                ),
                5.verticalSpace,

                /// Password
                CustomTextFormField(
                  controller: passwordCont,
                  //sizedBoxWidth: double.infinity,
                  labelText: 'Пароль',
                ),
                5.verticalSpace,

                /// Text Button Icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        //context.goNamed(AppPage.signIn.toName);

                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignInView(),
                          ),
                        );
                      },
                      icon: Text(
                        'У вас уже есть аккаунт?',
                        style: AppTextStyles.black16,
                      ),
                      //label: Icon(Icons.arrow_right)),
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
                        SignUpEvent(
                          name: nameCont.text,
                          email: emailCont.text,
                          password: passwordCont.text,
                        ),
                      );
                    }
                  },
                  text: 'Регистрация',
                  textStyle: AppTextStyles.white18Bold,
                ),
                100.verticalSpace,
                Text(
                  'Или зарегистрируйтесь с помощью соц. сетей.',
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
                      //iconSize: 50.h,
                      icon: AppAssets.facebookLogo(width: 50.h, height: 50.h),
                      onPressed: () {},
                    ),
                    30.horizontalSpace,
                    IconButton(
                      //iconSize: 47.h,
                      icon: AppAssets.googleLogo(width: 47.h, height: 47.h),
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
