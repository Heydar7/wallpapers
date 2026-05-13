import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/data/wallpapers_remote_data_source.dart';
import 'package:wallpaper/feature/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/ui/widgets/scroll.dart';

class MoreWallpapers extends StatefulWidget {
  final String title;
  const MoreWallpapers({super.key, required this.title});

  @override
  State<MoreWallpapers> createState() => _MoreWallpapersState();
}

class _MoreWallpapersState extends BaseScrollScreen<MoreWallpapers> {
  late final Stream<List<String>> categoryWallpaper;

  @override
  void initState() {
    super.initState();
    categoryWallpaper = getImagesByCategory(widget.title.toLowerCase());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          //appBar
          appBarWithTitle(
            title: widget.title,
            context: context,
            scrolled: isScrolled,
          ),
          //gridView
          StreamBuilder<List<String>>(
            stream: categoryWallpaper,
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
