import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/widgets/components/colors.dart';
import 'package:wallpaper/widgets/components/text_style.dart';

wallpapersTitle(String title) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
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
  );
}
