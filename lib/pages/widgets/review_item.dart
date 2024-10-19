import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class ReviewItem extends StatelessWidget {
  final String imgUrl;
  final String name;
  final String review;
  final List<String> items;

  const ReviewItem({
    super.key,
    required this.imgUrl,
    required this.name,
    required this.review,
    required this.items,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // REVIEWER PROFILE PICTURE
          Image.asset('assets/images/$imgUrl', width: 56),
          const SizedBox(width: 36),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: blackTextStyle.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 8),
                // RATING
                Row(
                  children: [
                    Icon(Icons.star, color: yellowColor),
                    Icon(Icons.star, color: yellowColor),
                    Icon(Icons.star, color: yellowColor),
                    Icon(Icons.star, color: yellowColor),
                    Icon(Icons.star, color: yellowColor),
                  ],
                ),
                const SizedBox(height: 8),
                // REVIEW TEXT
                Text.rich(
                  TextSpan(
                    text: review,
                    style: greyTextStyle.copyWith(height: 1.5),
                    children: [
                      TextSpan(
                        text: ' more',
                        style: blackTextStyle,
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 16),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: items
                        .map((item) => Container(
                              margin: const EdgeInsets.only(right: 20),
                              child: Image.asset(
                                item,
                                width: 72,
                              ),
                            ))
                        .toList(),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
