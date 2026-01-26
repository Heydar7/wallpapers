import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/gridview.dart';

class Favorites extends StatelessWidget {
  const Favorites({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      //screen
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //appbar
              appBarWithTitle('Favorites', context),
              //gridView
              gridView(false, true, 10, context),
            ],
          ),
        ),
      ),
    );
  }
}
