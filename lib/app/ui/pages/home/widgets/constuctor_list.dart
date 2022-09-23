import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:on_audio_query/on_audio_query.dart';

import '../../../widgets/widgets_global.dart';

class ConstructorList extends StatefulWidget {
  const ConstructorList({super.key});

  @override
  State<ConstructorList> createState() => _ConstructorListState();
}

class _ConstructorListState extends State<ConstructorList> {
  final OnAudioQuery _audioQuery = OnAudioQuery();
  final AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List>(
      future: _audioQuery.querySongs(
        sortType: null,
        orderType: OrderType.ASC_OR_SMALLER,
        uriType: UriType.EXTERNAL,
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
            child: TextApp(text: "No Song Found"),
          );
        }
        return ListView.builder(
          physics: const BouncingScrollPhysics(),
          itemCount: item.data!.length,
          itemBuilder: (context, index) {
            return CustomListTile(
              title: item.data![index].title,
              artist: item.data![index].artist.toString(),
              cover: item.data![index].id,
              onTap: () {
                String? uri = item.data![index].uri;

                _player.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
                _player.play();
              },
            );
          },
        );
      },
    );
  }
}
