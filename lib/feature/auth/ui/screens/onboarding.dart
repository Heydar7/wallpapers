import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  final controller = PageController();
  int index = 0;
  bool get isLast => index == title.length - 1;

  final title = [
    'Live Wallpapers',
    '3D Wallpapers',
    'Create AI Wallpapers',
  ];

  final subtitle = [
    'Say goodbye to boring wallpapers.\nYour lock screen deserves more.',
    'Bring depth to your iOS 26 lock screen with \nimmersive spatial wallpapers.',
    'Type a prompt and watch AI create wallpapers \ninstantly. No limits, just imagination.',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        //screen
        body: SafeArea(
          child: PageView.builder(
            controller: controller,
            itemCount: title.length,
            onPageChanged: (i) => setState(() => index = i),
            itemBuilder: (context, index) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  //sizedBox
                  const SizedBox(height: 16),
                  //text
                  Expanded(
                    child: Image.asset(
                      'assets/mockup.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  //sizedBox
                  const SizedBox(height: 24),
                  //title
                  Text(
                    title[index],
                    style: CustomStyle.onboardingTitle,
                    textAlign: TextAlign.center,
                  ),
                  //sizedBox
                  const SizedBox(height: 4),
                  //subtitle
                  Text(
                    subtitle[index],
                    style: CustomStyle.bannerSubtitle.copyWith(
                      color: CustomColors.white.withOpacity(0.5),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              );
            },
          ),
        ),
        //
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(
            bottom: 50,
            left: 16,
            right: 16,
            top: 24,
          ),
          child: GestureDetector(
            onTap: () {
              if (isLast) {
                context.goNamed('/home');
                return;
              }
              controller.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeOut,
              );
            },
            child: Container(
              height: 51,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: CustomColors.purple,
              ),
              child: Text(
                isLast ? 'Start' : 'Next',
                style: CustomStyle.buttonText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
