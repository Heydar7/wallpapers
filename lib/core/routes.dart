import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/shell.dart';
import 'package:wallpaper/feature/auth/ui/screens/onboarding.dart';
import 'package:wallpaper/feature/auth/ui/screens/splash_screen.dart';
import 'package:wallpaper/feature/catalog/ui/screens/ai.dart';
import 'package:wallpaper/feature/catalog/ui/screens/favorites.dart';
import 'package:wallpaper/feature/catalog/ui/screens/home.dart';
import 'package:wallpaper/feature/catalog/ui/screens/live.dart';
import 'package:wallpaper/feature/catalog/ui/screens/more_wallpapers.dart';
import 'package:wallpaper/feature/catalog/ui/screens/settings.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/full_image.dart';
import 'package:wallpaper/feature/catalog/ui/widgets/ios_lockscreen.dart';

CustomTransitionPage animation(GoRouterState state, Widget child) {
  return CustomTransitionPage(
    key: state.pageKey,
    child: child,
    transitionsBuilder: (context, animation, secondaryAnimation, child) {
      return FadeTransition(
        opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
        child: child,
      );
    },
  );
}

List<RouteBase> routes = [
  //splash screen
  GoRoute(
    path: '/splash',
    name: '/splash',
    builder: ((context, state) => const SplashScreen()),
  ),
  //onboarding
  GoRoute(
    path: '/onboarding',
    name: '/onboarding',
    pageBuilder: (context, state) {
      return animation(state, const Onboarding());
    },
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
      return animation(
        state,
        const IOSLockScreenPreview(
          wallpaper: NetworkImage(
            'https://picsum.photos/1200/2400',
          ),
        ),
      );
    },
  ),

  //favorites
  GoRoute(
    path: '/favorites',
    name: '/favorites',
    builder: ((context, state) => const Favorites()),
  ),

  //shell route with navbar
  ShellRoute(
    pageBuilder: (context, state, child) {
      return animation(state, Shell(child: child));
    },
    routes: [
      //home
      GoRoute(
        path: '/home',
        name: 'home',
        pageBuilder: (context, state) => const NoTransitionPage(child: Home()),
      ),

      //live
      GoRoute(
        path: '/live',
        name: '/live',
        pageBuilder: (context, state) => const NoTransitionPage(child: Live()),
      ),

      //ai
      GoRoute(
        path: '/ai',
        name: '/ai',
        pageBuilder: (context, state) => const NoTransitionPage(child: AI()),
      ),

      //settings
      GoRoute(
        path: '/settings',
        name: '/settings',
        pageBuilder: (context, state) => const NoTransitionPage(
          child: Settings(),
        ),
      ),
    ],
  ),
];
