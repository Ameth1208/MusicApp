import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:on_audio_query/on_audio_query.dart';

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

//Permisos App
  Future<void> SongChanges() async {
    final OnAudioQuery audioQuery = OnAudioQuery();
    if (!kIsWeb) {
      bool permiissionStatus = await audioQuery.permissionsStatus();
      if (!permiissionStatus) {
        await audioQuery.permissionsRequest();
      }
    }
  }

//Changes Shared List
  Future<Map<int, SongModel>> ListSong() async {
    final OnAudioQuery audioQuery = OnAudioQuery();

    final List<SongModel> something = await audioQuery.querySongs();

    final list = something.asMap();
    return list;
  }

  final list = ListSong();
}

class ListSong {}
