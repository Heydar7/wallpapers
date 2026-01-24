import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/widgets/components/colors.dart';
import 'package:wallpaper/widgets/components/text_style.dart';
import 'package:wallpaper/widgets/gridview.dart';

class MoreWallpapers extends StatefulWidget {
  final String title;
  const MoreWallpapers({super.key, required this.title});

  @override
  State<MoreWallpapers> createState() => _MoreWallpapersState();
}

class _MoreWallpapersState extends State<MoreWallpapers> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
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
                    GestureDetector(
                      onTap: () => context.pop(),
                      child: const Icon(
                        IconlyLight.arrow_left_2,
                        color: CustomColors.purple,
                        size: 24,
                      ),
                    ),
                    //center
                    Expanded(
                      child: Center(
                        child: Text(
                          widget.title,
                          style: CustomStyle.wallpapersTitle,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              //gridView
              gridView(false, true, 10, context)
            ],
          ),
        ),
      ),
    );
  }
}
