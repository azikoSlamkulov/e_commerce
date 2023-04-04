import 'package:e_commerce/src/util/app_constants/text_styles/app_text_styles.dart';
import 'package:flutter/material.dart';

import '../../util/app_constants/colors/app_colors.dart';

class ErrorView extends StatelessWidget {
  const ErrorView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text(
            //state.extra.toString(),
            'Что то пошло не так. Попробуйте еще раз.',
            style: AppTextStyles.black22),
      ),
    );
  }
}
