import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:wallpaper/core/theme/colors.dart';

abstract class CustomStyle {
  static final _base = GoogleFonts.sen(
    decoration: TextDecoration.none,
    textBaseline: TextBaseline.alphabetic,
  );
  //onboarding title
  static final TextStyle onboardingTitle = _base.copyWith(
    fontSize: 32,
    fontWeight: FontWeight.w900,
    color: CustomColors.white,
  );
  //button text
  static final TextStyle buttonText = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w600,
    color: CustomColors.white,
  );

  //home
  static final TextStyle title = _base.copyWith(
    fontSize: 28,
    fontWeight: FontWeight.w600,
    color: CustomColors.white,
  );
  //pro
  static final TextStyle pro = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: CustomColors.white,
  );
  //banner headline
  static final TextStyle bannerHeadline = _base.copyWith(
    fontSize: 22,
    fontWeight: FontWeight.w600,
    color: CustomColors.white,
  );
  //banner subtitle
  static final TextStyle bannerSubtitle = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CustomColors.white,
  );
  //wallpapers title
  static final TextStyle wallpapersTitle = _base.copyWith(
    fontSize: 18,
    fontWeight: FontWeight.w500,
    color: CustomColors.white,
  );
  //more
  static final TextStyle more = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: CustomColors.purple,
  );
  //live
  static final TextStyle live = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: CustomColors.white,
  );
  //loading
  static final TextStyle loading = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w600,
    color: CustomColors.white,
  );
  //grey text
  static final TextStyle greyText = _base.copyWith(
    fontSize: 16,
    fontWeight: FontWeight.w400,
    color: CustomColors.white.withOpacity(0.5),
  );
  //grey text 2
  static final TextStyle greyText2 = _base.copyWith(
    fontSize: 12,
    fontWeight: FontWeight.w400,
    color: CustomColors.white.withOpacity(0.5),
  );
  //app version
  static final TextStyle appVersion = _base.copyWith(
    fontSize: 14,
    fontWeight: FontWeight.w400,
    color: CustomColors.white.withOpacity(0.5),
  );
}
