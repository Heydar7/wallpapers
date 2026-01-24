import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/widgets/components/colors.dart';
import 'package:wallpaper/widgets/components/text_style.dart';

gridView(
  bool isHorizontal,
  bool isLive,
  int count,
  context,
) {
  return SizedBox(
    height: isHorizontal ? 214 : MediaQuery.of(context).size.height,
    child: GridView.builder(
      itemCount: count,
      shrinkWrap: true,
      padding: const EdgeInsets.all(8),
      physics: isHorizontal
          ? const ScrollPhysics()
          : const NeverScrollableScrollPhysics(),
      scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
      gridDelegate: isHorizontal
          //
          ? const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              mainAxisSpacing: 8,
              mainAxisExtent: 120,
            )
          //
          : const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              mainAxisSpacing: 8,
              crossAxisSpacing: 8,
              mainAxisExtent: 195,
            ),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () => GoRouter.of(context).pushNamed(
            '/fullImage',
            extra: 'assets/wallpaper.png',
          ),
          child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: CustomColors.purple,
                //image
                image: const DecorationImage(
                  image: AssetImage('assets/wallpaper.png'),
                  fit: BoxFit.cover,
                ),
              ),
              //
              child: isLive
                  ? Stack(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 8, left: 8),
                          child: Container(
                            width: 61,
                            height: 30,
                            padding: const EdgeInsets.all(5),
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: CustomColors.blur.withOpacity(0.75),
                            ),
                            child: Row(
                              children: [
                                //icon
                                Image.asset(
                                  'assets/live.png',
                                  height: 18,
                                  width: 18,
                                ),
                                //sizedBox
                                const SizedBox(width: 5),
                                //live
                                Text(
                                  'Live',
                                  style: CustomStyle.live,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )
                  : null),
        );
      },
    ),
  );
}
