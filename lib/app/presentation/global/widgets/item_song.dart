import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:music_app/app/presentation/global/extension/build_context_text.dart';
import 'package:music_app/app/presentation/global/widgets/cover_song.dart';

class ItemSong extends HookConsumerWidget {
  final String? title, artist;
  final int? cover;
  final VoidCallback? onTap, onCover;

  const ItemSong({
    super.key,
    this.onTap,
    this.onCover,
    this.artist,
    this.cover,
    this.title,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: context.hp(0.8), horizontal: context.wp(2)),
      width: context.wd,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CoverSong(
            cover: cover!,
            border: 0.5,
            width: 12,
          ),
          SizedBox(
            width: context.dp(1),
          ),
          Flexible(
            flex: 5,
            fit: FlexFit.tight,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title!,
                  style: context.textTheme.bodyMedium!.copyWith(
                    color: context.color.scrim,
                  ),
                ),
                Text(
                  artist!,
                  style: context.textTheme.bodySmall!.copyWith(
                    color: context.color.scrim.withOpacity(0.5),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
