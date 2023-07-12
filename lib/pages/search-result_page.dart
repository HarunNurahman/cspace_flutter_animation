import 'package:cspace_flutter_animation/configs/styles.dart';
import 'package:cspace_flutter_animation/pages/widgets/skeleton_item.dart';
import 'package:flutter/material.dart';

class SearchResult extends StatelessWidget {
  const SearchResult({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size(double.infinity, 120),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: whiteColor,
            elevation: 0,
            title: Row(
              children: [
                Icon(Icons.chevron_left, color: blackColor),
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
        ),
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
            Image.asset('assets/icons/ic_list_dark.png', width: 24)
          ],
        ),
        const SizedBox(height: 20),
        buildLoading(),
      ],
    );
  }

  Widget buildLoading() {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.center,
      spacing: 18,
      runSpacing: 18,
      children: [
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
        SkeletonItem(),
      ],
    );
  }

  Widget buildGrid() {
    return Container();
  }
}
