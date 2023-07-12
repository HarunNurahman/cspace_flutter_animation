import 'package:flutter/material.dart';

class SkeletonItem extends StatelessWidget {
  const SkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        width: (MediaQuery.of(context).size.width - 66) / 2,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(),
      ),
    );
  }
}
