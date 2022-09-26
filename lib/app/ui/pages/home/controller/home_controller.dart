import 'package:flutter/foundation.dart';
import 'package:flutter_meedu/meedu.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class HomeController extends SimpleNotifier {
  final controllerRefrest = RefreshController();
  final OnAudioQuery _audioQuery = OnAudioQuery();

  Future onRefresh() async {
    final audioQuery = await _audioQuery.querySongs();
    final value = await onListSong();
    if (value!.isEmpty) {
      onListSong();
    } else if (value.length == audioQuery.length) {
      onListSong();
    } else if (value.length != audioQuery.length) {
      onListSong();
    }
    await Future.delayed(const Duration(milliseconds: 1000));
    controllerRefrest.refreshCompleted();
    notify();
  }

  Future<List<SongModel>>? onListSong() async {
    final audioQuery = _audioQuery.querySongs();
    //notify();

    notify();

    return audioQuery;
  }

  void requestStoragePermission() async {
    if (!kIsWeb) {
      bool permiissionStatus = await _audioQuery.permissionsStatus();
      if (!permiissionStatus) {
        await _audioQuery.permissionsRequest();
      }
    }
    notify();
  }
}
