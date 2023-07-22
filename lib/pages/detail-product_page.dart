import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class DetailProduct extends StatefulWidget {
  const DetailProduct({super.key});

  @override
  State<DetailProduct> createState() => _DetailProductState();
}

class _DetailProductState extends State<DetailProduct> {
  Color indicatorColor = const Color(0xFF394A54);
  double indicatorMargin = 5;
  int productIndex = 1;
  bool isExpand = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteGrey,
      bottomNavigationBar: isExpand
          ? null
          : Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: whiteColor,
                boxShadow: [
                  BoxShadow(
                    color: greyColor,
                    blurRadius: 5,
                    offset: const Offset(0, 2),
                  )
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      height: 56,
                      margin: const EdgeInsets.only(right: 16),
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: blackAccent,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Text(
                          'Buy Now',
                          style: whiteTextStyle.copyWith(
                            fontSize: 18,
                            fontWeight: semibold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 56,
                    height: 56,
                    decoration: BoxDecoration(
                      color: whiteGrey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Image.asset(
                        'assets/icons/ic_shopping-cart_dark.png',
                        width: 24,
                      ),
                    ),
                  )
                ],
              ),
            ),
      body: Stack(
        children: [
          Image.asset('assets/images/img_background.png'),
          // BACK BUTTON
          GestureDetector(
            onTap: () => Navigator.pop(context),
            child: Container(
              margin: const EdgeInsets.only(top: 66, left: 24),
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: whiteColor,
                border: Border.all(color: lineDark),
              ),
              child: const Icon(Icons.chevron_left),
            ),
          ),
          // PRODUCT IMAGE
          Container(
            margin: const EdgeInsets.only(top: 100),
            child: Image.asset(
              'assets/images/img_detail-product-$productIndex.png',
            ),
          ),
          SizedBox.expand(
            child: DraggableScrollableSheet(
              initialChildSize: 0.35,
              minChildSize: 0.35,
              maxChildSize: 1,
              builder: (context, scrollController) {
                return Container(
                  decoration: BoxDecoration(
                    color: whiteColor,
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(40),
                    ),
                  ),
                  child: NotificationListener(
                    onNotification: (Notification notification) {
                      if (notification is ScrollEndNotification) {
                        if (notification.metrics.minScrollExtent == -1.0) {
                          setState(() {
                            isExpand = true;
                          });
                        } else {
                          setState(() {
                            isExpand = false;
                          });
                        }
                      }
                      return true;
                    },
                    child: SingleChildScrollView(
                      controller: scrollController,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 16),
                            // BUTTON INDICATOR
                            Center(
                              child: Container(
                                height: 4,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: lineDark,
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                            ),
                            const SizedBox(height: 10),
                            // PRODUCT TITLE
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Poang Chair',
                                  style: blackTextStyle.copyWith(
                                    fontSize: 24,
                                    fontWeight: semibold,
                                  ),
                                ),
                                Text(
                                  '\$219',
                                  style: blackTextStyle.copyWith(fontSize: 24),
                                )
                              ],
                            ),
                            const SizedBox(height: 16),
                            // STORE
                            Text(
                              'IKOE',
                              style: blackTextStyle.copyWith(fontSize: 18),
                            ),
                            const SizedBox(height: 16),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                height: 50,
                                child: Stack(
                                  alignment: Alignment.centerLeft,
                                  children: [
                                    // COLOR INDICATOR
                                    Row(
                                      children: [
                                        colorIndicator(
                                            const Color(0xFF394A54), 0),
                                        colorIndicator(
                                            const Color(0xFFEBA823), 1),
                                        colorIndicator(
                                            const Color(0xFF757477), 2),
                                        colorIndicator(
                                            const Color(0xFF29282C), 3),
                                        colorIndicator(
                                            const Color(0xFFECE9DA), 4),
                                      ],
                                    ),
                                    AnimatedContainer(
                                      duration:
                                          const Duration(milliseconds: 150),
                                      width: 40,
                                      height: 40,
                                      margin: EdgeInsets.only(
                                        left: indicatorMargin,
                                      ),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: indicatorColor,
                                        border: Border.all(
                                          width: 3,
                                          color: whiteColor,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            // PRODUCT DESCRIPTION
                            const SizedBox(height: 16),
                            Text(
                              'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                              textAlign: TextAlign.justify,
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semibold,
                                height: 2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                              textAlign: TextAlign.justify,
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semibold,
                                height: 2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                              textAlign: TextAlign.justify,
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semibold,
                                height: 2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                              textAlign: TextAlign.justify,
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semibold,
                                height: 2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                              textAlign: TextAlign.justify,
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semibold,
                                height: 2,
                              ),
                            ),
                            const SizedBox(height: 16),
                            Text(
                              'Bringing new life to an old favourite. We first introduced this chair in the 1950’s. Some 60 years later we brought it back into the range with the same craftsmanship, comfort and appearance. Enjoy!',
                              textAlign: TextAlign.justify,
                              style: greyTextStyle.copyWith(
                                fontSize: 14,
                                fontWeight: semibold,
                                height: 2,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }

  Widget colorIndicator(Color color, int currentIndex) {
    return GestureDetector(
      onTap: () {
        setState(() {
          indicatorColor = color;
          indicatorMargin = 5 + (currentIndex * 70);
          productIndex = currentIndex + 1;
        });
      },
      child: Container(
        width: 50,
        height: 50,
        margin: const EdgeInsets.only(right: 20),
        decoration: BoxDecoration(shape: BoxShape.circle, color: color),
      ),
    );
  }

  Widget bottomNavBar() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: whiteColor,
        boxShadow: [
          BoxShadow(
            color: greyColor,
            blurRadius: 5,
            offset: const Offset(0, 2),
          )
        ],
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              width: double.infinity,
              height: 56,
              margin: const EdgeInsets.only(right: 16),
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: blackAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: Text(
                  'Buy Now',
                  style: whiteTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
              ),
            ),
          ),
          Container(
            width: 56,
            height: 56,
            decoration: BoxDecoration(
              color: whiteGrey,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Center(
              child: Image.asset(
                'assets/icons/ic_shopping-cart_dark.png',
                width: 24,
              ),
            ),
          )
        ],
      ),
    );
  }
}
