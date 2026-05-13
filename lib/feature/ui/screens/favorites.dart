import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/ui/widgets/scroll.dart';

class Favorites extends StatefulWidget {
  const Favorites({super.key});

  @override
  State<Favorites> createState() => _FavoritesState();
}

class _FavoritesState extends BaseScrollScreen<Favorites> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          //appBar
          appBarWithTitle(
            title: "Favorites",
            context: context,
            scrolled: isScrolled,
          ),
          //gridView
          gridViewSliver(false, 1, ['https://picsum.photos/1200/2400'],context),
        ],
      ),
      //
      floatingActionButton: floatingButton(scrollController),
    );
  }
}
