import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:musicapp/app/ui/routes/export_routes.dart';
import 'package:musicapp/app/ui/routes/router.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(),
      ),

      /// ROUTER CONFIG
      key: router.appKey,
      navigatorKey: router.navigatorKey,
      navigatorObservers: [router.observer],
      routes: appRoutes,
      initialRoute: Routes.HOME,
    );
  }
}
