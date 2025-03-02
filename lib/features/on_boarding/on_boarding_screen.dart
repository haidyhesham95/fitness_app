import 'package:animate_do/animate_do.dart';
import 'package:fitness_app/core/localization/lang_keys.dart';
import 'package:fitness_app/core/routes/app_routes.dart';
import 'package:fitness_app/core/styles/fonts/my_fonts.dart';
import 'package:fitness_app/core/utils/extension/my_context.dart';
import 'package:fitness_app/core/utils/extension/navigation.dart';
import 'package:fitness_app/core/utils/widgets/buttons/custom_button.dart';
import 'package:fitness_app/features/on_boarding/boarding_page.dart';
import 'package:fitness_app/generated/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:glassmorphism_ui/glassmorphism_ui.dart';

class OnboardingScreen extends StatefulWidget {
  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final PageController _controller = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    List<Map<String, String>> onboardingData = [
      {
        "title": context.translate(LangKeys.priceOfExcellence),
        "description": context.translate(LangKeys.excellenceQuote),
        "image": Assets.imagesOn1, // Replace with actual asset
      },
      {
        "title": context.translate(LangKeys.fitnessFun),
        "description": context.translate(LangKeys.fitnessMotivation),
        "image": Assets.imagesOn2,
      },
      {
        "title": context.translate(LangKeys.noMoreExcuses),
        "description": context.translate(LangKeys.startNow),
        "image": Assets.imagesOn3,
      }
    ];

    return Scaffold(
      body: Stack(
        children: [
          // Background image
          Positioned.fill(
            child: GlassImage(
              height: context.height,
              borderRadius: BorderRadius.zero,
              blur: 6,
              image: Image.asset(
                Assets.imagesOnBoardingBg,
                fit: BoxFit.fitHeight,
              ),
            ),
          ),
          // Blur effect

          PageView.builder(
            controller: _controller,
            physics: const NeverScrollableScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            itemCount: onboardingData.length,
            itemBuilder: (context, index) {
              return BoardingPage(
                title: onboardingData[index]["title"]!,
                description: onboardingData[index]["description"]!,
                image: onboardingData[index]["image"]!,
                index: index,
                currentIndex: _currentPage,
              );
            },
          ),
          if (_currentPage != onboardingData.length - 1 )
            Positioned(
              top: 60,
              right: 20,
              width: 60.w,
              child: InkWell(
                onTap: () {
                  // context.pushReplacementNamed(AppRoutes.login);
                  context.pushNamed(AppRoutes.smartChatView);

                },
                child: Text(
                  context.translate(LangKeys.skip),
                  style: MyFonts.styleRegular400_14
                      .copyWith(color: context.colors.white),
                ),
              ),
            ),
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: List.generate(
                      onboardingData.length,
                      (index) => AnimatedContainer(
                        duration: const Duration(milliseconds: 300),
                        margin: const EdgeInsets.symmetric(horizontal: 4),
                        width: _currentPage == index ? 20 : 8,
                        height: 8,
                        decoration: BoxDecoration(
                            color: _currentPage == index
                                ? Colors.orange
                                : Colors.grey,
                            shape: BoxShape.rectangle,
                            borderRadius: BorderRadius.circular(50)),
                      ),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    if (_currentPage > 0)
                      FadeInLeft(
                        duration: const Duration(milliseconds: 500),
                        child: CustomButton(
                          onPressed: () {
                            _controller.previousPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          },
                          txt: context.translate(LangKeys.back),
                          width: context.width * .2,
                          color: context.colors.transparent
                              .withValues(alpha: .001),
                        ),
                      ),
                    FadeInRight(
                      duration: const Duration(milliseconds: 500),
                      child: CustomButton(
                        onPressed: () {
                          if (_currentPage == onboardingData.length - 1) {
                            context.pushReplacementNamed(AppRoutes.login);
                          } else {
                            _controller.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.ease,
                            );
                          }
                        },
                        txt: _currentPage == onboardingData.length - 1
                            ? context.translate(LangKeys.doIt)
                            : context.translate(LangKeys.next),
                        width: _currentPage == 0
                            ? context.width * .78
                            : context.width * .2,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
