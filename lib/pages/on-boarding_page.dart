import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:cspace_flutter_animation/pages/widgets/on-boarding_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_carousel_widget/flutter_carousel_widget.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  FlutterCarouselController carouselController = FlutterCarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: FlutterCarousel(
              items: const [
                // Slide 1
                OnBoardingItem(
                  imgUrl: 'assets/images/img_onboarding-1.png',
                  title: 'Buy Furniture Easily',
                  subtitle:
                      'Aliqua id fugiat nostrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
                ),
                // SLIDE 2
                OnBoardingItem(
                  imgUrl: 'assets/images/img_onboarding-2.png',
                  title: 'Fast Delivery',
                  subtitle:
                      'Aliqua id fugiat nostrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
                ),
                // SLIDE 3
                OnBoardingItem(
                  imgUrl: 'assets/images/img_onboarding-3.png',
                  title: 'Best Price',
                  subtitle:
                      'Aliqua id fugiat nostrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
                ),
              ],
              options: FlutterCarouselOptions(
                showIndicator: false,
                controller: carouselController,
                height: double.infinity,
                viewportFraction: 1,
                enableInfiniteScroll: false,
                initialPage: currentIndex,
                onPageChanged: (index, _) {
                  setState(() {
                    currentIndex = index;
                  });
                },
              ),
            ),
          ),
          // BOTTOM INDICATOR (SKIP/NEXT)
          Container(
            margin: const EdgeInsets.only(left: 40, right: 40, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SKIP BUTTON
                TextButton(
                  onPressed: () {
                    carouselController.animateToPage(2);
                  },
                  child: currentIndex == 2
                      ? const Text('')
                      : Text(
                          'SKIP',
                          style: blackTextStyle.copyWith(fontSize: 18),
                        ),
                ),
                // DOT INDICATOR
                Row(
                  children: [
                    // DOT 1
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 0 ? blackColor : lineDark,
                      ),
                    ),
                    // DOT 2
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 1 ? blackColor : lineDark,
                      ),
                    ),
                    // DOT 3
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 2 ? blackColor : lineDark,
                      ),
                    )
                  ],
                ),
                // NEXT/LOGIN BUTTON
                TextButton(
                  onPressed: () {
                    if (currentIndex == 2) {
                      Navigator.pushNamed(context, '/home');
                    }
                    carouselController.nextPage();
                  },
                  child: currentIndex == 2
                      ? Text(
                          'LOGIN',
                          style: blackTextStyle.copyWith(
                            fontSize: 18,
                          ),
                        )
                      : Text(
                          'NEXT',
                          style: blackTextStyle.copyWith(fontSize: 18),
                        ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
