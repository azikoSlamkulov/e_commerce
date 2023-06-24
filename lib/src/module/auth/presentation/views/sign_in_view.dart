import 'package:e_commerce/lib.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});

  final textController = TextEditingController();
  final passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool isEmail(String input) => EmailValidator.validate(input);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.bgColorMain,
        appBar: CustomAppBar(title: '', bgColor: AppColors.bgColorMain),
        body: SingleChildScrollView(
          child: Padding(
            padding: REdgeInsets.only(left: 15, right: 15, top: 15, bottom: 45),
            child: Form(
              key: formKey,
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

                  70.verticalSpace,

                  /// eMail
                  CustomTextFormField(
                    controller: textController,
                    sizedBoxWidth: double.infinity,
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
                              builder: (context) => PasswordRecoveryView(),
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
                  CustomElevatedButton(
                    sizedBoxHeight: 48.h,
                    sizedBoxWidth: double.infinity,
                    borderRadius: 30,
                    text: Text(
                      'Авторизация',
                      style: AppTextStyles.white18Bold,
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        BlocProvider.of<AuthBloc>(context).add(
                          SignInWithEmailEvent(
                            textController.text,
                            passwordController.text,
                          ),
                        );
                      }
                    },
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
      ),
    );
  }
}
