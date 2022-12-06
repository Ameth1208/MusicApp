import 'package:flutter_meedu/meedu.dart';
import 'package:musicapp/app/ui/helpers/helpers_global.dart';

class ListSongController extends SimpleNotifier {
  OnAudioQuery audioQuery = OnAudioQuery();

  List<SongModel>? _listSong = [];

  List<SongModel>? get listSong => _listSong;

  void onListSong() {
    _listSong = audioQuery.querySongs() as List<SongModel>?;
    notify();
  }
}
