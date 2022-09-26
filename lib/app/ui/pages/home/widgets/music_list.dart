import 'package:flutter/material.dart';
import 'package:flutter_meedu/ui.dart';
import 'package:just_audio/just_audio.dart';
import 'package:musicapp/app/ui/pages/home/controller/home_provider.dart';
import 'package:musicapp/app/ui/widgets/widgets_global.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../../../helpers/helpers_global.dart';

class MusicList extends StatefulWidget {
  const MusicList({super.key});

  @override
  State<MusicList> createState() => _MusicListState();
}

class _MusicListState extends State<MusicList> {
//  final AudioPlayer _player = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    final controller = homeControllerProvider.read;
    controller.onRefresh();
    return Expanded(
      child: SmartRefresher(
        //physics: const BouncingScrollPhysics(),
        enablePullDown: true,
        enablePullUp: false,
        header: const ClassicHeader(
          completeIcon:
              Icon(Icons.check_circle_sharp, color: ColorApp.textColor),
          completeText: 'Actualizado',
          refreshingText: 'Actualizando...',
          //idleText: 'Deslice para actualizar saldo',
          textStyle: TextStyle(color: ColorApp.textColor),
          releaseText: 'Suelte para refrescar',
        ),
        controller: controller.controllerRefrest,
        onRefresh: () => controller.onRefresh(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              //margin: const EdgeInsets.all(20),
              child: const TextApp.title1(
                text: canciones,
                fontWeight: FontWeight.bold,
              ),
            ),
            const ListMusic(),
          ],
        ),
      ),
    );
  }
}

class ListMusic extends StatelessWidget {
  const ListMusic({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = homeControllerProvider.read;
    //final OnAudioQuery audioQuery = OnAudioQuery();
    final AudioPlayer player = AudioPlayer();
    return Expanded(
      child: Consumer(
        builder: (_, ref, __) {
          final controller = ref.watch(homeControllerProvider);
          final listAudio = controller.onListSong();
          return FutureBuilder<List<SongModel>>(
            future: listAudio,
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
                      player.setAudioSource(AudioSource.uri(Uri.parse(uri!)));
                      player.play();
                    },
                  );
                },
              );
            },
          );
        },
      ),
    );
  }
}
