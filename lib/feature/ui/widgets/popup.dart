import 'dart:ui';
import 'package:animated_flip_counter/animated_flip_counter.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
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
            child: Container(color: CustomColors.blur2.withValues(alpha:0.5)),
          ),
          //hint card
          Align(
            alignment: Alignment.center,
            child: Container(
              // width: 140,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColors.blur.withValues(alpha:0.75),
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

Widget loading(double progress) {
  return Positioned.fill(
    child: GestureDetector(
      behavior: HitTestBehavior.opaque,
      child: Stack(
        children: [
          //blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: CustomColors.blur2.withValues(alpha:0.5)),
          ),
          // swipe hint card
          Align(
            alignment: Alignment.center,
            child: Container(
              width: 120,
              height: 120,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: CustomColors.blur.withValues(alpha:0.75),
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
                        CustomColors.white.withValues(alpha:0.1),
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

dynamic premiumPopup(BuildContext context) {
  final titles = [
    'Restore',
    'Terms of Use',
    'Privacy Policy',
  ];
  final urls = [
    'https://wallpaperfpw.framer.website',
    'https://wallpaperfpw.framer.website/terms-of-use/',
    'https://wallpaperfpw.framer.website/privacy-policy/',
  ];

  return showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    backgroundColor: CustomColors.transparent,
    builder: (context) {
      return Stack(
        children: [
          //blur
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
            child: Container(color: CustomColors.blur2.withValues(alpha:0.5)),
          ),
          //close
          GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () => context.pop(),
          ),
          //
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //close
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 75),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: GestureDetector(
                      onTap: () => context.pop(),
                      child: const Icon(
                        Icons.close_rounded,
                        color: CustomColors.white,
                        size: 28,
                      ),
                    ),
                  ),
                ),
                //spacer
                const Spacer(),

                //title
                Text(
                  'Unlock All',
                  style: CustomStyle.onboardingTitle,
                ),
                //sizedBox
                const SizedBox(height: 4),
                //subtitle
                Text.rich(
                  TextSpan(
                    text: 'Get 3 days free',
                    style: CustomStyle.loading,
                    children: [
                      TextSpan(
                        text:
                            ', then \$14.99/year\nAuto-renewable. Cancel Anytime',
                        style: CustomStyle.bannerSubtitle,
                      )
                    ],
                  ),
                ),
                //sizedBox
                const SizedBox(height: 24),
                //more options
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6),
                    color: CustomColors.purple.withValues(alpha:0.1),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      //text
                      Text(
                        'More Options',
                        style: CustomStyle.more,
                      ),
                      //sizedBox
                      const SizedBox(width: 4),
                      //arrow
                      const Icon(
                        IconlyLight.arrow_down_2,
                        size: 14,
                        color: CustomColors.purple,
                      ),
                    ],
                  ),
                ),
                //button
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 24,
                  ),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 51,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: CustomColors.purple,
                      ),
                      child: Text(
                        'Try It For Free',
                        style: CustomStyle.buttonText,
                      ),
                    ),
                  ),
                ),
                //protected title
                Padding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //icon
                      Image.asset('assets/protected.png'),
                      //sizedBox
                      const SizedBox(width: 4),
                      //title
                      Text(
                        'Protected purchase. Cancel anytime',
                        style: CustomStyle.appVersion,
                      ),
                    ],
                  ),
                ),
                //policy
                Padding(
                  padding: const EdgeInsets.only(
                    left: 40,
                    right: 40,
                    top: 24,
                    bottom: 50,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //restore
                      GestureDetector(
                        onTap: () => GoRouter.of(context).pushNamed(
                          '/openUrl',
                          extra: {
                            'title': titles[0],
                            'url': urls[0],
                          },
                        ),
                        child: Text(
                          'Restore',
                          style: CustomStyle.greyText2,
                        ),
                      ),
                      //terms of use
                      GestureDetector(
                        onTap: () => GoRouter.of(context).pushNamed(
                          '/openUrl',
                          extra: {
                            'title': titles[1],
                            'url': urls[1],
                          },
                        ),
                        child: Text(
                          'Terms of Use',
                          style: CustomStyle.greyText2,
                        ),
                      ),
                      //privacy policy
                      GestureDetector(
                        onTap: () => GoRouter.of(context).pushNamed(
                          '/openUrl',
                          extra: {
                            'title': titles[2],
                            'url': urls[2],
                          },
                        ),
                        child: Text(
                          'Privacy Policy',
                          style: CustomStyle.greyText2,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      );
    },
  );
}
