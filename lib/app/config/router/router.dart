import 'dart:developer';

import 'package:flutter/widgets.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:music_app/app/presentation/app.dart';
import 'package:music_app/app/presentation/modules/modules.dart';

import 'routes.dart';

Future<String> getInitialRouteName(BuildContext context) async {
  const FlutterSecureStorage storage = FlutterSecureStorage();
  final url = await storage.read(key: "url");
  final isUrl = url == null ? false : true;
  log(url.toString());
  log('$isUrl');

  if (!isUrl) {
    return Routes.GET_STARTED;
  } else {
    return Routes.HOME;
  }
}

mixin RouterMixin on State<App> {
  GoRouter? _router;
  late String _initialRouteName;
  bool _loading = true;

  // final _loading = ValueNotifier(true);

  bool get loading => _loading;

  GoRouter get router {
    if (_router != null) {
      return _router!;
    }
    final routes = [
      GoRoute(
        name: Routes.HOME,
        path: '/',
        builder: (_, __) => const HomeView(),
      ),
      // GoRoute(
      //   name: Routes.LOGIN,
      //   path: '/login',
      //   builder: (_, __) => const LoginView(),
      // ),
      // GoRoute(
      //   name: Routes.URL_CONNECT,
      //   path: '/url_connect',
      //   builder: (_, __) => const UrlConnectView(),
      // ),
    ];

    final initialLocation = routes
        .firstWhere(
          (element) => element.name == _initialRouteName,
          orElse: () => routes.first,
        )
        .path;

    _router = GoRouter(
      initialLocation: initialLocation,
      routes: routes,
    );

    return _router!;
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback(
      (_) => _init(),
    );
  }

  Future<void> _init() async {
    _initialRouteName = await getInitialRouteName(context);
    await Future.delayed(const Duration(seconds: 2));
    _loading = false;
    setState(() {});
  }
}
