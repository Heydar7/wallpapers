import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wallpaper/routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Nescafe',
      routerConfig: _router,
    );
  }

  final GoRouter _router = GoRouter(
    initialLocation: "/splash",
    routes: routes,
  );
}