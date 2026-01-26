import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/wallpapers_title.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        //screen
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                //appBar
                appBarWithPremiumIcon('Home', context),
                //banner
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: GestureDetector(
                    onTap: () => GoRouter.of(context).pushNamed(
                      '/moreWallpapers',
                      extra: 'iOS 26',
                    ),
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      // height: 140,
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/banner.png'),
                        ),
                      ),
                      //content
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          //ios icon
                          Image.asset(
                            'assets/ios26.png',
                            height: 36,
                            width: 36,
                          ),
                          //sizedBox
                          const SizedBox(height: 17),
                          //headline
                          Text(
                            'Best for iOS 26',
                            style: CustomStyle.bannerHeadline,
                          ),
                          //sizedBox
                          const SizedBox(height: 4),
                          //subtitle
                          Text(
                            "Bring the new version's visuals to life",
                            style: CustomStyle.bannerSubtitle,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                //
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  padding: EdgeInsets.zero,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    var titles = [
                      'Live Wallpapers 🎞',
                      'Popular Wallpapers 🖼',
                    ];
                    return Column(
                      children: [
                        //title
                        wallpapersTitle(titles[index], context),
                        //
                        gridView(true, index == 0, 4, context),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
