import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';

Widget appBarWithPremiumIcon(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 11.5),
    child: Row(
      children: [
        //left
        Text(
          title,
          style: CustomStyle.title,
        ),
        //spacer
        const Spacer(),
        //right | pro
        Container(
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
              //icon
              Image.asset(
                'assets/crown.png',
                height: 18,
                width: 18,
              ),
              //sizedBox
              const SizedBox(width: 8),
              //text
              Text(
                'Pro',
                style: CustomStyle.pro,
              ),
            ],
          ),
        ),
        //sizedBox
        const SizedBox(width: 8),
        //heart
        GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(
            '/favorites',
          ),
          child: Icon(
            IconlyLight.heart,
            color: CustomColors.white.withOpacity(0.50),
            size: 28,
          ),
        ),
      ],
    ),
  );
}

Widget appBarWithTitle(String title, BuildContext context) {
  return Padding(
    padding: const EdgeInsets.only(left: 16, right: 16, bottom: 6, top: 11.5),
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
              title,
              style: CustomStyle.wallpapersTitle,
            ),
          ),
        ),
      ],
    ),
  );
}
