import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';
import 'package:wallpaper/feature/data/ai_remote_data_source.dart';
import 'package:wallpaper/feature/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/ui/widgets/popup.dart';
import 'package:wallpaper/feature/ui/widgets/scroll.dart';

class AI extends StatefulWidget {
  const AI({super.key});

  @override
  State<AI> createState() => _AIState();
}

class _AIState extends BaseScrollScreen<AI> {
  final PageController pageController = PageController();
  TextEditingController controller = TextEditingController();

  int isSelectedIndex = -1;
  int itemsPerPage = 6;

  bool isLoading = false;
  int loaded = 0;

  Future<void> onTapFunc() async {
    setState(() {
      isLoading = true;
      loaded = 0;
    });

    try {
      //count
      for (int i = 0; i <= 50; i++) {
        await Future.delayed(const Duration(milliseconds: 55));
        if (!mounted) return;
        setState(() {
          loaded = i;
        });
      }
      //get
      final images = await PexelsApi().searchHdImages(
        buildSearchQuery(
          controller.text,
          isSelectedIndex < 0 ? '' : styles[isSelectedIndex],
        ),
      );
      //100
      if (!mounted) return;
      setState(() {
        loaded = 100;
      });

      //open screen
      if (!context.mounted) return;
      GoRouter.of(context).pushNamed(
        '/fullImage',
        extra: {
          'list': images,
          'number': 0,
        },
      );
    } finally {
      //close
      if (mounted) {
        setState(() {
          isLoading = false;
          loaded = 0;
        });
      }
    }
  }

  final styles = [
    'Neon Drift',
    'Dreamcore Echo',
    'Void Minimal',
    'Holo Grid',
    'Bio Flow',
    'Retro Future',
    'Crystal Dimension',
    'Cosmic Drift',
    'Paper Reality',
    'Shadow Neon',
    'Digital Rain',
    'Soft Utopia',
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        body: Stack(
          children: [
            //content
            CustomScrollView(
              controller: scrollController,
              slivers: [
                //appBar
                appBarWithPremiumIcon(
                  title: "AI Generation",
                  context: context,
                  scrolled: isScrolled,
                ),
                //title
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Describe your prompt',
                        style: CustomStyle.wallpapersTitle,
                      ),
                    ),
                  ),
                ),
                //textField
                SliverPadding(
                  padding: const EdgeInsets.only(
                    left: 16,
                    right: 16,
                    top: 10,
                    bottom: 8,
                  ),
                  sliver: SliverToBoxAdapter(
                    child: TextFormField(
                      cursorColor: CustomColors.purple,
                      controller: controller,
                      keyboardType: TextInputType.multiline,
                      keyboardAppearance: Brightness.dark,
                      textAlignVertical: TextAlignVertical.center,
                      textInputAction: TextInputAction.continueAction,
                      textCapitalization: TextCapitalization.sentences,
                      enableSuggestions: false,
                      autocorrect: false,
                      style: CustomStyle.bannerSubtitle,
                      autofocus: false,
                      maxLines: 4,
                      onEditingComplete: () => FocusScope.of(context).unfocus(),
                      decoration: InputDecoration(
                        contentPadding: const EdgeInsets.all(16),
                        hintText:
                            'Describe what you want with details.\nExample: Portrait of a cat wearing a hat',
                        hintStyle: CustomStyle.appVersion,
                        filled: true,
                        fillColor: CustomColors.blur.withOpacity(0.75),
                        counterText: '',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide.none,
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: CustomColors.purple,
                            width: 1,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                //choose a style
                SliverPadding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
                  sliver: SliverToBoxAdapter(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        //
                        Text(
                          'Choose a style',
                          style: CustomStyle.wallpapersTitle,
                        ),
                        //sizedBox
                        const SizedBox(width: 20),
                        //
                        SmoothPageIndicator(
                          controller: pageController,
                          count: 2,
                          effect: CustomizableEffect(
                            activeDotDecoration: DotDecoration(
                              width: 35,
                              height: 4,
                              color: CustomColors.white,
                              borderRadius: BorderRadius.circular(5),
                            ),
                            dotDecoration: DotDecoration(
                              width: 9,
                              height: 4,
                              color: CustomColors.white.withOpacity(0.5),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            spacing: 6,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                //gird
                SliverToBoxAdapter(
                  child: SizedBox(
                    height: 329,
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: (styles.length / 6).ceil(),
                      itemBuilder: (context, pageIndex) {
                        final startIndex = pageIndex * 6;

                        return Padding(
                          padding: const EdgeInsets.only(
                            top: 10,
                            bottom: 8,
                          ),
                          child: Wrap(
                            spacing: 10,
                            runSpacing: 10,
                            alignment: WrapAlignment.center,
                            children: List.generate(6, (index) {
                              final realIndex = startIndex + index;
                              final selected = isSelectedIndex == realIndex;
                              return GestureDetector(
                                onTap: () => setState(() {
                                  isSelectedIndex = realIndex;
                                }),
                                child: Column(
                                  children: [
                                    //image | selected
                                    Stack(
                                      alignment: Alignment.center,
                                      children: [
                                        //image
                                        Container(
                                          width: 120,
                                          height: 120,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            image: DecorationImage(
                                              image: AssetImage(
                                                'assets/ai-styles/${styles[realIndex].toLowerCase()}.png',
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        //selected
                                        if (selected)
                                          Image.asset(
                                            'assets/selected.png',
                                            height: 36,
                                            width: 36,
                                          ),
                                      ],
                                    ),
                                    //sizedBox
                                    const SizedBox(height: 6),
                                    //text
                                    Text(
                                      styles[realIndex],
                                      style: selected
                                          ? CustomStyle.live
                                          : CustomStyle.greyText2,
                                    ),
                                  ],
                                ),
                              );
                            }),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                //button
                if (controller.text.isNotEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () => onTapFunc(),
                        child: Container(
                          height: 51,
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: CustomColors.purple,
                          ),
                          child: Text(
                            'Start Generation',
                            style: CustomStyle.buttonText,
                          ),
                        ),
                      ),
                    ),
                  ),
                //
                const SliverToBoxAdapter(child: SizedBox(height: 24)),
              ],
            ),
            //loading
            if (isLoading) loading(loaded.toDouble()),
          ],
        ),

        //
        floatingActionButton: floatingButton(scrollController),
      ),
    );
  }
}
