import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/appbar.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/gridview.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/popup.dart';

class AI extends StatefulWidget {
  const AI({super.key});

  @override
  State<AI> createState() => _AIState();
}

class _AIState extends State<AI> {
  TextEditingController controller = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: CustomColors.backgroundColor,
        //screen
        body: SingleChildScrollView(
          child: SafeArea(
            child: Stack(
              children: [
                //content
                Column(
                  children: [
                    //appBar
                    appBarWithPremiumIcon('AI Generation', context),
                    //title
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Describe your prompt',
                          style: CustomStyle.wallpapersTitle,
                        ),
                      ),
                    ),
                    //text field
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 10,
                        bottom: 8,
                      ),
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

                        //
                        onChanged: (value) {},
                        //
                        onEditingComplete: () {
                          FocusScope.of(context).unfocus();
                        },
                        //
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.all(16),
                          hintText:
                              'Describe what you want with details.\nExample: Portrait of a cat wearing a hat',
                          hintStyle: CustomStyle.appVersion,
                          filled: true,
                          fillColor: CustomColors.blur.withOpacity(0.75),
                          counterText: '',
                          //enabled
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16),
                            borderSide: BorderSide.none,
                          ),
                          //focused
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

                    //style title
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 16,
                        right: 16,
                        top: 16,
                      ),
                      child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Choose a style',
                          style: CustomStyle.wallpapersTitle,
                        ),
                      ),
                    ),
                    //grid
                    chooseStyleGrid(() {
                      setState(() {
                        isSelected = !isSelected;
                      });
                    }),

                    //button
                    if (controller.text.isNotEmpty)
                      Padding(
                        padding: const EdgeInsets.all(16),
                        child: GestureDetector(
                          onTap: () => setState(() {
                            isLoading = true;
                            Future.delayed(const Duration(seconds: 2), () {
                              // ignore: use_build_context_synchronously
                              context.pushNamed(
                                '/fullImage',
                                extra: 'assets/wallpaper.png',
                              );
                              setState(() {
                                isLoading = false;
                                
                              });
                            });
                          }),
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
                  ],
                ),
                //loading
                if (isLoading) loading(() {}),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
