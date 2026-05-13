import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/data/wallpapers_remote_data_source.dart';
import 'package:wallpaper/feature/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/ui/widgets/banner.dart';
import 'package:wallpaper/feature/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/ui/widgets/scroll.dart';
import 'package:wallpaper/feature/ui/widgets/wallpapers_title.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends BaseScrollScreen<Home> {
  late final Stream<Map<String, List<String>>> wallpapersStream;

  @override
  void initState() {
    super.initState();
    wallpapersStream = getWallpaperData();
  }

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
          const Banners(name: 'home_banner'),
          //list
          StreamBuilder<Map<String, List<String>>>(
            stream: wallpapersStream,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                //loading
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }
              //error
              if (snapshot.hasError) {
                return const SliverToBoxAdapter();
              }

              final data = snapshot.data ?? {};

              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final entry = data.entries.elementAt(index);
                    final title = entry.key;
                    final images = entry.value;

                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //title
                        wallpapersTitle(title, context),
                        //grid
                        SizedBox(
                          height: 214,
                          child: ListView.separated(
                            padding: const EdgeInsets.all(16),
                            scrollDirection: Axis.horizontal,
                            itemCount: 5,
                            separatorBuilder: (_, __) =>
                                const SizedBox(width: 8),
                            itemBuilder: (_, i) {
                              return SizedBox(
                                width: 120,
                                child: GridItem(
                              
                                  number: i,
                                  images: images,
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: data.length,
                ),
              );
            },
          )
        ],
      ),
      //
      floatingActionButton: floatingButton(scrollController),
    );
  }
}
