import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/shell.dart';
import 'package:wallpaper/feature/auth/ui/screens/onboarding.dart';
import 'package:wallpaper/feature/auth/ui/screens/splash_screen.dart';
import 'package:wallpaper/feature/catalog/ui/screens/home.dart';
import 'package:wallpaper/feature/catalog/ui/screens/more_wallpapers.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/full_image.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/ios_lockscreen.dart';

List<RouteBase> routes = [
  //splash screen
  GoRoute(
    path: '/splash',
    name: '/splash',
    builder: ((context, state) => const SplashScreen()),
  ),
  //more wallpapers
  GoRoute(
    path: '/moreWallpapers',
    name: '/moreWallpapers',
    builder: ((context, state) {
      final title = state.extra! as String;
      return MoreWallpapers(title: title);
    }),
  ),
  //image full screen
  GoRoute(
    path: '/fullImage',
    name: '/fullImage',
    builder: ((context, state) {
      final path = state.extra! as String;
      return FullImage(path: path);
    }),
  ),
  //ios lock screen
  GoRoute(
    path: '/iosLockScreen',
    name: '/iosLockScreen',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const IOSLockScreenPreview(
          wallpaper: NetworkImage(
            'https://picsum.photos/1200/2400',
          ),
        ),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
  ),
  //onboarding
  GoRoute(
    path: '/onboarding',
    name: '/onboarding',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const Onboarding(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
  ),

  //shell route с навбаром
  ShellRoute(
    builder: (context, state, child) {
      return Shell(child: child);
    },
    routes: [
      //home
      GoRoute(
        path: '/home',
        name: '/home',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const Home(),
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              return FadeTransition(
                opacity:
                    CurveTween(curve: Curves.easeInOutCirc).animate(animation),
                child: child,
              );
            },
          );
        },
      ),

      //live
      GoRoute(
        path: '/live',
        name: '/live',
        builder: ((context, state) => const Scaffold()),
      ),

      //ai
      GoRoute(
        path: '/ai',
        name: '/ai',
        builder: ((context, state) => const Scaffold()),
      ),

      //settings
      GoRoute(
        path: '/settings',
        name: '/settings',
        builder: ((context, state) => const Scaffold()),
      ),
    ],
  ),
];
