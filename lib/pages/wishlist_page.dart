import 'package:cspace_flutter_animation/pages/widgets/product-grid_dart.dart';
import 'package:cspace_flutter_animation/pages/widgets/product-list_item.dart';
import 'package:flutter/material.dart';

import '../configs/styles.dart';
import 'widgets/skeleton_item.dart';

class Wishlist extends StatefulWidget {
  const Wishlist({super.key});

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  int? currentIndex = 0;

  bool isLoading = true;
  bool isShowGrid = true;

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: appBar(),
        bottomNavigationBar: bottomNavBar(),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: 24),
          children: [
            const SizedBox(height: 30),
            isLoading
                ? buildLoading()
                : isShowGrid
                    ? buildGrid()
                    : buildList(),
          ],
        ));
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 60),
      child: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            GestureDetector(
              onTap: () => Navigator.pop(context),
              child: Icon(Icons.chevron_left, color: blackColor),
            ),
            const SizedBox(width: 18),
            Text(
              'Wishlist',
              style: blackTextStyle.copyWith(
                fontSize: 18,
                fontWeight: semibold,
              ),
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.pushNamed(context, '/search');
              },
              child: Image.asset('assets/icons/ic_search_dark.png', width: 24),
            ),
            const SizedBox(width: 18),
            GestureDetector(
              onTap: () {
                setState(() {
                  isShowGrid = !isShowGrid;
                });
              },
              child: Image.asset(
                isShowGrid
                    ? 'assets/icons/ic_list_dark.png'
                    : 'assets/icons/ic_grid_dark.png',
                width: 24,
              ),
            )
          ],
        ),
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
        onTap: (value) {
          if (value == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (value == 2) {
            Navigator.pushNamed(context, '/profile');
          }
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_home_dark.png',
              color: blackColor,
              width: 24,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Image.asset(
                'assets/icons/ic_wishlist_dark.png',
                color: blueColor,
                width: 24,
              ),
              label: 'Wishlist'),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_profile_dark.png',
              color: blackColor,
              width: 24,
            ),
            label: 'Profile',
          )
        ],
      ),
    );
  }

  Widget buildLoading() {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: [
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
      ],
    );
  }

  Widget buildGrid() {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: [
        ProductGridItem(
          imgUrl: 'assets/images/img_product-grid-1.png',
          title: 'Poan Chair',
          price: 34,
        ),
        ProductGridItem(
          imgUrl: 'assets/images/img_product-grid-2.png',
          title: 'Poan Chair',
          price: 34,
        ),
        ProductGridItem(
          imgUrl: 'assets/images/img_product-grid-3.png',
          title: 'Poan Chair',
          price: 34,
        ),
        ProductGridItem(
          imgUrl: 'assets/images/img_product-grid-4.png',
          title: 'Poan Chair',
          price: 34,
        ),
      ],
    );
  }

  Widget buildList() {
    return const Column(
      children: [
        ProductListItem(
          imgUrl: 'assets/images/img_product-list-1.png',
          title: 'Poan Chair',
          price: 34,
        ),
        ProductListItem(
          imgUrl: 'assets/images/img_product-list-2.png',
          title: 'Poan Chair',
          price: 34,
        ),
        ProductListItem(
          imgUrl: 'assets/images/img_product-list-3.png',
          title: 'Poan Chair',
          price: 34,
        ),
        ProductListItem(
          imgUrl: 'assets/images/img_product-list-4.png',
          title: 'Poan Chair',
          price: 34,
        ),
      ],
    );
  }
}
