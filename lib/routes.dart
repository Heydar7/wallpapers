import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/screens/home/home.dart';
import 'package:wallpaper/widgets/components/shell.dart';
import 'package:wallpaper/widgets/splash_screen.dart';

List<RouteBase> routes = [
  //splash screen
  GoRoute(
    path: '/splash',
    name: '/splash',
    builder: ((context, state) => const SplashScreen()),
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
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const Placeholder(),
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

      //ai
      GoRoute(
        path: '/ai',
        name: '/ai',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const Placeholder(),
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

      //settings
      GoRoute(
        path: '/settings',
        name: '/settings',
        pageBuilder: (context, state) {
          return CustomTransitionPage(
            key: state.pageKey,
            child: const Placeholder(),
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
    ],
  ),
];
