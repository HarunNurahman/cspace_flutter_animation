import 'package:cspace_flutter_animation/pages/widgets/profile-menu_item.dart';
import 'package:flutter/material.dart';

import '../configs/styles.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
              Padding(
                padding: const EdgeInsets.only(
                  left: 24,
                  right: 24,
                  top: 30,
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const CircleAvatar(
                          backgroundImage: AssetImage(
                            'assets/images/img_profile.jpg',
                          ),
                          radius: 60,
                        ),
                        const SizedBox(height: 32),
                        Text(
                          'Harun Nurahman',
                          style: blackTextStyle.copyWith(
                            fontSize: 24,
                            fontWeight: medium,
                          ),
                        )
                      ],
                    ),
                    Container(
                      width: 88,
                      height: 44,
                      padding: const EdgeInsets.all(4),
                      decoration: BoxDecoration(
                        color: whiteColor,
                        borderRadius: BorderRadius.circular(100),
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Image.asset('assets/icons/ic_day-switch.png'),
                      ),
                    )
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                margin: const EdgeInsets.only(top: 50),
                padding: const EdgeInsets.symmetric(
                  horizontal: 24,
                  vertical: 32,
                ),
                decoration: BoxDecoration(
                  color: whiteColor,
                  borderRadius: BorderRadius.circular(36),
                ),
                child: const Column(
                  children: [
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_profile_dark.png',
                      title: 'My Profile',
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_address_dark.png',
                      title: 'My Address',
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_order_dark.png',
                      title: 'My Order',
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_payment_dark.png',
                      title: 'Payment Method',
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_wishlist_dark.png',
                      title: 'My Wishlist',
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_faq_dark.png',
                      title: 'Frequently Asked Question',
                    ),
                    ProfileMenuItem(
                      iconUrl: 'assets/icons/ic_customer-care_dark.png',
                      title: 'Customer Care',
                    ),
                  ],
                ),
              )
            ],
          ),
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
        onTap: (value) {
          if (value == 0) {
            Navigator.pushNamed(context, '/home');
          } else if (value == 1) {
            Navigator.pushNamed(context, '/wishlist');
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
                color: blackColor,
                width: 24,
              ),
              label: 'Wishlist'),
          BottomNavigationBarItem(
            icon: Image.asset(
              'assets/icons/ic_profile_dark.png',
              color: blueColor,
              width: 24,
            ),
            label: 'Profile',
          )
        ],
      ),
    );
  }
}
