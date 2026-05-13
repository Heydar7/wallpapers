import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';
import 'package:wallpaper/feature/ui/widgets/popup.dart';

SliverAppBar appBarWithPremiumIcon({
  required String title,
  required BuildContext context,
  required bool scrolled,
}) {
  return SliverAppBar(
    pinned: true,
    toolbarHeight: 56,
    elevation: 0,
    scrolledUnderElevation: 0,
    automaticallyImplyLeading: false,
    surfaceTintColor: CustomColors.transparent,
    backgroundColor: CustomColors.transparent,
    flexibleSpace: Stack(
      fit: StackFit.expand,
      children: [
        //
        AnimatedOpacity(
          duration: const Duration(milliseconds: 180),
          opacity: scrolled ? 1 : 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 66, sigmaY: 66),
              child: Container(
                color: CustomColors.blur.withOpacity(0.75),
              ),
            ),
          ),
        ),
        //
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 6,
              top: 11.5,
            ),
            child: Row(
              children: [
                //title
                Text(
                  title,
                  style: CustomStyle.title,
                ),
                //
                const Spacer(),
                //premium
                GestureDetector(
                  onTap: () => premiumPopup(context),
                  child: Container(
                    height: 32,
                    width: 61,
                    alignment: Alignment.center,
                    padding: const EdgeInsets.all(7),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: CustomColors.purple,
                    ),
                    child: Row(
                      children: [
                        //
                        Image.asset('assets/crown.png', height: 18, width: 18),
                        //
                        const SizedBox(width: 8),
                        //
                        Text('Pro', style: CustomStyle.pro),
                      ],
                    ),
                  ),
                ),
                //
                const SizedBox(width: 8),
                //like
                GestureDetector(
                  onTap: () => GoRouter.of(context).pushNamed('/favorites'),
                  child: Icon(
                    IconlyLight.heart,
                    color: CustomColors.white.withOpacity(0.50),
                    size: 28,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}

SliverAppBar appBarWithTitle({
  required String title,
  required BuildContext context,
  required bool scrolled,
}) {
  return SliverAppBar(
    pinned: true,
    toolbarHeight: 56,
    elevation: 0,
    surfaceTintColor: CustomColors.transparent,
    backgroundColor: CustomColors.transparent,
    automaticallyImplyLeading: false,
    flexibleSpace: Stack(
      fit: StackFit.expand,
      children: [
        //
        AnimatedOpacity(
          duration: const Duration(milliseconds: 180),
          opacity: scrolled ? 1 : 0,
          child: ClipRect(
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 66, sigmaY: 66),
              child: Container(
                color: CustomColors.blur.withOpacity(0.75),
              ),
            ),
          ),
        ),
        //
        SafeArea(
          bottom: false,
          child: Padding(
            padding: const EdgeInsets.only(
              left: 16,
              right: 16,
              bottom: 6,
              top: 11.5,
            ),
            child: Row(
              children: [
                //
                GestureDetector(
                  onTap: () => context.pop(),
                  child: const Icon(
                    IconlyLight.arrow_left_2,
                    color: CustomColors.purple,
                    size: 24,
                  ),
                ),
                //
                Expanded(
                  child: Center(
                    child: Text(
                      title,
                      style: CustomStyle.wallpapersTitle,
                    ),
                  ),
                ),
                //
                const SizedBox(width: 24),
              ],
            ),
          ),
        ),
      ],
    ),
  );
}
