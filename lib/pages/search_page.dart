import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:cspace_flutter_animation/pages/widgets/product-list_item.dart';
import 'package:flutter/material.dart';

class Search extends StatelessWidget {
  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteGrey,
      appBar: PreferredSize(
        preferredSize: const Size(double.infinity, 70),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: whiteColor,
          elevation: 0,
          title: Row(
            children: [
              GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.chevron_left, color: blackColor),
              ),
              const SizedBox(width: 18),
              Expanded(
                child: Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: whiteGrey,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          textInputAction: TextInputAction.go,
                          onFieldSubmitted: (value) {
                            Navigator.pushNamed(context, '/search-result');
                          },
                          decoration: InputDecoration.collapsed(
                            hintText: 'Search furniture',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: 16,
                              fontWeight: semibold,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Icon(Icons.close, color: greyColor)
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Recommendation',
                style: blackTextStyle.copyWith(
                  fontSize: 16,
                  fontWeight: semibold,
                ),
              ),
              const SizedBox(height: 20),
              const Column(
                children: [
                  ProductListItem(
                    imgUrl: 'assets/images/img_product-list-1.png',
                    title: 'Poan Chair',
                    price: 34,
                  ),
                  ProductListItem(
                    imgUrl: 'assets/images/img_product-list-2.png',
                    title: 'Poan Chair',
                    price: 34,
                  ),
                  ProductListItem(
                    imgUrl: 'assets/images/img_product-list-3.png',
                    title: 'Poan Chair',
                    price: 34,
                  ),
                  ProductListItem(
                    imgUrl: 'assets/images/img_product-list-4.png',
                    title: 'Poan Chair',
                    price: 34,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  // PreferredSize appBar() {
  //   return PreferredSize(
  //     preferredSize: const Size(double.infinity, 70),
  //     child: AppBar(
  //       automaticallyImplyLeading: false,
  //       backgroundColor: whiteColor,
  //       elevation: 0,
  //       title: Row(
  //         children: [
  //           Icon(Icons.chevron_left, color: blackColor),
  //           const SizedBox(width: 18),
  //           Expanded(
  //             child: Container(
  //               padding: const EdgeInsets.all(16),
  //               decoration: BoxDecoration(
  //                 color: whiteGrey,
  //                 borderRadius: BorderRadius.circular(14),
  //               ),
  //               child: Row(
  //                 children: [
  //                   Expanded(
  //                     child: TextFormField(
  //                       textInputAction: TextInputAction.go,
  //                       onFieldSubmitted: (value) {
  //                         Navigator.pushNamed(context, '/search-result');
  //                       },
  //                       decoration: InputDecoration.collapsed(
  //                         hintText: 'Search furniture',
  //                         hintStyle: greyTextStyle.copyWith(
  //                           fontSize: 16,
  //                           fontWeight: semibold,
  //                         ),
  //                       ),
  //                     ),
  //                   ),
  //                   const SizedBox(width: 10),
  //                   Icon(Icons.close, color: greyColor)
  //                 ],
  //               ),
  //             ),
  //           )
  //         ],
  //       ),
  //     ),
  //   );
  // }
}
