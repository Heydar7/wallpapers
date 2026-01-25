import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';

wallpapersTitle(String title, context) {
  return GestureDetector(
    onTap: () => GoRouter.of(context).pushNamed(
      '/moreWallpapers',
      extra: title,
    ),
    child: Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
        top: 8,
      ),
      child: Row(
        children: [
          //left
          Text(
            title,
            style: CustomStyle.wallpapersTitle,
          ),
          //spacer
          const Spacer(),
          //right | chevron
          Text(
            'More',
            style: CustomStyle.more,
          ),
          //sizedBox
          const SizedBox(width: 8),
          //heart
          const Icon(
            IconlyLight.arrow_right_2,
            color: CustomColors.purple,
            size: 14,
          ),
        ],
      ),
    ),
  );
}
