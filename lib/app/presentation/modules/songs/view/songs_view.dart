import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/widgets/global_widgets.dart';
import 'package:on_audio_query/on_audio_query.dart';

class SongsView extends HookConsumerWidget {
  const SongsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OnAudioQuery audioQuery = OnAudioQuery();
    // final AudioPlayer _player = AudioPlayer ();

    return FutureBuilder<List>(
      future: audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.INTERNAL,
        ignoreCase: true,
      ),
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
            return ItemSong(
              title: item.data![index].title,
              artist: item.data![index].artist.toString(),
              cover: item.data![index].id,
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
