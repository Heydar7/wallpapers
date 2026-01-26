import 'package:flutter/material.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/settings_list.dart';

class Settings extends StatelessWidget {
  const Settings({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomColors.backgroundColor,
      //screen
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              //appBar
              appBarWithPremiumIcon('Settings', context),
              //banner
              Padding(
                padding: const EdgeInsets.all(16),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    // height: 140,
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/banner.png'),
                      ),
                    ),
                    //content
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        //crown
                        Container(
                          height: 36,
                          width: 36,
                          padding: const EdgeInsets.all(9),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: CustomColors.purple,
                          ),
                          child: Image.asset(
                            'assets/crown.png',
                            height: 36,
                            width: 36,
                          ),
                        ),
                        //sizedBox
                        const SizedBox(height: 17),
                        //headline
                        Text(
                          'Get Premium',
                          style: CustomStyle.bannerHeadline,
                        ),
                        //sizedBox
                        const SizedBox(height: 4),
                        //subtitle
                        Text(
                          'Unlock all features and decorate your phone',
                          style: CustomStyle.bannerSubtitle,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              //list
              ListView.builder(
                itemCount: 5,
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  var titles = [
                    'Terms of Use',
                    'Privacy Policy',
                    'Share',
                    'Contact Us',
                    'Rate Us'
                  ];
                  var icons = [
                    IconlyBold.paper,
                    IconlyBold.lock,
                    IconlyBold.send,
                    IconlyBold.message,
                    IconlyBold.star,
                  ];
                  return settingsList(
                    titles[index],
                    icons[index],
                    index == 0 ? 8 : 10,
                  );
                },
              ),
              //sizedBox
              const SizedBox(height: 120),
              //app version
              Text(
                'App Version 1.0.0',
                style: CustomStyle.appVersion,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
