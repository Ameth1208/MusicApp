import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:music_app/app/generated/translations.g.dart';
import 'package:music_app/app/presentation/app.dart';
import 'package:music_app/app/presentation/inject_depencencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();

  runApp(ProviderScope(
    child: TranslationProvider(
      child: const App(),
    ),
  ));
}
