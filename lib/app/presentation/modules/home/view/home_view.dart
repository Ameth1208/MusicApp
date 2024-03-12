import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';
import 'package:music_app/app/presentation/global/widgets/global_widgets.dart';
import 'package:on_audio_query/on_audio_query.dart';

class HomeView extends HookConsumerWidget {
  final String? number;
  const HomeView({super.key, this.number});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final OnAudioQuery audioQuery = OnAudioQuery();

    return FutureBuilder<List>(
      future: audioQuery.queryArtists(
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
            crossAxisCount: 3,
            childAspectRatio: 1,
            crossAxisSpacing: context.wp(2),
            mainAxisSpacing: context.hp(1),
            mainAxisExtent: context.hp(22),
          ),
          // physics: const BouncingScrollPhysics(),

          itemCount: item.data!.length,
          itemBuilder: (context, index) {
            final ArtistModel album = item.data![index];

            return Column(
              // mainAxisAlignment: MainAxisAlignment.start,
              // crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CoverSong(
                  cover: album.id,
                  border: 50,
                  width: 30,
                  type: ArtworkType.ARTIST,
                ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: context.wp(2)),
                  constraints: BoxConstraints.expand(height: context.hp(5)),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          context.limitarTexto(album.artist, 25),
                          textAlign: TextAlign.start,
                          style: context.textTheme.bodySmall
                              ?.copyWith(color: context.color.scrim),
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
