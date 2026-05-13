import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget floatingButton(ScrollController scrollController) {
  bool isScrolled = scrollController.hasClients && scrollController.offset > 0;

  return Visibility(
    visible: isScrolled,
    child: GestureDetector(
      onTap: () => scrollController.animateTo(
        0,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      ),
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.blur.withValues(alpha:0.75),
        ),
        child: const Icon(
          IconlyBold.arrow_up_2,
          size: 24,
          color: CustomColors.white,
        ),
      ),
    ),
  );
}

Widget floatingButtonForURL(bool isScrolled, WebViewController controller) {
  return Visibility(
    visible: isScrolled,
    child: GestureDetector(
      onTap: () async {
        await controller.runJavaScript(
          'window.scrollTo({ top: 0, left: 0, behavior: "smooth" });',
        );
      },
      child: Container(
        height: 56,
        width: 56,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: CustomColors.blur.withValues(alpha:0.75),
        ),
        child: const Icon(
          IconlyBold.arrow_up_2,
          size: 24,
          color: CustomColors.white,
        ),
      ),
    ),
  );
}
