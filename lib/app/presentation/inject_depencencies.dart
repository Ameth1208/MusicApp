import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:on_audio_query/on_audio_query.dart';
// import 'package:get_it/get_it.dart';
// import 'package:sendwave/app/data/repositories_impl/domain_url_socket_local_repository_impl.dart';
// import 'package:sendwave/app/domain/repositories/domain_url_socket_local_repository.dart';

// final sl = GetIt.I;

Future<void> injectDependencies() async {
  /// [config vertical app]
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

  await SystemChrome.setSystemUIChangeCallback(
      (systemOverlaysAreVisible) async {});

//Permisos App
  Future<void> SongChanges() async {
    final OnAudioQuery audioQuery = OnAudioQuery();
    if (!kIsWeb) {
      bool permiissionStatus = await audioQuery.permissionsStatus();
      if (!permiissionStatus) {
        await audioQuery.permissionsRequest();
      }
    }

    // sl.registerSingleton<DomainUrlSocketLocalRepository>(
    //     DomainUrlSocketLocalRepositoryImpl());
  }
}
