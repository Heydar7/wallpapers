import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/gridview.dart';

class Live extends StatelessWidget {
  const Live({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      //screen
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //appBar
              appBarWithPremiumIcon('Live Wallpapers', context),
              //gridView
              gridView(false, true, 10, context),
            ],
          ),
        ),
      ),
    );
  }
}
