import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/floating_button.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/popup.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/scroll.dart';

class AI extends StatefulWidget {
  const AI({super.key});

  @override
  State<AI> createState() => _AIState();
}

class _AIState extends BaseScrollScreen<AI> {
  TextEditingController controller = TextEditingController();

  bool isLoading = false;

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
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'Choose a style',
                        style: CustomStyle.wallpapersTitle,
                      ),
                    ),
                  ),
                ),
                //gird
                SliverToBoxAdapter(
                  child: chooseStyleGrid(),
                ),
                //button
                if (controller.text.isNotEmpty)
                  SliverPadding(
                    padding: const EdgeInsets.all(16),
                    sliver: SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {
                          setState(() => isLoading = true);

                          Future.delayed(const Duration(seconds: 2), () {
                            if (!context.mounted) return;
                            context.pushNamed(
                              '/fullImage',
                              extra: 'assets/wallpaper.png',
                            );
                            setState(() => isLoading = false);
                          });
                        },
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
            if (isLoading) loading(() {}),
          ],
        ),
        //
        floatingActionButton: floatingButton(scrollController),
      ),
    );
  }
}
