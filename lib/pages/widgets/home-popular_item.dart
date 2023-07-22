import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:flutter/material.dart';

class HomePopularItem extends StatefulWidget {
  final String imgUrl;
  final String title;
  final int price;

  const HomePopularItem({
    super.key,
    required this.imgUrl,
    required this.title,
    required this.price,
  });

  @override
  State<HomePopularItem> createState() => _HomePopularItemState();
}

class _HomePopularItemState extends State<HomePopularItem> {
  bool isWishlist = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/detail'),
      child: Container(
        height: 300,
        child: Card(
          margin: const EdgeInsets.only(right: 24),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              Container(
                width: 200,
                height: 180,
                decoration: BoxDecoration(
                  color: whiteGrey,
                  borderRadius: const BorderRadius.vertical(
                    top: Radius.circular(10),
                  ),
                ),
                child: Center(
                  child: Image.asset(widget.imgUrl, width: 160),
                ),
              ),
              Container(
                width: 200,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.title,
                      style: blackTextStyle.copyWith(
                        fontSize: 18,
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
            ],
          ),
        ),
      ),
    );
  }
}
