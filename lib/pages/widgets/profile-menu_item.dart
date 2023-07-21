import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;
  final bool theme;

  const ProfileMenuItem({
    super.key,
    required this.iconUrl,
    required this.title,
    required this.theme,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Image.asset(
            iconUrl,
            width: 24,
            color: theme ? blackColor : whiteColor,
          ),
          const SizedBox(width: 20),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semibold,
              color: theme ? blackColor : whiteColor,
            ),
          ),
          const Spacer(),
          Icon(
            Icons.chevron_right,
            color: theme ? greyColor : whiteColor,
          )
        ],
      ),
    );
  }
}
