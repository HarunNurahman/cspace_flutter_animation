import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:cspace_flutter_animation/pages/widgets/home-category_item.dart';
import 'package:cspace_flutter_animation/pages/widgets/product-grid_dart.dart';
import 'package:flutter/material.dart';

class ProductCategory extends StatelessWidget {
  const ProductCategory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteGrey,
      appBar: PreferredSize(
        preferredSize: const Size(
          double.infinity,
          60,
        ),
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
                'Chair',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: semibold,
                ),
              ),
              const Spacer(),
              Image.asset('assets/icons/ic_search_dark.png', width: 24),
              const SizedBox(width: 18),
              Image.asset('assets/icons/ic_filter_dark.png', width: 24)
            ],
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.only(left: 24, right: 24, top: 24),
        children: const [
          HomeCategoryItem(
            imgUrl: 'assets/images/img_product-category-1.png',
            title: 'Minimalis Couch',
            subtitle: 'Couch',
          ),
          SizedBox(height: 24),
          Wrap(
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
          ),
        ],
      ),
    );
  }
}
