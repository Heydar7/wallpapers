import 'package:flutter/material.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';

Widget settingsList(String title, IconData icon, double top) {
  return Padding(
    padding: EdgeInsets.only(
      top: top,
      left: 16,
      right: 16,
    ),
    child: Container(
      height: 56,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: CustomColors.blur.withOpacity(0.5),
      ),
      child: Row(
        children: [
          //icon
          Icon(
            icon,
            size: 24,
            color: CustomColors.purple,
          ),
          //sizedBox
          const SizedBox(width: 10),
          //text
          Text(
            title,
            style: CustomStyle.greyText,
          ),
        ],
      ),
    ),
  );
}
