import 'package:e_commerce/lib.dart';

class SuccessViewFirst extends StatelessWidget {
  const SuccessViewFirst({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: REdgeInsets.all(18.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppAssets.successIcon(
                height: 213,
                width: 208,
              ),
              49.verticalSpace,
              Text('Success!', style: AppTextStyles.black34Bold),
              12.verticalSpace,
              Text('Your order will be delivered soon.',
                  style: AppTextStyles.black14),
              5.verticalSpace,
              Text('Thank you for choosing our app!',
                  style: AppTextStyles.black14),
              163.verticalSpace,
              CustomElevatedButton(
                sizedBoxHeight: 48.h,
                sizedBoxWidth: double.infinity,
                borderRadius: 30,
                bgColor: AppColors.mainColor,
                text: Text(
                  'CONTINUE SHOPPING',
                  style: AppTextStyles.white14,
                ),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }
}
