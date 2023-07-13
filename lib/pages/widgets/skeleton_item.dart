import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class SkeletonItem extends StatelessWidget {
  const SkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: (MediaQuery.of(context).size.width - 82) / 2,
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Shimmer.fromColors(
              baseColor: lineDark,
              highlightColor: whiteGrey,
              child: Container(
                width: double.infinity,
                height: 120,
                color: lineDark,
              ),
            ),
            const SizedBox(height: 20),
            Shimmer.fromColors(
              baseColor: lineDark,
              highlightColor: whiteGrey,
              child: Container(
                width: double.infinity,
                height: 20,
                color: lineDark,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Shimmer.fromColors(
                  baseColor: lineDark,
                  highlightColor: whiteGrey,
                  child: Container(
                    width: 60,
                    height: 25,
                    color: lineDark,
                  ),
                ),
                Shimmer.fromColors(
                  baseColor: lineDark,
                  highlightColor: whiteGrey,
                  child: Container(
                    width: 44,
                    height: 44,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: lineDark,
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
