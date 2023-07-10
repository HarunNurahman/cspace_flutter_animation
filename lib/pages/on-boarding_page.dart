import 'package:carousel_slider/carousel_slider.dart';
import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:cspace_flutter_animation/pages/widgets/on-boarding_item.dart';
import 'package:flutter/material.dart';

class OnBoarding extends StatefulWidget {
  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentIndex = 0;
  CarouselController carouselController = CarouselController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: CarouselSlider(
              carouselController: carouselController,
              items: const [
                // Slide 1
                OnBoardingItem(
                  imgUrl: 'assets/images/img_onboarding-1.png',
                  title: 'Buy Furniture Easily',
                  subtitle:
                      'Aliqua id fugiat nostrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
                ),
                OnBoardingItem(
                  imgUrl: 'assets/images/img_onboarding-2.png',
                  title: 'Fast Delivery',
                  subtitle:
                      'Aliqua id fugiat nostrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
                ),
                OnBoardingItem(
                  imgUrl: 'assets/images/img_onboarding-3.png',
                  title: 'Best Price',
                  subtitle:
                      'Aliqua id fugiat nostrud irure ex duis ea\nquis id quis ad et. Sunt qui esse',
                ),
              ],
              options: CarouselOptions(
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
          Container(
            margin: const EdgeInsets.only(left: 40, right: 40, bottom: 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
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
                // Dot Indicator
                Row(
                  children: [
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 0 ? blackColor : lineDark,
                      ),
                    ),
                    Container(
                      width: 10,
                      height: 10,
                      margin: const EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: currentIndex == 1 ? blackColor : lineDark,
                      ),
                    ),
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
                TextButton(
                  onPressed: () {
                    if (currentIndex == 2) {
                      Navigator.pushNamed(context, '/login');
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
