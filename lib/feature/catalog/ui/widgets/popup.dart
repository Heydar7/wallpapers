import 'dart:ui';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';

Widget fullImagePopup(String title, String imagePath, VoidCallback onTap) {
  return Positioned.fill(
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Stack(
        children: [
          //blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(color: CustomColors.blur2.withOpacity(0.5)),
          ),
          //hint card
          Align(
            alignment: Alignment.center,
            child: Container(
              // width: 140,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColors.blur.withOpacity(0.75),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //image
                  Image.asset(
                    imagePath,
                    height: 100,
                    width: 100,
                  ),
                  //text
                  Text(
                    title,
                    style: CustomStyle.live,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget getPremiumPopup(String title, String imagePath, VoidCallback onTap) {
  return Positioned.fill(
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Stack(
        children: [
          //blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
            child: Container(color: CustomColors.blur2.withOpacity(0.5)),
          ),
          //premium card
          Align(
            alignment: Alignment.center,
            child: Container(
              // width: 140,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColors.blur.withOpacity(0.75),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  //image
                  Image.asset(
                    imagePath,
                    height: 100,
                    width: 100,
                  ),
                  //text
                  Text(
                    title,
                    style: CustomStyle.live,
                    textAlign: TextAlign.center,
                  ),
                  //sizedBox
                  const SizedBox(height: 16),
                  //button
                  Container(
                    width: 140,
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      color: CustomColors.purple,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Text(
                      'Get Premium',
                      style: CustomStyle.live,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget loading(VoidCallback onTap) {
  double progress = 24;

  return Positioned.fill(
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: onTap,
      child: Stack(
        children: [
          //blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: CustomColors.blur2.withOpacity(0.5)),
          ),
          // swipe hint card
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColors.blur.withOpacity(0.75),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  //background
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      value: 1,
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation(
                        CustomColors.white.withOpacity(0.1),
                      ),
                    ),
                  ),
                  //progress arc
                  SizedBox(
                    width: 80,
                    height: 80,
                    child: CircularProgressIndicator(
                      value: progress / 100,
                      strokeWidth: 3,
                      strokeCap: StrokeCap.round,
                      valueColor: const AlwaysStoppedAnimation(
                        CustomColors.purple,
                      ),
                    ),
                  ),
                  //flip counter
                  AnimatedFlipCounter(
                      value: progress,
                      fractionDigits: 0,
                      suffix: '%',
                      duration: const Duration(milliseconds: 300),
                      textStyle: CustomStyle.loading),
                ],
              ),
            ),
          ),
        ],
      ),
    ),
  );
}
