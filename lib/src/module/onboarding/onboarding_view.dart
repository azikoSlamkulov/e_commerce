import 'package:e_commerce/lib.dart';
import 'package:flutter/material.dart';

import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final controller = PageController();
  bool isLastPage = false;

  @override
  void dispose() {
    controller.dispose();

    super.dispose();
  }

  List<String> titles = [
    "e_commerce online",
    "Легко выиграть подарки.",
    "Ищи, найди и выиграй свой подарок.",
    "Ищи, найди и выиграй свой подарок.",
  ];
  var subTitles = [
    "Lorem Ipsum — это просто текст-пустышка полиграфической и наборной индустрии.",
    "Lorem Ipsum — это просто текст-пустышка полиграфической и наборной индустрии.",
    "Lorem Ipsum — это просто текст-пустышка полиграфической и наборной индустрии.",
    "Lorem Ipsum — это просто текст-пустышка полиграфической и наборной индустрии."
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller,
            onPageChanged: (index) {
              setState(() {
                isLastPage = index == 3;
              });
            },
            children: [
              OnboardingLayout(
                color: Colors.white,
                imageLink: 'assets/png/icons/onboarding/clothes_women.png',
                title: titles[0],
                description: subTitles[0],
              ),
              OnboardingLayout(
                color: AppColors.secondaryColor,
                textColor: AppColors.white,
                imageLink: 'assets/png/icons/onboarding/clothes_men.png',
                title: titles[1],
                description: subTitles[1],
              ),
              OnboardingLayout(
                color: AppColors.white,
                imageLink: 'assets/png/icons/onboarding/shoes.png',
                title: titles[2],
                description: subTitles[2],
              ),
              OnboardingLayout(
                color: AppColors.secondaryColor,
                textColor: AppColors.white,
                topBGColor: AppColors.pink,
                imageLink: 'assets/png/icons/onboarding/kids_shoes.png',
                title: titles[3],
                description: subTitles[3],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(25.0),
              child: isLastPage
                  ? SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 70,
                      child: TextButton(
                        style: TextButton.styleFrom(
                          // shape: RoundedRectangleBorder(
                          //   borderRadius: BorderRadius.circular(30),
                          // ),
                          foregroundColor: Colors.white,
                          backgroundColor: AppColors.mainColor,
                        ),
                        child: const Text(
                          'Начать',
                          style: TextStyle(
                            fontSize: 24,
                          ),
                        ),
                        onPressed: () async {
                          //context.goNamed(AppPage.signUp.toName);
                          // BlocProvider.of<AuthBloc>(context).add(
                          //   OpenSignUpEvent(),
                          // );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SignUpView(),
                            ),
                          );
                        },
                      ),
                    )
                  : SizedBox(
                      height: 80,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          TextButton(
                            child: Text(
                              'Пропустить',
                              style: AppTextStyles.blue14,
                            ),
                            onPressed: () => controller.jumpToPage(3),
                          ),
                          Center(
                            child: SmoothPageIndicator(
                              controller: controller,
                              count: 4,
                              effect: const WormEffect(
                                spacing: 16,
                                dotColor: Colors.black26,
                                activeDotColor: AppColors.mainColor,
                              ),
                              onDotClicked: (index) => controller.animateToPage(
                                index,
                                duration: const Duration(milliseconds: 500),
                                curve: Curves.easeInOut,
                              ),
                            ),
                          ),
                          TextButton(
                            child: Text(
                              'Следующий',
                              style: AppTextStyles.blue14,
                            ),
                            onPressed: () => controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut,
                            ),
                          ),
                        ],
                      ),
                    ),
            ),
          )
        ],
      ),
    );
  }
}
