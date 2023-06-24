import 'package:e_commerce/lib.dart';

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
            padding: REdgeInsets.symmetric(horizontal: 15, vertical: 45),
            child: Form(
              key: formKey,
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
                  70.verticalSpace,

                  /// Name
                  CustomTextFormField(
                    controller: nameCont,
                    sizedBoxWidth: double.infinity,
                    labelText: 'Имя',
                  ),
                  5.verticalSpace,

                  /// eMail
                  CustomTextFormField(
                    controller: emailCont,
                    sizedBoxWidth: double.infinity,
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
                    sizedBoxWidth: double.infinity,
                    labelText: 'Пароль',
                  ),
                  5.verticalSpace,

                  /// Text Button Icon
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton.icon(
                        onPressed: () {
                          //GoRouter.of(context).goNamed(AppPage.signIn.toName);
                          // BlocProvider.of<AuthBloc>(context).add(
                          //   OpenSignInEvent(),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignInView(),
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
                  CustomElevatedButton(
                    sizedBoxHeight: 48.h,
                    sizedBoxWidth: double.infinity,
                    borderRadius: 30,
                    text: Text(
                      'Регистрация',
                      style: AppTextStyles.white18Bold,
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignUpEvent(
                            name: nameCont.text,
                            email: emailCont.text,
                            password: passwordCont.text,
                          ),
                        );
                      }
                    },
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
      ),
    );
  }
}
