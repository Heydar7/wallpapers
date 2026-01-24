import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/widgets/components/colors.dart';
import 'package:wallpaper/widgets/components/text_style.dart';

class Onboarding extends StatelessWidget {
  const Onboarding({super.key});

  @override
  Widget build(BuildContext context) {
    // final controller = PageController();
    // int index = 0;

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

    return PopScope(
      canPop: false,
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        //screen
        body: SafeArea(
          child: Column(
            children: [
              //
              Expanded(
                child: PageView.builder(
                  // controller: controller,
                  itemCount: title.length,
                  onPageChanged: (i) {},
                  itemBuilder: (context, index) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        //text
                        Expanded(
                          flex: 2,
                          child: Image.asset(
                            'assets/wallpaper.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                        //sizedBox
                        const SizedBox(height: 16),
                        //title
                        Text(
                          title[index],
                          style: CustomStyle.onboardingTitle,
                          textAlign: TextAlign.center,
                        ),
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
              )
            ],
          ),
        ),
        //
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(bottom: 45, left: 16, right: 16, top: 32),
          child: GestureDetector(
            onTap: () => context.goNamed('/home'),
            child: Container(
              height: 51,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: CustomColors.purple,
              ),
              child: Text(
                'Next',
                style: CustomStyle.buttonText,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
