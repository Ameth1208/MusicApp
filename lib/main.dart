import 'package:flutter/material.dart';
import 'package:musicapp/app/inject.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await injectDependencies();

  runApp(const MyApp());
}