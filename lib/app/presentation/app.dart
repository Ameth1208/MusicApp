import 'package:flutter/material.dart';
import 'package:music_app/app/config/router/router.dart';
import 'package:music_app/app/config/theme/app_theme.dart';
import 'package:music_app/app/presentation/modules/modules.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with RouterMixin {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    if (loading) {
      return const SplashView();
    }

    return MaterialApp.router(
      routerConfig: router,
      debugShowCheckedModeBanner: false,
      theme: getTheme(!true),
    );
  }
}
