import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class HomeCategoryItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;

  const HomeCategoryItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 123,
      width: MediaQuery.of(context).size.width - (2 * 24),
      child: Stack(
        children: [
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: 102,
              decoration: BoxDecoration(
                color: whiteColor,
                borderRadius: BorderRadius.circular(14),
              ),
              child: Row(
                children: [
                  const SizedBox(width: 150),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: blackTextStyle.copyWith(
                          fontSize: 18,
                          fontWeight: semibold,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: greyTextStyle.copyWith(
                          fontWeight: semibold,
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ),
          Image.asset(
            imgUrl,
            height: 122,
          ),
        ],
      ),
    );
  }
}
