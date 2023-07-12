import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class OnBoardingItem extends StatelessWidget {
  final String imgUrl;
  final String title;
  final String subtitle;

  const OnBoardingItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 100, bottom: 130),
          child: Image.asset(
            imgUrl,
            width: MediaQuery.of(context).size.width * 0.8,
          ),
        ),
        Text(
          title,
          style: blackTextStyle.copyWith(
            fontSize: 26,
          ),
        ),
        const SizedBox(height: 10),
        Text(
          subtitle,
          style: greyTextStyle.copyWith(
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
