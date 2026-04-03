import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/banner.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/scroll.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/wallpapers_title.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends BaseScrollScreen<Home> {
  final titles = [
    'Live Wallpapers 🎞',
    'Popular Wallpapers 🖼',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          //appBar
          appBarWithPremiumIcon(
            title: "Home",
            context: context,
            scrolled: isScrolled,
          ),
          //banner
          bannerSliver(
            'Best for iOS 26',
            "Bring the new version's visuals to life",
            'assets/ios26.png',
            context,
          ),
          //list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final isLive = index == 0;

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //title
                    wallpapersTitle(titles[index], context),
                    //content
                    SizedBox(
                      height: 214,
                      child: ListView.separated(
                        padding: const EdgeInsets.all(16),
                        scrollDirection: Axis.horizontal,
                        itemCount: 4,
                        separatorBuilder: (_, __) => const SizedBox(width: 8),
                        itemBuilder: (_, i) {
                          return SizedBox(
                            width: 120,
                            child: GridItem(isLive: isLive),
                          );
                        },
                      ),
                    ),
                  ],
                );
              },
              childCount: titles.length,
            ),
          ),
        ],
      ),
      //
      floatingActionButton: floatingButton(scrollController),
    );
  }
}
