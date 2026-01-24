import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:iconly/iconly.dart';
import 'package:wallpaper/widgets/components/colors.dart';

class FullImage extends StatefulWidget {
  final String path;
  const FullImage({super.key, required this.path});

  @override
  State<FullImage> createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          //image
          GestureDetector(
            onTap: () => GoRouter.of(context).pushNamed('/iosLockScreen'),
            child: Image.asset(
              widget.path,
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
          ),
          //appbar
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(
                left: 8,
                right: 8,
                top: 16,
                bottom: 16,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //left
                  GestureDetector(
                    onTap: () => context.pop(),
                    child: const Icon(
                      Icons.close_rounded,
                      color: CustomColors.white,
                      size: 28,
                    ),
                  ),
                  //heart
                  GestureDetector(
                    child: const Icon(
                      IconlyLight.heart,
                      color: CustomColors.white,
                      size: 28,
                    ),
                  ),
                ],
              ),
            ),
          ),
          //button
          Positioned(
            bottom: 50,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                child: Container(
                  height: 64,
                  width: 64,
                  padding: const EdgeInsets.all(12),
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: CustomColors.white,
                  ),
                  child: Image.asset(
                    'assets/download.png',
                    height: 32,
                    width: 32,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
