import 'package:flutter/material.dart';

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
      theme: getTheme(false),
      // theme: getTheme(true),
    );
  }
}
