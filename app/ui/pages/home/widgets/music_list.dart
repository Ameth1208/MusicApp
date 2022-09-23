import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:musicapp/app/ui/widgets/widgets_global.dart';
import 'package:on_audio_query/on_audio_query.dart';

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
  final OnAudioQuery _audioQuery = OnAudioQuery();

//  final AudioPlayer _player = AudioPlayer();

  @override
  void initState() {
    super.initState();
    requestStoragePermission();
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.only(left: 20),
            child: const TextApp.title1(
              text: "Canciones",
              fontWeight: FontWeight.bold,
            ),
          ),
          Expanded(
            child: FutureBuilder<List<SongModel>>(
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
                        onTap: () async {
                          //toast(context, "Playing :${item.data![index].title}");
                          String? uri = item.data![index].uri;
                          //   await _player.setAudioSource(
                          //     AudioSource.uri(
                          //       Uri.parse(uri!),
                          //     ),
                          //   );
                          //   await _player.play();
                        },
                      );
                    },
                  );
                }),
          ),
        ],
      ),
    );
  }

  void requestStoragePermission() async {
    if (!kIsWeb) {
      bool permiissionStatus = await _audioQuery.permissionsStatus();
      if (!permiissionStatus) {
        await _audioQuery.permissionsRequest();
      }
    }
  }
}
