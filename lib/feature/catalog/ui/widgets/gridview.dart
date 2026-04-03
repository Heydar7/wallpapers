import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';

int isSelectedIndex = -1;

Widget gridViewSliver(
  bool isHorizontal,
  bool isLive,
  int count,
  BuildContext context,
) {
  if (isHorizontal) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 214,
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          scrollDirection: Axis.horizontal,
          itemCount: count,
          separatorBuilder: (_, __) => const SizedBox(width: 8),
          itemBuilder: (context, index) {
            return SizedBox(
              width: 120,
              child: GridItem(isLive: isLive),
            );
          },
        ),
      ),
    );
  }

  return SliverPadding(
    padding: const EdgeInsets.all(16),
    sliver: SliverGrid(
      delegate: SliverChildBuilderDelegate(
        (context, index) => GridItem(isLive: isLive),
        childCount: count,
      ),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 8,
        crossAxisSpacing: 8,
        mainAxisExtent: 195,
      ),
    ),
  );
}

class GridItem extends StatelessWidget {
  final bool isLive;
  const GridItem({super.key, required this.isLive});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(
        '/fullImage',
        extra: 'assets/wallpaper.png',
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // background image
            const Positioned.fill(
              child: Image(
                image: AssetImage('assets/wallpaper.png'),
                fit: BoxFit.cover,
              ),
            ),

            // live badge
            if (isLive)
              const Positioned(
                top: 8,
                left: 8,
                child: _LiveBadge(),
              ),
          ],
        ),
      ),
    );
  }
}

class _LiveBadge extends StatelessWidget {
  const _LiveBadge();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 61,
      height: 30,
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: CustomColors.blur.withOpacity(0.75),
      ),
      child: Row(
        children: [
          Image.asset('assets/live.png', height: 18, width: 18),
          const SizedBox(width: 5),
          Text('Live', style: CustomStyle.live),
        ],
      ),
    );
  }
}

Widget chooseStyleGrid() {
  return SizedBox(
    height: 329,
    child: GridView.builder(
      itemCount: 10,
      shrinkWrap: true,
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.only(left: 16, right: 16, top: 10, bottom: 8),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        mainAxisExtent: 120,
      ),
      itemBuilder: (context, index) {
        final isSelected = isSelectedIndex == index;
        return GestureDetector(
          onTap: () {
            isSelectedIndex = index;
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                      borderRadius: BorderRadius.circular(10),
                      image: const DecorationImage(
                        image: AssetImage('assets/wallpaper.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  //selected
                  if (isSelected)
                    Image.asset(
                      'assets/selected.png',
                      height: 36,
                      width: 36,
                    ),
                ],
              ),
              //sizedBox
              const SizedBox(height: 10),
              //text
              Text(
                'Style',
                style: isSelected ? CustomStyle.live : CustomStyle.greyText2,
              ),
            ],
          ),
        );
      },
    ),
  );
}
