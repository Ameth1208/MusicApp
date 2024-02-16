import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';
import 'package:music_app/app/presentation/global/widgets/cover_song.dart';
import 'package:on_audio_query/on_audio_query.dart';

class AlbumnsView extends HookConsumerWidget {
  const AlbumnsView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OnAudioQuery audioQuery = OnAudioQuery();

    return FutureBuilder<List>(
      future: audioQuery.queryAlbums(
        uriType: UriType.EXTERNAL,
        orderType: OrderType.ASC_OR_SMALLER,
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
        return GridView.builder(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(
            horizontal: context.wp(3),
            vertical: context.hp(2),
          ),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            crossAxisSpacing: context.wp(2),
            mainAxisSpacing: context.hp(2),
            mainAxisExtent: context.hp(26),
          ),
          // physics: const BouncingScrollPhysics(),

          itemCount: item.data!.length,
          itemBuilder: (context, index) {
            final AlbumModel album = item.data![index];

            return Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoverSong(
                  cover: album.id,
                  border: 0.5,
                  width: 40,
                  type: ArtworkType.ALBUM,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: context.wp(2)),
                  constraints: BoxConstraints.expand(height: context.hp(7)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          context.limitarTexto(album.album, 25),
                          textAlign: TextAlign.start,
                          style: context.textTheme.bodySmall
                              ?.copyWith(color: context.color.scrim),
                        ),
                        Text(
                          context.limitarTexto(album.artist.toString(), 20),
                          textAlign: TextAlign.start,
                          style: context.textTheme.labelSmall?.copyWith(
                            color: context.color.scrim.withOpacity(0.5),
                          ),
                        ),
                      ]),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
