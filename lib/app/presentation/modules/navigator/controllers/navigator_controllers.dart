import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:on_audio_query/on_audio_query.dart';

class NavigatorController extends ChangeNotifier {
  NavigatorController();

  final PageController? pageController = PageController();
  final OnAudioQuery _audioQuery = OnAudioQuery();

  void onPageView(int page) {
    pageController?.animateToPage(
      page,
      duration: const Duration(milliseconds: 500),
      curve: Curves.fastEaseInToSlowEaseOut,
    );
    notifyListeners();
  }

  Future<List<SongModel>>? onListSong() async {
    final audioQuery = _audioQuery.querySongs();
    notifyListeners();
    return audioQuery;
  }

  void requestStoragePermission() async {
    if (!kIsWeb) {
      bool permiissionStatus = await _audioQuery.permissionsStatus();
      if (!permiissionStatus) {
        await _audioQuery.permissionsRequest();
      }
    }
    notifyListeners();
  }
}
