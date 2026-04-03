import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/scroll.dart';

class Live extends StatefulWidget {
  const Live({super.key});

  @override
  State<Live> createState() => _LiveState();
}

class _LiveState extends BaseScrollScreen<Live> {
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
          gridViewSliver(false, true, 10, context),
        ],
      ),
      //
      floatingActionButton: floatingButton(scrollController),
    );
  }
}
