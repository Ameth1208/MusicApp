import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

void play(String uri) async {
  AudioPlayer audioPlayer = AudioPlayer();
  audioPlayer.stop();
  audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(uri)));

  //toast(context, "Playing :${item.data![index].title}");
  //audioPlayer.setAudioSource(AudioSource.uri Function(Uri.parse(uri),));
  await audioPlayer.play();
}

class PlaySong extends StatefulWidget {
  final String? uri;
  const PlaySong({
    super.key,
    this.uri,
  });

  @override
  State<PlaySong> createState() => _PlaySongState();
}

class _PlaySongState extends State<PlaySong> {
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  void initState() {
    super.initState();
    audioPlayer.stop();

    audioPlayer.setAudioSource(AudioSource.uri(Uri.parse(widget.uri!)));

    //toast(context, "Playing :${item.data![index].title}");
    //audioPlayer.setAudioSource(AudioSource.uri Function(Uri.parse(uri),));
    audioPlayer.play();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
