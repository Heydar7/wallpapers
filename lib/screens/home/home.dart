import 'package:flutter/material.dart';
import 'package:wallpaper/widgets/components/colors.dart';
import 'package:wallpaper/widgets/components/text_style.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/widgets/wallpapers_title.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        //screen
        body: SingleChildScrollView(
          child: SafeArea(
            child: Column(
              children: [
                //appBar
                Padding(
                  padding: const EdgeInsets.only(
                    left: 8,
                    right: 8,
                    top: 16,
                    bottom: 16,
                  ),
                  child: Row(
                    children: [
                      //left
                      Text(
                        'Home',
                        style: CustomStyle.title,
                      ),
                      //spacer
                      const Spacer(),
                      //right | pro
                      Container(
                        height: 32,
                        width: 61,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColors.purple,
                        ),
                        child: Row(
                          children: [
                            //icon
                            const Icon(
                              IconlyBold.star,
                              color: CustomColors.white,
                              size: 18,
                            ),
                            //sizedBox
                            const SizedBox(width: 8),
                            //text
                            Text(
                              'Pro',
                              style: CustomStyle.pro,
                            ),
                          ],
                        ),
                      ),
                      //sizedBox
                      const SizedBox(width: 8),
                      //heart
                      Icon(
                        IconlyLight.heart,
                        color: CustomColors.white.withOpacity(0.50),
                        size: 28,
                      ),
                    ],
                  ),
                ),
                //banner
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 140,
                    padding: const EdgeInsets.only(
                      left: 8,
                      right: 8,
                      top: 16,
                      bottom: 16,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/banner.png'),
                      ),
                    ),
                    //blur | content
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
                        const SizedBox(height: 8),
                        //headline
                        Text(
                          'Best for iOS 26',
                          style: CustomStyle.bannerHeadline,
                        ),
                        //subtitle
                        Text(
                          "Bring the new version's visuals to life",
                          style: CustomStyle.bannerSubtitle,
                        ),
                      ],
                    ),
                  ),
                ),
                //sizedBox
                const SizedBox(height: 8),
                //live wallpapers
                wallpapersTitle('Live Wallpapers 🎞'),
                //wallpapers
                SizedBox(
                  height: 214,
                  child: GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 120,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColors.purple,
                        ),
                        child: Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 8, left: 8),
                              child: Container(
                                width: 61,
                                height: 30,
                                padding: const EdgeInsets.all(5),
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                  color: CustomColors.blur.withOpacity(0.75),
                                ),
                                child: Row(
                                  children: [
                                    //icon
                                    Image.asset(
                                      'assets/live.png',
                                      height: 18,
                                      width: 18,
                                    ),
                                    //sizedBox
                                    const SizedBox(width: 5),
                                    //live
                                    Text(
                                      'Live',
                                      style: CustomStyle.live,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
                //sizedBox
                const SizedBox(height: 8),
                //popular wallpapers
                wallpapersTitle('Popular Wallpapers 🖼'),
                //wallpapers
                SizedBox(
                  height: 214,
                  child: GridView.builder(
                    itemCount: 4,
                    shrinkWrap: true,
                    padding: const EdgeInsets.all(8),
                    scrollDirection: Axis.horizontal,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 8,
                      mainAxisExtent: 120,
                    ),
                    itemBuilder: (context, index) {
                      return Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: CustomColors.purple,
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
