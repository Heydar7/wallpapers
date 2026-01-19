import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/screens/home/home.dart';
import 'package:wallpaper/widgets/splash_screen.dart';

List<RouteBase> routes = [
  //splash screen
  GoRoute(
    path: '/splash',
    name: '/splash',
    builder: ((context, state) => const SplashScreen()),
  ),
  //home
  GoRoute(
    path: '/home',
    name: '/home',
    pageBuilder: (context, state) {
      return CustomTransitionPage(
        key: state.pageKey,
        child: const Home(),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return FadeTransition(
            opacity: CurveTween(curve: Curves.easeInOutCirc).animate(animation),
            child: child,
          );
        },
      );
    },
  ),
];
