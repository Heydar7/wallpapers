import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/widgets/components/colors.dart';

abstract class CustomStyle {
  //home
  static final TextStyle title = GoogleFonts.sen(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: CustomColors.white,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  //pro
  static final TextStyle pro = GoogleFonts.sen(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: CustomColors.white,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  //banner headline
  static final TextStyle bannerHeadline = GoogleFonts.sen(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: CustomColors.white,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  //banner subtitle
  static final TextStyle bannerSubtitle = GoogleFonts.sen(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CustomColors.white,
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
}
