import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/scroll.dart';

class MoreWallpapers extends StatefulWidget {
  final String title;
  const MoreWallpapers({super.key, required this.title});

  @override
  State<MoreWallpapers> createState() => _MoreWallpapersState();
}

class _MoreWallpapersState extends BaseScrollScreen<MoreWallpapers> {
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
          gridViewSliver(false, true, 10, context),
        ],
      ),
      //
      floatingActionButton: floatingButton(scrollController),
    );
  }
}
