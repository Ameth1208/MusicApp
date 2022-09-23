import 'package:flutter/services.dart';

Future<void> injectDependencies() async {
  /// [config color navigationBarSystem]
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      //systemNavigationBarColor: CustomColor.primary,
      //statusBarColor: CustomColor.secondary,
      statusBarBrightness: Brightness.light,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarIconBrightness: Brightness.light,
    ),
  );
}
