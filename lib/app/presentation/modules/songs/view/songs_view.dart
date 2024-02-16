import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/widgets/global_widgets.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsView extends HookConsumerWidget {
  const SongsView({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final AudioPlayer _player = AudioPlayer ();
    final OnAudioQuery audioQuery = OnAudioQuery();

    return FutureBuilder<List>(
      future: audioQuery.querySongs(),
      builder: (context, item) {
        if (item.data == null) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (item.data!.isEmpty) {
          return const Center(
            child: Text("No Song Found"),
          );
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: item.data!.length,
          itemBuilder: (context, index) {
            final SongModel song = item.data![index];

            return ItemSong(
              title: song.title,
              artist: song.artist.toString(),
              cover: song.id,
              onTap: () {
                // String? uri = item.data![index].uri;

                // _player.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
                // _player.play();
              },
            );
          },
        );
      },
    );
  }
}
