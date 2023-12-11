import 'package:flutter/services.dart';
// import 'package:get_it/get_it.dart';
// import 'package:sendwave/app/data/repositories_impl/domain_url_socket_local_repository_impl.dart';
// import 'package:sendwave/app/domain/repositories/domain_url_socket_local_repository.dart';

// final sl = GetIt.I;

Future<void> injectDependencies() async {
  /// [config vertical app]
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await SystemChrome.setSystemUIChangeCallback(
      (systemOverlaysAreVisible) async {});

  // sl.registerSingleton<DomainUrlSocketLocalRepository>(
  //     DomainUrlSocketLocalRepositoryImpl());
}