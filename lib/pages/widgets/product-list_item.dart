import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class ProductListItem extends StatefulWidget {
  final String imgUrl;
  final String title;
  final int price;

  const ProductListItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.price,
  });

  @override
  State<ProductListItem> createState() => _ProductListItemState();
}

class _ProductListItemState extends State<ProductListItem> {
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 18),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: whiteColor,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(widget.imgUrl, width: 60),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.title,
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(height: 6),
              Text(
                '\$${widget.price}',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              )
            ],
          ),
          const Spacer(),
          GestureDetector(
            onTap: () {
              setState(() {
                isWishlist = !isWishlist;
              });
            },
            child: Image.asset(
              isWishlist
                  ? 'assets/icons/btn_wishlist_on.png'
                  : 'assets/icons/btn_wishlist_off.png',
              width: 44,
            ),
          )
        ],
      ),
    );
  }
}
