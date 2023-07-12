import 'package:carousel_slider/carousel_slider.dart';
import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:cspace_flutter_animation/pages/widgets/home-category_item.dart';
import 'package:cspace_flutter_animation/pages/widgets/home-popular_item.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int? currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteGrey,
      bottomNavigationBar: bottomNavBar(),
      body: Stack(
        children: [
          Image.asset('assets/images/img_background.png'),
          ListView(
            children: [
              // HEADER (App Logo and Shopping Cart)
              header(),
              // SEARCH BAR
              searchBar(),
              // CATEGORY SECTION
              categorySection(),
              // POPULAR SECTION
              popularSection(),
            ],
          )
        ],
      ),
    );
  }

  Widget bottomNavBar() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: BottomNavigationBar(
        showUnselectedLabels: false,
        showSelectedLabels: false,
        backgroundColor: whiteColor,
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_home_dark.png',
              width: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_wishlist_dark.png',
                width: 24,
              ),
              label: 'Wishlist'),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_profile_dark.png',
              width: 24,
            ),
            label: 'Profile',
          )
        ],
      ),
    );
  }

  Widget header() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Image.asset(
            'assets/images/logo_dark.png',
            width: 54,
          ),
          const SizedBox(width: 8),
          Text(
            'Space',
            style: blackTextStyle.copyWith(
              fontSize: 20,
              fontWeight: bold,
            ),
          ),
          const Spacer(),
          Image.asset(
            'assets/icons/ic_shopping-cart_dark.png',
            width: 30,
          ),
        ],
      ),
    );
  }

  Widget searchBar() {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/search'),
      child: Container(
        margin: const EdgeInsets.only(top: 30, left: 24, right: 24),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: whiteColor,
          borderRadius: BorderRadius.circular(14),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Search Furniture',
              style: greyTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            Image.asset(
              'assets/icons/ic_search_dark.png',
              color: greyColor,
              width: 24,
            )
          ],
        ),
      ),
    );
  }

  Widget categorySection() {
    return Column(
      children: [
        // CATEGORY TITLE
        Container(
          margin: const EdgeInsets.only(top: 30, left: 24, right: 24),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Category',
                style: blackTextStyle.copyWith(
                  fontSize: 20,
                  fontWeight: semibold,
                ),
              ),
              Text('Show All', style: blackTextStyle)
            ],
          ),
        ),

        // CATEGORY CAROUSEL
        Container(
          margin: const EdgeInsets.only(top: 25),
          child: CarouselSlider(
            items: const [
              HomeCategoryItem(
                imgUrl: 'assets/images/img_product-category-1.png',
                title: 'Minimalis Couch',
                subtitle: 'Couch',
              ),
              HomeCategoryItem(
                imgUrl: 'assets/images/img_product-category-2.png',
                title: 'Minimalis Table',
                subtitle: 'Table',
              ),
              HomeCategoryItem(
                imgUrl: 'assets/images/img_product-category-3.png',
                title: 'Minimalis Chair',
                subtitle: 'Chair',
              )
            ],
            options: CarouselOptions(
              height: 140,
              enableInfiniteScroll: false,
              viewportFraction: 1,
              onPageChanged: (index, reason) {
                setState(() {
                  currentIndex = index;
                });
              },
            ),
          ),
        ),

        // CATEGORY CAROUSEL INDICATOR
        Container(
          margin: const EdgeInsets.only(top: 14, left: 24, right: 24),
          child: Row(
            children: [
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 0 ? blackColor : lineDark,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 1 ? blackColor : lineDark,
                ),
              ),
              Container(
                margin: const EdgeInsets.only(right: 10),
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: currentIndex == 2 ? blackColor : lineDark,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget popularSection() {
    return Container(
      margin: const EdgeInsets.only(top: 24),
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(40),
        ),
        color: whiteColor,
      ),
      child: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Popular',
                  style: blackTextStyle.copyWith(
                    fontSize: 24,
                    fontWeight: semibold,
                  ),
                ),
                Text('Show All', style: blackTextStyle),
              ],
            ),
            const SizedBox(height: 16),
            const SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  HomePopularItem(
                    imgUrl: 'assets/images/img_product-popular-1.png',
                    title: 'Poan Chair',
                    price: 34,
                  ),
                  HomePopularItem(
                    imgUrl: 'assets/images/img_product-popular-2.png',
                    title: 'Poan Chair',
                    price: 34,
                  ),
                  HomePopularItem(
                    imgUrl: 'assets/images/img_product-popular-3.png',
                    title: 'Poan Chair',
                    price: 34,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 38),
          ],
        ),
      ),
    );
  }
}
