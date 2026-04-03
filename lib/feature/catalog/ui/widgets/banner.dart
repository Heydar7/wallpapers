import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/theme/text_style.dart';

Widget bannerSliver(String title, String subtitle, String image, BuildContext context) {
  return SliverToBoxAdapter(
    child: Padding(
      padding: const EdgeInsets.all(16),
      child: GestureDetector(
        onTap: () => GoRouter.of(context).pushNamed(
          '/moreWallpapers',
          extra: 'iOS 26',
        ),
        child: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            image: const DecorationImage(
              fit: BoxFit.cover,
              image: AssetImage('assets/banner.png'),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                image,
                height: 36,
                width: 36,
              ),
              const SizedBox(height: 17),
              Text(
                title,
                style: CustomStyle.bannerHeadline,
              ),
              const SizedBox(height: 4),
              Text(
                subtitle,
                style: CustomStyle.bannerSubtitle,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
