import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class ProductGridItem extends StatefulWidget {
  final String imgUrl;
  final String title;
  final int price;

  const ProductGridItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.price,
  });

  @override
  State<ProductGridItem> createState() => _ProductGridItemState();
}

class _ProductGridItemState extends State<ProductGridItem> {
  bool isWishlist = false;

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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(widget.imgUrl),
            const SizedBox(height: 20),
            Text(
              widget.title,
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '\$${widget.price}',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: semibold,
                  ),
                ),
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
            )
          ],
        ),
      ),
    );
  }
}
