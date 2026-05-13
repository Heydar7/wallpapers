import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/core/shell.dart';
import 'package:wallpaper/feature/ui/navbar/ai.dart';
import 'package:wallpaper/feature/ui/screens/favorites.dart';
import 'package:wallpaper/feature/ui/navbar/home.dart';
import 'package:wallpaper/feature/ui/navbar/live.dart';
import 'package:wallpaper/feature/ui/screens/more_wallpapers.dart';
import 'package:wallpaper/feature/ui/screens/open_url.dart';
import 'package:wallpaper/feature/ui/navbar/settings.dart';
import 'package:wallpaper/feature/ui/screens/full_image.dart';
import 'package:wallpaper/feature/ui/screens/ios_lockscreen.dart';
import 'package:wallpaper/feature/ui/auth/onboarding.dart';
import 'package:wallpaper/feature/ui/auth/splash_screen.dart';

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
      final data = state.extra as Map<String, dynamic>;
      final list = data['list'] as List<String>;
      final number = data['number'] as int;

      return FullImage(
        images: list,
        number: number,
      );
    }),
  ),
  //ios lock screen
  GoRoute(
    path: '/iosLockScreen',
    name: '/iosLockScreen',
    pageBuilder: (context, state) {
      final image = state.extra! as String;
      return animation(
        state,
        IOSLockScreenPreview(wallpaper: image),
      );
    },
  ),

  //favorites
  GoRoute(
    path: '/favorites',
    name: '/favorites',
    builder: ((context, state) => const Favorites()),
  ),
  //open url
  GoRoute(
    path: '/openUrl',
    name: '/openUrl',
    builder: (context, state) {
      final data = state.extra as Map<String, String>;
      final title = data['title']!;
      final url = data['url']!;

      return OpenUrl(
        title: title,
        url: url,
      );
    },
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
