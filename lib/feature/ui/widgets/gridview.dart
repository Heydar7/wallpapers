import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/theme/colors.dart';
import 'package:wallpaper/core/theme/text_style.dart';

// int isSelectedIndex = -1;

Widget gridViewSliver(
  bool isHorizontal,
  int count,
  List<String> imageUrl,
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
              child: GridItem(
                number: index,
                images: imageUrl,
              ),
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
        (context, index) => GridItem(
          number: index,
          images: imageUrl,
        ),
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

bool isLive(String url) {
  return RegExp(r'\.gif(\?|$)', caseSensitive: false).hasMatch(url);
}

class GridItem extends StatelessWidget {
  final int number;
  final List<String> images;

  const GridItem({
    super.key,
    required this.number,
    required this.images,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => GoRouter.of(context).pushNamed(
        '/fullImage',
        extra: {
          'list': images,
          'number': number,
        },
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Stack(
          children: [
            // background image
            Positioned.fill(
              child: Image(
                image: NetworkImage(images[number]),
                fit: BoxFit.cover,
              ),
            ),

            // live badge
            if (isLive(images[number]))
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
        color: CustomColors.blur.withValues(alpha:0.75),
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
