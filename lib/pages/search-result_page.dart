import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:cspace_flutter_animation/pages/widgets/product-grid_dart.dart';
import 'package:cspace_flutter_animation/pages/widgets/product-list_item.dart';
import 'package:cspace_flutter_animation/pages/widgets/skeleton_item.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatefulWidget {
  const SearchResult({super.key});

  @override
  State<SearchResult> createState() => _SearchResultState();
}

class _SearchResultState extends State<SearchResult> {
  bool isLoading = true;
  bool isShowGrid = true;

  @override
  void initState() {
    Future.delayed(
      const Duration(seconds: 2),
      () {
        setState(() {
          isLoading = false;
        });
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: appBar(),
        body: TabBarView(
          children: [
            buildBody(),
            buildBody(),
            buildBody(),
            buildBody(),
          ],
        ),
      ),
    );
  }

  PreferredSize appBar() {
    return PreferredSize(
      preferredSize: const Size(double.infinity, 120),
      child: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: whiteColor,
        elevation: 0,
        title: Row(
          children: [
            GestureDetector(
                onTap: () => Navigator.pop(context),
                child: Icon(Icons.chevron_left, color: blackColor)),
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
            ),
            const SizedBox(width: 18),
            Image.asset('assets/icons/ic_filter_dark.png', width: 24),
          ],
        ),
        bottom: TabBar(
          indicatorColor: blackColor,
          labelColor: blackColor,
          labelStyle: blackTextStyle,
          isScrollable: true,
          tabs: [
            Tab(text: 'Chair'),
            Tab(text: 'Table'),
            Tab(text: 'Accessories'),
            Tab(text: 'Living Room'),
          ],
        ),
      ),
    );
  }

  Widget buildBody() {
    return ListView(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      children: [
        const SizedBox(height: 30),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Result for: Poang',
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semibold,
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  isShowGrid = !isShowGrid;
                });
              },
              child: Image.asset(
                isShowGrid
                    ? 'assets/icons/ic_list_dark.png'
                    : 'assets/icons/ic_grid_dark.png',
                width: 24,
              ),
            )
          ],
        ),
        const SizedBox(height: 20),
        isLoading
            ? buildLoading()
            : isShowGrid
                ? buildGrid()
                : buildList(),
      ],
    );
  }

  Widget buildLoading() {
    return const Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: [
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
      ],
    );
  }

  Widget buildGrid() {
    return const Wrap(
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
    );
  }

  Widget buildList() {
    return const Column(
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
    );
  }
}
