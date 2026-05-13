import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/data/wallpapers_remote_data_source.dart';
import 'package:wallpaper/feature/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/ui/widgets/scroll.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends BaseScrollScreen<Live> {
  late final Stream<List<String>> wallpapersStream;

  @override
  void initState() {
    super.initState();
    wallpapersStream = getLiveWallpaperData();
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
            title: "Live Wallpapers",
            context: context,
            scrolled: isScrolled,
          ),
          //gridView
          StreamBuilder<List<String>>(
            stream: wallpapersStream,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                //loadoing | error
                return const SliverToBoxAdapter(
                  child: Center(child: CircularProgressIndicator()),
                );
              }

              final images = snapshot.data!;
              return gridViewSliver(
                false,
                images.length,
                images,
                context,
              );
            },
          ),
        ],
      ),
      //
      floatingActionButton: floatingButton(scrollController),
    );
  }
}
