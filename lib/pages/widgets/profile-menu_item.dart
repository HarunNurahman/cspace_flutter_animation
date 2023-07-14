import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class ProfileMenuItem extends StatelessWidget {
  final String iconUrl;
  final String title;

  const ProfileMenuItem({
    super.key,
    required this.iconUrl,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: Row(
        children: [
          Image.asset(iconUrl, width: 24),
          const SizedBox(width: 20),
          Text(
            title,
            style: blackTextStyle.copyWith(
              fontSize: 18,
              fontWeight: semibold,
            ),
          ),
          const Spacer(),
          Icon(Icons.chevron_right, color: greyColor)
        ],
      ),
    );
  }
}
