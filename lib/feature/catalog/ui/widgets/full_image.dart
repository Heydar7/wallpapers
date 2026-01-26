import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/popup.dart';

enum TutorialStep { loading, swipe, touch, premium, none }

TutorialStep step = TutorialStep.loading;

class FullImage extends StatefulWidget {
  final String path;
  const FullImage({super.key, required this.path});

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  bool like = false;

  Widget check() {
    switch (step) {
      //loading
      case TutorialStep.loading:
        return loading(
          () => setState(() => step = TutorialStep.swipe),
        );
      //swipe
      case TutorialStep.swipe:
        return fullImagePopup(
          'Swipe up to see\nother wallpapers',
          'assets/swipe.png',
          () => setState(() => step = TutorialStep.touch),
        );
      //touch
      case TutorialStep.touch:
        return fullImagePopup(
          'Tap the screen to \nsee the wallpaper \non your device',
          'assets/touch.png',
          () => setState(() => step = TutorialStep.premium),
        );
      //premium
      case TutorialStep.premium:
        return getPremiumPopup(
          'Unlock all premium wallpapers and get \nthe most out of Premium today',
          'assets/crown.png',
          () => setState(() => step = TutorialStep.none),
        );
      //none
      case TutorialStep.none:
        return const SizedBox.shrink();
    }
  }

  List images = [
    'assets/wallpaper.png',
    'assets/wallpaper2.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      //screen
      body: Stack(
        children: [
          //image
          PageView.builder(
            scrollDirection: Axis.vertical,
            itemCount: 2,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed('/iosLockScreen'),
                child: Image.asset(
                  images[index],
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                ),
              );
            },
          ),
          //appbar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16, right: 16, top: 11.5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //left
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.close_rounded,
                      color: CustomColors.white,
                      size: 28,
                    ),
                  ),
                  //heart
                  GestureDetector(
                    onTap: () => setState(() {
                      like = !like;
                    }),
                    child: Icon(
                      like ? IconlyBold.heart : IconlyLight.heart,
                      color: like ? CustomColors.red : CustomColors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //button
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                child: Container(
                  height: 64,
                  width: 64,
                  padding: const EdgeInsets.all(16),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.white,
                  ),
                  child: Image.asset(
                    'assets/download.png',
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
            ),
          ),
          //
          check(),
        ],
      ),
    );
  }
}
