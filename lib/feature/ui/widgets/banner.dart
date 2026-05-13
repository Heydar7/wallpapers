import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/feature/data/wallpapers_remote_data_source.dart';

class Banners extends StatefulWidget {
  final String name;

  const Banners({super.key, required this.name});

  @override
  State<Banners> createState() => _BannersState();
}

class _BannersState extends State<Banners> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Map<String, dynamic>>>(
      stream: getBannersStream(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          //loading
          return const SliverToBoxAdapter();
        }

        final banners = snapshot.data!;

        final banner = banners.firstWhere(
          (e) => e['image-name'] == widget.name,
        );

        return SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: () => GoRouter.of(context).pushNamed(
                '/moreWallpapers',
                extra: banner['category'],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  banner['imageUrl'],
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
