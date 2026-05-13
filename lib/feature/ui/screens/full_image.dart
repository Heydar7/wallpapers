import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/feature/ui/widgets/popup.dart';

enum TutorialStep { swipe, touch, none }

TutorialStep step = TutorialStep.swipe;

class FullImage extends StatefulWidget {
  final List<String> images;
  final int number;
  const FullImage({super.key, required this.images, required this.number});

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  final controller = PageController();
  bool like = false;

  Widget check() {
    switch (step) {
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
          () => setState(() => step = TutorialStep.none),
        );
      //none
      case TutorialStep.none:
        return const SizedBox.shrink();
    }
  }

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.jumpToPage(widget.number);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      //screen
      body: Stack(
        children: [
          //image
          PageView.builder(
            controller: controller,
            scrollDirection: Axis.vertical,
            itemCount: widget.images.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () => GoRouter.of(context).pushNamed(
                  '/iosLockScreen',
                  extra: widget.images[index],
                ),
                child: Image.network(
                  widget.images[index],
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.cover,
                  //loading
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }

                    final progress = loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes! *
                            100
                        : 0.0;
                    return loading(progress);
                  },
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
                onTap: () => premiumPopup(context),
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
