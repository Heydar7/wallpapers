import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/banner.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/scroll.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/settings_list.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends BaseScrollScreen<Settings> {
  final titles = [
    'Terms of Use',
    'Privacy Policy',
    'Share',
    'Contact Us',
    'Rate Us',
  ];

  final icons = [
    IconlyBold.paper,
    IconlyBold.lock,
    IconlyBold.send,
    IconlyBold.message,
    IconlyBold.star,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      body: CustomScrollView(
        controller: scrollController,
        slivers: [
          //appBar
          appBarWithPremiumIcon(
            title: "Settings",
            context: context,
            scrolled: isScrolled,
          ),
          //banner
          bannerSliver(
            'Get Premium',
            'Unlock all features and decorate your phone',
            'assets/crown.png',
            context,
          ),
          //list
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                return GestureDetector(
                  onTap: () => GoRouter.of(context).pushNamed(
                    '/openUrl',
                    extra: titles[index],
                  ),
                  child: settingsList(
                    titles[index],
                    icons[index],
                    index == 0 ? 8 : 10,
                  ),
                );
              },
              childCount: titles.length,
            ),
          ),
          //version
          SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 120),
                child: Text('App Version 1.0.0', style: CustomStyle.appVersion),
              ),
            ),
          ),
        ],
      ),
      //
      floatingActionButton: floatingButton(scrollController)
    );
  }
}
