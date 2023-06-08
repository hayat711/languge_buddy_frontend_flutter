import 'package:flutter/material.dart';
import 'package:language_buddy/constants/color_scheme.dart';
import 'package:language_buddy/views/common/app_style.dart';
import 'package:language_buddy/views/common/reusable_text.dart';
import 'package:language_buddy/views/ui/onboarding/widgets/onboard_notifier.dart';
import 'package:language_buddy/views/ui/onboarding/widgets/page_one.dart';
import 'package:language_buddy/views/ui/onboarding/widgets/page_three.dart';
import 'package:language_buddy/views/ui/onboarding/widgets/page_two.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({Key? key,}) : super(key: key);


  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {

  final PageController pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<OnBoardNotifier>(
        builder: (context, onBoardNotifier, child) {
          return Stack(
              children: [
                PageView(
                  physics: onBoardNotifier.isLastPage
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
                  controller: pageController,
                  onPageChanged: (int page) {
                    onBoardNotifier.isLastPage = page == 2;
                  },
                  children: const [
                    PageOne(),
                    PageTwo(),
                    PageThree(),
                  ],
                ),
                
                Positioned(
                  bottom: 8,
                    left: 20,
                    right: 0,

                    child: Center(
                      child: SmoothPageIndicator(
                        controller: pageController,
                        count: 3,
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Colors.pink,
                          dotColor: secondaryColor,
                          dotHeight: 4,
                          dotWidth: 8,
                          spacing: 4,
                        ),
                      ),
                    )
                ),
                Positioned(
                    bottom: 0,
                    left: 10,
                    right: 10,
                    child: onBoardNotifier.isLastPage ?
                      const SizedBox.shrink() :
                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30
                      ),
                        child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () {
                              pageController.jumpToPage(2);
                            },
                            child: ReusableText( text: "Skip",
                              style: appstyle(16, contentColor, FontWeight.w500)
                            )
                          ),
                          GestureDetector(
                            onTap: () {
                              pageController.nextPage(
                                duration: const Duration(milliseconds: 300),
                                curve: Curves.easeInOutQuart,
                              );
                              },
                              child:  ReusableText( text: "Next",
                              style: appstyle(16, accentColor, FontWeight.w500)
                          ),
                          ),
                        ],
                      ),
                      )
                    )

                )
               ],
          );
        },
      ), // Consumer
    );
  }
}