import 'dart:developer';

import 'package:e_commerce/lib.dart';

class PasswordRecoveryView extends StatelessWidget {
  PasswordRecoveryView({
    Key? key,
  }) : super(key: key);

  final TextEditingController emailCont = TextEditingController();
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
                        'Восстановление пароля',
                        style: AppTextStyles.black30Bold,
                      ),
                    ],
                  ),
                  70.verticalSpace,
                  Text(
                    'Пожалуйста, введите свой адрес электронной почты. Вы получите ссылку для создания нового пароля по электронной почте.',
                    style: AppTextStyles.black16,
                  ),

                  /// Email
                  30.verticalSpace,

                  CustomTextFormField(
                    controller: emailCont,
                    sizedBoxWidth: double.infinity,
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
                  70.verticalSpace,

                  CustomElevatedButton(
                    sizedBoxHeight: 48.h,
                    sizedBoxWidth: double.infinity,
                    borderRadius: 30,
                    text: Text(
                      'Отправить',
                      style: AppTextStyles.white18Bold,
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        log('reg');
                        //TODO Добавить востановление пароля
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
}
